#!/usr/bin/env stack
-- stack runghc --resolver lts-10.0 --package shake --install-ghc

import           Data.Maybe            (fromMaybe)
import           Data.Monoid
import           Development.Shake
import           System.Exit           (ExitCode (..))
import           System.FilePath.Posix

main :: IO ()
main = shakeArgs shakeOptions { shakeFiles=".shake" } $ do

    want [ "cbits/{{ project }}.c" ]

    "cbits/{{ project }}.c" %> \out -> do
        dats <- getDirectoryFiles "" ["ats-src//*.dats"]
        sats <- getDirectoryFiles "" ["ats-src//*.sats"]
        hats <- getDirectoryFiles "" ["ats-src//*.hats"]
        cats <- getDirectoryFiles "" ["ats-src//*.cats"]
        need $ dats <> sats <> hats <> cats
        let patshome = "/usr/local/lib/ats2-postiats-0.3.8"
        (Exit c, Stderr err) <- command [EchoStderr False, AddEnv "PATSHOME" patshome] "patscc" ("-ccats" : dats)
        cmd_ [Stdin err] Shell "pats-filter"
        if c /= ExitSuccess
            then error "patscc failure"
            else pure ()
        cmd ["mv", "{{ project }}_dats.c", "cbits/{{ project }}.c"]

    "clean" ~> do
        cmd_ ["sn", "c"]
        removeFilesAfter "." ["//*.c", "//tags", "build"]
        removeFilesAfter ".shake" ["//*"]

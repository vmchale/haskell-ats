module Main where

import           Criterion.Main
import           Lib

main :: IO ()
main =
    defaultMain [ bgroup "factorial"
                      [ bench "ffactorial" $ nf ffactorial 1000
                      , bench "pureFactorial" $ nf pureFactorial 1000
                      ]
                ]

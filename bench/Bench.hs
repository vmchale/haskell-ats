module Main where

import           Criterion.Main
import           Lib

main :: IO ()
main =
    defaultMain [ bgroup "factorial"
                      [ bench "ffactorial" $ nf ffactorial 12
                      , bench "pureFactorial" $ nf pureFactorial 12
                      ]
                ]

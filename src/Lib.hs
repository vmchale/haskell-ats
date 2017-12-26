{-# LANGUAGE ForeignFunctionInterface #-}

module Lib
    ( ffactorial
    , pureFactorial
    ) where

import           Foreign.C

foreign import ccall unsafe ffactorial :: CInt -> CInt

ffactorial :: Int -> Int
ffactorial = fromIntegral . factorial . fromIntegral

pureFactorial :: Int -> Int
pureFactorial 0 = 1
pureFactorial n = n * pureFactorial (n - 1)

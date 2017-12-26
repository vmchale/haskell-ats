import           Lib
import           Test.Hspec
import           Test.Hspec.QuickCheck

main :: IO ()
main = hspec $
    parallel $ describe "ffactorial" $
        prop "should agree with the pure Haskell function" $
            \x -> x < 1 || x > 12 || ffactorial x == pureFactorial x

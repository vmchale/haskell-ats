import           Distribution.Simple
import           Language.ATS.Package

main :: IO ()
main = defaultMainWithHooks cabalHooks

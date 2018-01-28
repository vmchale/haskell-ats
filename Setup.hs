import           Distribution.ATS
import           Distribution.Simple

main = defaultMainWithHooks $
    atsUserHooks [ atsPrelude [0,3,9] ]

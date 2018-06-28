let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in λ(x : List Natural) →
  prelude.makeHsPkg { x = x, name = "{{ project }}" }

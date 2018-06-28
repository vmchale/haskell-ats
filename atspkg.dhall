let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { libraries =
    [
      prelude.lib ⫽
      { name = "{{ project }}"
      , src = [ "ats-src/{{ project }}.dats" ]
      , libTarget = "dist-newstyle/lib/lib{{ project }}.a"
      }
    ]
  }

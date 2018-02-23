let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/atspkg-prelude.dhall

in prelude.default //
  { libraries =
    [
      prelude.lib //
      { name = "{{ project }}"
      , src = [ "ats-src/{{ project }}.dats" ]
      , libTarget = "dist-newstyle/lib/lib{{ project }}.a"
      }
    ]
  }

let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/atspkg-prelude.dhall

in prelude.default //
  { atsSource = [ "ats-src/{{ project }}.dats" ] }

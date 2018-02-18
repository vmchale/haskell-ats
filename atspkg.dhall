let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/default.dhall

in pkg //
  { atsSource = [ "ats-src/{{ project }}.dats" ] }

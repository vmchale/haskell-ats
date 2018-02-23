let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/atspkg-prelude.dhall

in λ(x : List Integer) → 
  prelude.makePkgDescr { x = x, name = "{{ project }}", githubUsername = "{{ github_username }}" } 

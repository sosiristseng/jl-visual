# Package management

Official documentation: https://pkgdocs.julialang.org/

## Show which package(s) could be updated

```julia
using Pkg
Pkg.status(; outdated=true)
```

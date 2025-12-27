# Visualization

[Summary in a discourse thread by Chris Rackauckas](https://discourse.julialang.org/t/comparison-of-plotting-packages/99860/2)

- https://github.com/JuliaPlots/Plots.jl : powerful and convenient visualization with multiple backends. See also [Plots.jl docs](http://docs.juliaplots.org/latest/)
- https://github.com/JuliaPy/PythonPlot.jl : `matplotlib` in Julia. See also [matplotlib docs](https://matplotlib.org/stable/index.html)
- https://github.com/MakieOrg/Makie.jl : see the [Makie.jl docs](https://docs.makie.org/stable/) for examples.

## PythonPlot.jl tips

Source:
- [Setup Julia](https://sosiristseng.github.io/software-setup/developement/julia/?h=julia+setup#run-python-packages)
- [PyPlot.jl tips](https://sosiristseng.github.io/tips/2024/04/04/pyplotjl-tips)

### "Clean" installation

If you don't want `CondaPkg.jl` install a full conda environment in every project, you can prepare a common environment by `micromamba`.

1. [Install micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html), the minimal Python package manager.
2. Create a conda environment, for example, `micromamba create -n juliapy jupyter matplotlib -y`.
3. Set up the following environment variables

`~/.profile`
```sh
export CONDA_JL_HOME="${HOME}/micromamba/envs/juliapy"
export JULIA_PYTHONCALL_EXE="${CONDA_JL_HOME}/bin/python"
export JULIA_CONDAPKG_BACKEND="Null"
```

4. Rebuild `Conda.jl` or `PythonCall.jl` if necessary.
```julia
] build Conda
] build PythonCall
```

### Save as TIFF

Exporting `pyplot` figures to TIFF images with a specific dpi and LZW compression for publishing.

```julia
using PythonCall
plt.savefig("fig1.tif", dpi=300, pil_kwargs=pydict(Dict("compression" => "tiff_lzw")))
```

### Change default options

```julia
import PythonPlot as plt
plt.matplotlib.rcParams["font.size"] = 14
```

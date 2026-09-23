# landry-contagion

Simulation of contagion processes on network structures, developed as part of undergraduate research in the Landry Lab at UVA.

## Overview

This project models how a state (e.g. infection, information, behavior) spreads across a network. The current prototype implements a simple SI-style (Susceptible-Infected) contagion process, where an infected node has some probability of infecting each susceptible neighbor at every time step.

This repo follows the lab's [project-template](https://github.com/kaiser-dan/project-template) structure, adapted for Julia instead of Python (the template's original language). See `README.md` in each folder for more details and guidelines.

## Project structure

1. `src` — project source code
2. `tests` — unit tests
3. `data` — raw & derived datasets
4. `notebooks` — (timestamped) experiment notebooks
5. `results` — results (figures, tables, etc.)
6. `paper` — manuscripts
7. `workflow` — workflow files and scripts
8. `.gitignore` — temporary and binary files to be ignored by git (Julia coverage/memory files, Manifest.toml if not committing it, editor cruft, etc.)

`libs` and `models` from the original template aren't included yet, TBD with mentor whether they're needed (vendored packages and trained models respectively, may not apply to this kind of simulation work).

## Julia environment

This project uses Julia's built-in package manager (`Pkg`) instead of the template's Python-based `uv`. From the repo root:

```bash
julia --project=.
```

Then, inside the Julia REPL:

```julia
using Pkg
Pkg.instantiate()
```

This installs the exact dependency versions listed in `Manifest.toml`.

### Key files (Julia equivalents of the template's Python files)

- `Project.toml` — project metadata and dependency declarations (equivalent to `pyproject.toml`)
- `Manifest.toml` — reproducible dependency snapshot (equivalent to `uv.lock`)

There's no Julia equivalent yet for `.python-version`, `.envrc`, or `setup.sh`, Julia doesn't need a separate venv/activation step the way Python does; `--project=.` handles that.

### Common commands

```julia
using Pkg
Pkg.add("PackageName")   # Add dependency
Pkg.instantiate()        # Install from Manifest.toml
```

```bash
julia --project=. src/contagion.jl   # Run a script
```

## Linting and formatting

Not yet set up. The Julia equivalent of `ruff` is [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl), worth adding once conventions are settled.

## Pre-commit hooks

Not yet set up. Note that `pre-commit` itself is a Python tool, it would still work here (it can run non-Python commands like Julia scripts), but requires Python installed alongside Julia to use it.

## For AI coding agents

Use the following instructions to initialize.

Commands:

- `julia --project=. -e "using Pkg; Pkg.instantiate()"` — install dependencies
- `julia --project=. -e "using Pkg; Pkg.test()"` — run tests (requires a `test/runtests.jl` file, note the template's `tests/` vs Julia's conventional `test/` naming, TBD which we use)

Conventions:

- Write clean code accompanied by well-designed tests.
- Put reusable code in `src/`, not in notebooks or workflow scripts.
- Timestamp experiment folders: `YYYYMMDD_description`.
- [Type hints / `from project_name import ...` conventions from the original template don't directly apply to Julia yet, current `src/contagion.jl` is a script, not a proper installable Julia module. To match the template's intent, it would need to be restructured as a module with a `Project.toml` `name` field, discuss with mentor.]

## Contributors

[Add names here]
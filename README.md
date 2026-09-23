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
8. `.gitignore` — temporary and binary files to be ignored by git

`libs` and `models` from the original template aren't included yet, TBD with mentor whether they're needed.

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

### Common commands

```julia
using Pkg
Pkg.add("PackageName")   # Add dependency
Pkg.instantiate()        # Install from Manifest.toml
```

```bash
julia --project=. src/contagion.jl   # Run a script
```

## Usage

Run the simulation from the project root:

```bash
julia --project=. src/contagion.jl
```

This runs a toy example: a 5-node path graph, with node 1 seeded as infected, simulated for 10 steps under a fixed 50% transmission probability.

## Resources

- [Getting Started in Julia](https://docs.julialang.org/en/v1/manual/getting-started/) — official manual, install/REPL/syntax basics
- [Graphs.jl documentation](https://juliagraphs.org/Graphs.jl/dev/) — the graph package used throughout `src/`

### Graph generators relevant to sampling a "reasonable" network structure

Once we move past `path_graph` toy examples, these are the built-in generators worth trying, straight from Graphs.jl:

- `erdos_renyi(n, p)` — classic random graph, each edge present with probability `p`
- `watts_strogatz(n, k, β)` — small-world model, starts as a ring lattice and rewires edges with probability `β`
- `barabasi_albert(n, k)` — preferential attachment, produces scale-free (power-law) degree distributions
- `stochastic_block_model(...)` — community-structured random graph, useful if network needs distinct clusters/blocks
- `expected_degree_graph(ω)` / `random_configuration_model(n, k)` — build a graph matching a specified (or expected) degree sequence, closest built-in match to the "Coin-Flipping, Ball-Dropping, Grass-Hopping" paper in the reading list

## Contributors

Rudra Dave
Clairice Lou
Daniel Gao
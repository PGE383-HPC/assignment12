# Homework Assignment 12

![Assignment 12](https://github.com/PGE383-HPC/assignment12/actions/workflows/main.yml/badge.svg)

When parallel tasks are independent from each other, they are called *embarrassingly parallel*.  While there are several ways to approach these problems, including batch schedulers, we can also write simple MPI programs to complete these tasks.

In [Homework Assignment 9](https://github.com/PGE383-HPC/assignment9) we wrote a program that would process a data file, converting the raw data to true stress and strain, and compute the toughness.  If we had multiple data files, we could use this program to process them in parallel on a multi-processor machine.  In the assignment that follows, we will only do this for two data files, but of course, the real utility of writing a parallel program would only be realized if we had many more to process.

Your assignment is to complete the Julia module [assignment12.jl](src/assignment12.jl).  Specifically, you must complete the function `compute_toughness_parallel(path_to_data::String, comm::MPI.Comm)` where `path_to_data` is a string that contains the *file directory path* (not the path to any particular file, just the directory) and `comm` is an `MPI.COMM_WORLD` object.  When the script is executed with the following command:

```bash
$HOME/.julia/bin/mpiexecjl --project=. -np 2 julia src/assignment12.jl data
```

from the assignment root directory, the script should process the two data files `data_0.csv` and `data_1.csv` in parallel.  I am including my solution to [Homework Assignment 9](https://github.com/PGE383-HPC/assignment9) as part of the existing [assignment12.jl](src/assignment12.jl).  The `data` argument in the command above is the path to the data files.

Please run the following commands from the Julia REPL *one time* before starting your assignment to install the *project aware* version of `mpiexec`.

```julia
using MPI; MPI.install_mpiexecjl()
```

after running this command once, you may wish to make `mpiexecjl` permanently available to the command line executable path (so that you don't have type the absolute path, i.e. you can run just `mpiexecjl` instead of `$HOME/.julia/bin/mpiexecjl`). To do this add the line

```bash
export PATH=$HOME/.julia/bin:$PATH
```

to your `$HOME/.bash_profile` file (don't forget to commit and push this change to your `dotfiles` repository so it's always available).

## Testing

To see if you answers are correct, run the following command at the Terminal
command line from the repository's root directory

```bash
julia --project=. -e "using Pkg; Pkg.test()"
```

the tests will run and report if passing or failing.

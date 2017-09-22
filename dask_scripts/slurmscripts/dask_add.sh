#!/bin/bash
#SBATCH --account=geo
#SBATCH --exclusive
#SBATCH -N 3
#SBATCH --ntasks-per-node=16
#SBATCH -J dask
#SBATCH --time=02:30:00
#SBATCH --mail-user=jbusecke@princeton.edu
#SBATCH --mail-type=ALL

# SLURM Template for Princeton Tiger
# Scheduler: SLURM

# This adds workers to the scheduler specified in scheduler.json
DASKDIR=~/.dask_tmp

source activate standard
export XDG_RUNTIME_DIR=""
mpirun --n 12 dask-mpi --nthreads 4 --memory-limit 16e9 --interface ib0 --no-scheduler --local-directory $DASKDIR



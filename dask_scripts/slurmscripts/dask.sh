#!/bin/bash
#PBS -N sample
#!/bin/bash

#SBATCH --account=geo
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH --ntasks-per-node=16
#SBATCH -J dask
#SBATCH --time=06:00:00
#SBATCH --mail-user=jbusecke@princeton.edu
#SBATCH --mail-type=ALL

# SLURM Template for Princeton Tiger
# Scheduler: SLURM

# This writes a scheduler.json file into your home directory
# You can then connect with the following Python code
# >>> from dask.distributed import Client
# >>> client = Client(scheduler_file='~/scheduler.json')

DASKDIR=~/.dask_tmp

source activate standard
export XDG_RUNTIME_DIR=""
rm -f scheduler.json
mpirun --np 4 dask-mpi --nthreads 4 --memory-limit 16e9 --bokeh-port 7771 --interface em1 --local-directory $DASKDIR
#ib0

#--interface ib0


#!/bin/bash

#SBATCH --account=geo
#SBATCH --exclusive
#SBATCH -N 2
#SBATCH --ntasks-per-node=16
#SBATCH -J notebook
#SBATCH --time=2:00:00
#SBATCH --mail-user=jbusecke@princeton.edu
#SBATCH --mail-type=ALL

export XDG_RUNTIME_DIR=""
source activate standard
jupyter notebook

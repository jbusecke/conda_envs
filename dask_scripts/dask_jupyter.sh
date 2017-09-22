#!/bin/bash
source activate standard
SOURCEDIR=~/code/conda_envs/dask_scripts
python $SOURCEDIR/start_notebook.py $(hostname)

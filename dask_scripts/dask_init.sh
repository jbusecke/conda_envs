#!/bin/bash
DASKDIR=~/.dask_tmp

source activate standard
rm scheduler.json
dask-scheduler --local-directory $DASKDIR --bokeh-port 9991 --scheduler-file scheduler.json --interface 'ib0' &
# -interface 'ib0' lets see if the dashboard works without this...
dask-worker --scheduler-file scheduler.json --nthreads 2 --nprocs 15 --local-directory $DASKDIR --interface 'ib0' &


#python start_notebook.py

#!/bin/bash
DASKDIR=~/.dask_tmp

# This script sets up a dask scheduler on a local cluster (tigressdata/princeton in this case). No need to invoke 'ib0' here since the processors are all linked locally?
source activate standard

cd $HOME
rm scheduler.json

echo ${pwd}
dask-scheduler --bokeh-port 9991 --local-directory $DASKDIR --scheduler-file scheduler.json &
dask-worker --nthreads 2 --nprocs 10 --local-directory $DASKDIR --scheduler-file scheduler.json &

#!/bin/bash
# Setup file directory from scratch
rootdir=$1

mkdir -p $rootdir/projects $rootdir/notebooks $rootdir/shared_data
if [ -d "$rootdir/code/conda_envs" ]; then
        ln -s $rootdir/code/conda_envs/init_project.sh .
else
	echo 'init_project file not found...check code directory'
fi

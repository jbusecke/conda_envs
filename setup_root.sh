#!/bin/bash
# Setup file directory from scratch
rootdir=$1
if [ -d "$rootdir" ];then
  cd $rootdir
  mkdir projects notebooks shared_data
fi
if [ -d "code/conda_envs" ]; then
        ln -s $rootdir/code/conda_envs/init_project.sh .
else
	echo 'init_project file not found...check code directory'
fi

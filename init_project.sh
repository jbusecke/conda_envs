#!/bin/zsh
rootdir=$1
proj_name=$2
#echo $rootdir
#echo $proj_name

if [ -d "$rootdir" ]; then
	cd $rootdir
	CURRDIR=pwd
	if [ -d "projects" ]; then
  		mkdir -p projects/$proj_name/code
		echo "project folder created in $CURRDIR/projects/$proj_name"
	else
		echo 'projects folder not found'
	fi

	if [ -d "notebooks" ]; then
                mkdir -p notebooks/$proj_name
								echo 'notebook folder created in $rootdir/projects/$proj_name'
        else
                echo 'notebooks folder not found'
        fi
	cd projects/$proj_name
	# WHY THE FLYING FUCK DOES THIS NOT WORK? This drives me mad!
	ln -sf ../../notebooks/$proj_name code
	echo 'Project $proj_name initialized'
else
	echo 'rootdir does not exist'
fi

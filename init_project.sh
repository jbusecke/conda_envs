rootdir=$1
proj_name=$2
#echo $rootdir
#echo $proj_name

if [ -d "$rootdir" ]; then
	if [ -d "$rootdir/projects" ]; then
  		mkdir -p $rootdir/projects/$proj_name
		echo 'project folder created in $rootdir/projects/$proj_name'
	else
		echo 'projects folder not found'
	fi
	
	if [ -d "$rootdir/notebooks" ]; then
                mkdir -p $rootdir/notebooks/$proj_name
		echo 'notebook folder created in $rootdir/projects/$proj_name'
        else
                echo 'notebooks folder not found'
        fi

	ln -s $rootdir/notebooks/$proj_name $rootdir/projects/$proj_name/code
else
	echo 'rootdir does not exist'
fi
echo 'Project $proj_name initialized'

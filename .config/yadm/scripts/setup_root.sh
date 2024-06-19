#! /bin/bash
#

FILES=$(find  $HOME/.config/yadm/root/ -type f)

for file in $FILES; do
	base=$(basename $file)
	folder=$(dirname $file | sed 's/.*\/root\///')
	echo "Copying $file to /$folder/$base"
	sudo cp $file /$folder/$base
done

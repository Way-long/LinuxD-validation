#!/bin/sh

DIR=$1

if [ -d "$DIR" ]; then
	rm -r $DIR
	if [ -d "$DIR" ]; then
		echo "cannot create new directory [$DIR]"
		fuser -v -m "$DIR"
		exit 1
	fi
fi

$(dirname $0)/cmd.sh "mkdir -p '$DIR'"
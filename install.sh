#!/usr/bin/env bash

for file in home/.[^.]*; do
	ln --symbolic --verbose --force $(readlink -f $file) $HOME;
done

if [ -n "$1" ]; then
	HD_DIR="hardware-dependent/$1"
	if [ ! -d "$HD_DIR" ]; then
		echo "Nothing to do for hardware named '$1'."
		exit
	fi
	pushd $HD_DIR
	./install.sh
	popd
fi

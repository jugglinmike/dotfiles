#!/usr/bin/env bash

for file in home/.[^.]*; do
	ln --symbolic --verbose --force $(readlink -f $file) $HOME;
done

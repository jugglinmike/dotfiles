#!/usr/bin/env bash

sudo ln --symbolic --verbose $(readlink -f xorg.conf.d) /etc/X11

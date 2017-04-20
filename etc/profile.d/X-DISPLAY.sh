#!/bin/bash
if [ -z "$DISPLAY" ]
then
	# Automatically determine an unused $DISPLAY
	d=0
	while true ; do
	    [ -e "/tmp/.X$d-lock" -o -S "/tmp/.X11-unix/X$d" ] || break
	    kill -0 `cat /tmp/.X$d-lock` 2>/dev/null && export DISPLAY=":$d" && break
	    d=$(($d + 1))
	done
	unset d
fi

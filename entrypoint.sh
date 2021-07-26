#!/usr/bin/env sh

if [ "$1" = "-c" ]; then
    /bin/sh "$@"
else
    exec ibmcloud "$@"
fi

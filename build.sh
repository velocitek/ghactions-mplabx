#!/bin/sh

# Support passing project / context as environment variable or run parameters
PROJECT=${PROJECT:-$1}
CONF=${CONF:-$2}

echo "Docker Container Building $PROJECT:$CONF"

set -x -e

/opt/mplabx/mplab_platform/bin/prjMakefilesGenerator.sh $PROJECT@$CONF || exit 1
make -C $PROJECT CONF=$CONF build || exit 2

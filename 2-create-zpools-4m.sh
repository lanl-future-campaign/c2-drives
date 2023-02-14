#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

$curdir/2-create-zpools.sh 4M

exit 0

#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

$curdir/2-create-zpools.sh 8M

exit 0

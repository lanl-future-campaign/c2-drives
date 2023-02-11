#!/bin/bash -xu

#
# create all zpools enabled. reset recordsize to 128K. will be loading the zfs kernel module
#
curdir=$(cd `dirname $0` && pwd)

$curdir/2-create-zpools-16m.sh 128K

exit 0

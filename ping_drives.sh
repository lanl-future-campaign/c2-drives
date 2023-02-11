#!/bin/bash -u

#
# say hello to all drives
#
curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

n=$(cat num_drives)

pushd drives

for dr in `ls -d1 */ | cut -d/ -f1 | head -n $n`
do
	sudo ssh $dr "hostname -I"
done

popd

exit 0

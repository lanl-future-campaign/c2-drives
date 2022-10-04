#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

max_number_drives=40

pushd drives

for dr in `ls -d1 */ | cut -d/ -f1 | head -n $max_number_drives`
do
	sudo ssh $dr "cd /root/src/c2-tcollector && git checkout . && git pull"
done

popd

exit 0

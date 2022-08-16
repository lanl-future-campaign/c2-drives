#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

echo $((16*1024*1024)) | sudo tee /sys/module/zfs/parameters/zfs_max_recordsize

if [ `sudo zpool list -Ho name | wc -l` -ne 0 ]
then
	echo "FOUND ONE OR MORE ZPOOLS ONLINE!!"
	exit 0
fi	

pushd zpools

for pl in `ls -d1 */ | cut -d/ -f1`
do
	pushd $pl
	sudo zpool create -f -O recordsize=4M $pl `cat type` `cat drives`
	popd
done

popd

exit 0

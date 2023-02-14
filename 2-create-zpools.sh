#!/bin/bash -xu

#
# create all zpools enabled. will be loading the zfs kernel module
#
recordsize=${1-'16M'}

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

sudo modprobe zfs || exit 1
sudo lsmod | grep zfs

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
	sudo zpool create -f -O recordsize=$recordsize $pl `cat type` `cat drives`
	popd
done

popd

exit 0

#!/bin/bash -xu

#
# disconnect and reconnect to all available kinetic drives. number of drives can
# be limited through the "num_drives" conf file. will be loading the nvme_tcp kernel module.
#
curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

if [ `sudo zpool list -Ho name | wc -l` -ne 0 ]
then
	echo "FOUND ONE OR MORE ZPOOLS ONLINE!!"
	exit 0
fi

sudo nvme disconnect-all

sudo modprobe nvme_tcp || exit 1
sudo lsmod | grep nvme

n=$(cat num_drives)

pushd drives

for dr in `ls -d1 */ | cut -d/ -f1 | head -n $n`
do
	echo $dr
	sudo nvme connect-all -t tcp -a $dr -s 4420
done

popd

exit 0

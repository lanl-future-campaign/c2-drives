#!/bin/bash -xu

#
# shutdown and restart the nvme target service running in each kinetic drive.
# number of drives can be limited through the "num_drives" file. all currently connected drives will be disconnected.
#
curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

if [ `sudo zpool list -Ho name | wc -l` -ne 0 ]
then
	echo "FOUND ONE OR MORE ZPOOLS ONLINE!!"
	exit 0
fi

sudo umount /mnt ### /mnt may be using a nvmeof drive

sudo nvme disconnect-all

n=$(cat num_drives)

pushd drives

sudo pdsh -R ssh -w `ls -1 | grep -v txt | sort | head -n $n | tr '\n' ','` '/root/nvmetcli/nvmetcli clear && /root/nvmetcli/nvmetcli restore nvmet.json && echo OK'

popd

exit 0

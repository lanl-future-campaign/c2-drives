#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

if [ `sudo zpool list -Ho name | wc -l` -ne 0 ]
then
	echo "FOUND ONE OR MORE ZPOOLS ONLINE!!"
	exit 0
fi

sudo nvme disconnect-all

pushd drives

for dr in `ls -d1 */ | cut -d/ -f1`
do
	echo $dr
	sudo ssh $dr "/root/nvmetcli/nvmetcli clear && /root/nvmetcli/nvmetcli restore nvmet.json" 
done

popd

exit 0

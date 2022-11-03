#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

if [ `sudo zpool list -Ho name | wc -l` -ne 0 ]
then
	echo "FOUND ONE OR MORE ZPOOLS ONLINE!!"
	exit 0
fi

sudo nvme disconnect-all

n=$(cat num_drives)

pushd drives

sudo pdsh -R ssh -w `ls -1 | grep -v txt | sort | head -n $n | tr '\n' ','` '/root/nvmetcli/nvmetcli clear && /root/nvmetcli/nvmetcli restore nvmet.json && echo OK'

popd

exit 0

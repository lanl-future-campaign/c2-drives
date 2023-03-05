#!/bin/bash -u

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

n=$(cat num_drives)

pushd drives

if true; then
	sudo pdsh -R ssh -w `ls -1 | grep -v txt | sort | head -n $n | tr '\n' ','` 'hostname -I'
else
	for dr in `ls -d1 */ | cut -d/ -f1 | head -n $n`; do
		sudo ssh $dr "hostname -I"
	done
fi

popd

exit 0

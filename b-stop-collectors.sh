#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

max_number_drives=40

pushd drives

sudo pdsh -R ssh -w `ls -1 | grep -v txt | sort | head -n $max_number_drives | tr '\n' ','` \
	'/root/src/c2-tcollector/bin/2-stop-collector.sh && echo OK!'

popd

exit 0

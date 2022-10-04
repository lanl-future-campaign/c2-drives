#!/bin/bash -xu

curdir=$(cd `dirname $0` && pwd)

cd $curdir || exit 1

max_number_drives=40

pushd drives

sudo pdsh -R ssh -w `ls -1 | grep -v txt | sort | head -n $max_number_drives | tr '\n' ','` \
	'rm -rf /tmp/tcollector* && echo OK!'

popd

exit 0

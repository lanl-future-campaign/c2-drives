#!/bin/bash -xu

for pl in `sudo zpool list -Ho name`
do
	sudo zpool destroy $pl
done

exit 0

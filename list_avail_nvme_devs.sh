#!/bin/bash

for ctl in `ls -1 /sys/devices/virtual/nvme-fabrics/ctl | grep nvme`
do
	for dev in `ls -1 /sys/devices/virtual/nvme-fabrics/ctl/$ctl | grep $ctl`
	do
		echo $dev
	done
done

exit 0

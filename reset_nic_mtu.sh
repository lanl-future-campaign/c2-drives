#!/bin/bash -x

for dev in enp193s0 enp193s0d1 enp5s0 enp5s0d1 bond0 
do
	sudo ip link set dev $dev mtu ${1-'9000'} 
done

exit 0

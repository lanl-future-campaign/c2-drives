#!/bin/bash -xu

#
# destroy all zpools we currently have. all zpools should be destroyed or exported
# before low-level drive operations (reboot drives) can happen
#
for pl in `sudo zpool list -Ho name`
do
	sudo zpool destroy $pl
done

exit 0

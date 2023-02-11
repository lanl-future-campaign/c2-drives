#!/bin/bash

sudo nvme connect-all -t tcp -a 192.168.1.251 -s 4420 || exit 0
sudo mkfs.ext4 /dev/disk/by-id/nvme-uuid.a4094c31-7dfa-451d-8c19-e3d7209c830a

exit 0

#!/bin/bash

# Make sure everything's compiled
ninja vstart -j$(nproc)
ninja osdmaptool

# Setup variables
num_osd=4
num_rgw=2

# Set up vstart cluster
OSD=$num_osd RGW=$num_rgw ../src/vstart.sh --debug --new -x --localhost --bluestore
sleep 2
./bin/ceph osd pool set .mgr pg_num 8
./bin/ceph osd pool set .mgr pg_num_min 8
printf "\n\n"
echo "Created a vstart cluster with $num_osd OSDs and $num_rgw RGWs."

# Getting Started

1.    Clone the ceph repository: https://github.com/ceph/ceph
2.    Install dependencies (details here: https://github.com/ceph/ceph/#readme)
3.    `cd ceph/build`
6.    Run the `setup_vstart.sh` while in the build directory
7.    Run the `read_balancer_demo.sh` while in the build directory once the cluster settles (wait for `HEALTH_OK`)
8.    After the demo, stop the cluster with `../src/stop.sh`

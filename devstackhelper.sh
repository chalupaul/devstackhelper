#!/bin/bash

if [ `whoami` != "root" ]
then 
    echo You must be root to run this.
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -qy install git emacs23-nox

git clone https://github.com/openstack-dev/devstack
cd devstack

GENLOCALRC=${GENLOCALRC:-genlocalrc.sh}
if [ ! -f $GENLOCALRC ]; then
    curl -o $GENLOCALRC https://raw.github.com/chalupaul/devstackhelper/master/genlocalrc.sh
fi
source $GENLOCALRC

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -qy install git emacs23-nox

cd devstack
genlocalrc

./stack.sh
cd -

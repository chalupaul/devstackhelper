#!/bin/bash

if [ `whoami` != "root" ]
then 
    echo You must be root to run this.
    exit 1
fi

source genlocalrc.sh

screen apt-get update
screen apt-get -qy install git emacs23-nox
git clone https://github.com/openstack-dev/devstack
cd devstack
genlocalrc

#./stack.sh
cd -

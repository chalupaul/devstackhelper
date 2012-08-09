#!/bin/bash

if [ `whoami` != "root" ]
then 
    echo You must be root to run this.
    exit 1
fi

source genlocalrc.sh

# Chicken and the egg problem with screen. Apt-get has a tendency to
# eat your input buffer and thus is not very good at being
# scriptified. Screen protects us from the tyranny of lousy
# programming. This should be safe though (tested on ubuntu 12.04)

if [ `dpkg -l screen 2>&1 | grep -vP "^No packages found" | wc -l` -eq 0 ]; then
    apt-get -qy install screen
fi

screen apt-get update
screen apt-get -qy install git emacs23-nox
git clone https://github.com/openstack-dev/devstack
cd devstack
genlocalrc

./stack.sh
cd -

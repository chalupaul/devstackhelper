#!/bin/bash
if [ `whoami` != "root" ]
then 
    echo You must be root to run this.
    exit 1
fi
GIT_NAME=${GIT_NAME:-openstack}
GIT_BASE=${GIT_BASE:-https://github.com}
GIT_PATH="${GIT_BASE}/${GIT_NAME}"
screen apt-get update
screen apt-get -qy install git emacs23-nox
git clone https://github.com/openstack-dev/devstack
cd devstack
cat << EOF > localrc
CINDER_REPO=${CINDER_REPO:-${GIT_PATH}/cinder}
CINDER_BRANCH=${CINDER_BRANCH:-master}
CINDERCLIENT_REPO=${CINDERCLIENT_REPO:-${GIT_PATH}/python-cinderclient}
CINDERCLIENT_BRANCH=${CINDERCLIENT_BRANCH:-master}
NOVA_REPO=${NOVA_REPO:-${GIT_PATH}/nova}
NOVA_BRANCH=${NOVA_BRANCH:-master}
SWIFT_REPO=${SWIFT_REPO:-${GIT_PATH}/swift}
SWIFT_BRANCH=${SWIFT_BRANCH:-master}
SWIFT3_REPO=${SWIFT3_REPO:-https://github.com/fujita/swift3}
SWIFT3_BRANCH=${SWIFT3_BRANCH:-master}
SWIFTCLIENT_REPO=${SWIFTCLIENT_REPO:-${GIT_PATH}/python-swiftclient}
SWIFTCLIENT_BRANCH=${SWIFTCLIENT_BRANCH:-master}
GLANCE_REPO=${GLANCE_REPO:-${GIT_PATH}/glance}
GLANCE_BRANCH=${GLANCE_BRANCH:-master}
GLANCECLIENT_REPO=${GLANCECLIENT_REPO:-${GIT_PATH}/python-glanceclient}
GLANCECLIENT_BRANCH=${GLANCECLIENT_BRANCH:-master}
KEYSTONE_REPO=${KEYSTONE_REPO:-${GIT_PATH}/keystone}
KEYSTONE_BRANCH=${KEYSTONE_BRANCH:-master}
NOVNC_REPO=${NOVNC_REPO:-https://github.com/kanaka/noVNC}
NOVNC_BRANCH=${NOVNC_BRANCH:-master}
HORIZON_REPO=${HORIZON_REPO:-${GIT_PATH}/horizon}
HORIZON_BRANCH=${HORIZON_BRANCH:-master}
NOVACLIENT_REPO=${NOVACLIENT_REPO:-${GIT_PATH}/python-novaclient}
NOVACLIENT_BRANCH=${NOVACLIENT_BRANCH:-master}
OPENSTACKCLIENT_REPO=${OPENSTACKCLIENT_REPO:-${GIT_PATH}/python-openstackclient}
OPENSTACKCLIENT_BRANCH=${OPENSTACKCLIENT_BRANCH:-master}
KEYSTONECLIENT_REPO=${KEYSTONECLIENT_REPO:-${GIT_PATH}/python-keystoneclient}
KEYSTONECLIENT_BRANCH=${KEYSTONECLIENT_BRANCH:-master}
QUANTUM_REPO=${QUANTUM_REPO:-${GIT_PATH}/quantum}
QUANTUM_BRANCH=${QUANTUM_BRANCH:-master}
QUANTUM_CLIENT_REPO=${QUANTUM_CLIENT_REPO:-${GIT_PATH}/python-quantumclient}
QUANTUM_CLIENT_BRANCH=${QUANTUM_CLIENT_BRANCH:-master}
TEMPEST_REPO=${TEMPEST_REPO:-${GIT_PATH}/tempest}
TEMPEST_BRANCH=${TEMPEST_BRANCH:-master}
MELANGE_REPO=${MELANGE_REPO:-${GIT_PATH}/melange}
MELANGE_BRANCH=${MELANGE_BRANCH:-master}
MELANGECLIENT_REPO=${MELANGECLIENT_REPO:-${GIT_PATH}/python-melangeclient}
MELANGECLIENT_BRANCH=${MELANGECLIENT_BRANCH:-master}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-admin}
RABBIT_PASSWORD=${RABBIT_PASSWORD:-admin}
SERVICE_TOKEN=${SERVICE_TOKEN:-admin}
SERVICE_PASSWORD=${SERVICE_PASSWORD:-admin}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-admin}
EOF

./stack.sh
cd -

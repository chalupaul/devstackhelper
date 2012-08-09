devstackhelper
==============

Devstack's Lil' Helper

This is a simple bash shell script to make customizing devstack a little by letting
you use bash variables to override the github locations that it pulls down. It also 
kicks off a new install.


For examples!
=============

By default, devstack yanks from https://github.com/openstack/<PROJECT>. Well, if you
have forked your stuff you may not want to just download and add remote masters for things
only to forget where things are and screw you up later (I'm a lazy dev).

By exporting some variables in your .bash_profile, you can switch branches and forks to
any project on devstack.

This would change the name of the github repo owner from openstack to chalupaul

    export GIT_NAME=chalupaul

This would change https://github.com to https:/my.private.git.repo

    export GIT_BASE=https://my.private.git.repo


Some more practical examples:

    export CINDER_REPO=http://github.com/chalupaul/nova

    export CINDER_BRANCH=my_feature_branch

The total list of variables you can configure is as follows:

+ GIT_NAME
+ GIT_BASE
+ CINDER_REPO
+ CINDER_BRANCH
+ CINDERCLIENT_REPO
+ CINDERCLIENT_BRANCH
+ NOVA_REPO
+ NOVA_BRANCH
+ SWIFT_REPO
+ SWIFT_BRANCH
+ SWIFT3_REPO
+ SWIFT3_BRANCH
+ SWIFTCLIENT_REPO
+ SWIFTCLIENT_BRANCH
+ GLANCE_REPO
+ GLANCE_BRANCH
+ GLANCECLIENT_REPO
+ GLANCECLIENT_BRANCH
+ KEYSTONE_REPO
+ KEYSTONE_BRANCH
+ NOVNC_REPO
+ NOVNC_BRANCH
+ HORIZON_REPO
+ HORIZON_BRANCH
+ NOVACLIENT_REPO
+ NOVACLIENT_BRANCH
+ OPENSTACKCLIENT_REPO
+ OPENSTACKCLIENT_BRANCH
+ KEYSTONECLIENT_REPO
+ KEYSTONECLIENT_BRANCH
+ QUANTUM_REPO
+ QUANTUM_BRANCH
+ QUANTUM_CLIENT_REPO
+ QUANTUM_CLIENT_BRANCH
+ TEMPEST_REPO
+ TEMPEST_BRANCH
+ MELANGE_REPO
+ MELANGE_BRANCH
+ MELANGECLIENT_REPO
+ MELANGECLIENT_BRANCH
+ MYSQL_PASSWORD
+ RABBIT_PASSWORD
+ SERVICE_TOKEN
+ SERVICE_PASSWORD
+ ADMIN_PASSWORD

If what you're looking for isnt in that list, it probably means I haven't updated this to a 
new variable in devstack.

I is ams installings?!
======================

Next, pop yourself a brand new instance in some cloud and run this:

    bash <(curl -fsSk https://raw.github.com/chalupaul/devstackhelper/master/devstackhelper.sh)

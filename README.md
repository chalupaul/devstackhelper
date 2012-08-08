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

`export GIT_NAME=chalupaul `

This would change https://github.com to https:/my.private.git.repo

`export GIT_BASE=https://my.private.git.repo `


Some more practical examples:

`export CINDER_REPO=http://github.com/chalupaul/nova`

`export CINDER_BRANCH=my_feature_branch`

I is ams installings?!
======================

Pop yourself a brand new instance in some cloud and run this:

`bash <(curl -fsSk https://raw.github.com/chalupaul/devstackhelper/master/devstackhelper.sh)`

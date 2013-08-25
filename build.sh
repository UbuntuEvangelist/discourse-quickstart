#!/bin/bash

set -x

#TODO allow to pass application name
#TODO handle smtp env vars setup (user input password/login)

rhc app create discourse ruby-1.9
rhc cartridge add postgresql-9.2 -a discourse
rhc add-cartridge http://cartreflect-claytondev.rhcloud.com/reflect?github=smarterclayton/openshift-redis-cart
git remote add upstream -m master git@github.com:liquidautumn/discourse-quickstart.git
git pull -s recursive -X theirs upstream master
git push

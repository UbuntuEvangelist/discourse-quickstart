# Discourse Openshift Quickstart

## Setup

Create application with Postgresql and Redis support. There is no in house Redis cartrige at Openshift, so third-party one will be used.

*NOTE: No security updates come with Redis cartridge, have to watch for dangers on your own.*

```Bash
$ rhc app create discourse ruby-1.9
$ rhc cartridge add postgresql-9.2 -a discourse
$ rhc cartridge add http://cartreflect-claytondev.rhcloud.com/reflect?github=smarterclayton/openshift-redis-cart -a discourse
```

add quickstart upstream and get the code

```Bash
$ git remote add upstream -m master git@github.com:liquidautumn/discourse-quickstart.git
$ git pull -s recursive -X theirs upstream master
```

Create .openshift/smtp.env with valid SMTP credentials

Put your valid SMTP credentials to smtp.env and put smtp.env to openshift.
Discourse set up to user Amazon SES by default, if you're about to use different SMTP provider, remember to update config/environments/production.rb.openshift


```Bash
$ cp .openshift/smtp.env.sample .openshift/smtp.env
$ nano .openshift/smtp.env
$ scp .openshift/smtp.env `rhc app show | grep -oP '(?<=SSH:     )[^ ]*'`:app-root/data
```

Now deploy it to the Openshift

```Bash
$ git push
```

## Update

To update quickstart you have to add discource remote repository and update your local copy

```Bash
$ git remote add discourse git@github.com:discourse/discourse.git
$ git pull discourse master
```

checkout required version to corresponding branch

```Bash
$ git checkout tags/v0.9.6.1 -b v0.9.6.1
```

Now merge it with your master

```Bash
$ git checkout master
$ git merge v0.9.6.1
```

Push it to discourse-quickstart and you now good to go

```Bash
$ git push upstream master
```

You can safely delete tag branch now. Naming does not matter, 'current' or 'temp' will do as well as tag name.

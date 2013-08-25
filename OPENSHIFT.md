# Discourse Openshift Quickstart

## Setup

Create application with postgresql support

```Shell
$ rhc app create discourse ruby-1.9
$ rhc cartridge add postgresql-9.2 -a discourse
```

add quickstart repository upstream and get the code

```Shell
$ git remote add upstream -m master git@github.com:liquidautumn/discourse-quickstart.git
$ git pull -s recursive -X theirs upstream master
```

Now push it to the Openshift

```Shell
$ git push
```

## Update

To update quickstart you have to add discource remote repository and update your local copy

```Shell
$ git remote add discourse git@github.com:discourse/discourse.git
$ git pull discourse master
```

checkout required version to corresponding branch

```Shell
$ git checkout tags/v0.9.6.1 -b v0.9.6.1
```

Now merge it with your master

```Shell
$ git checkout master
$ git merge v0.9.6.1
```

Push it to discourse-quickstart and you now good to go

```Shell
$ git push upstream master
```

You can safely delete tag branch now. Naming does not matter, 'current' or 'temp' will do as well as tag name.

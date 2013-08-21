# Discourse Openshift Quickstart

## Setup

rhc app create discourse ruby-1.9
rhc cartridge add postgresql-9.2 -a discourse

## Update

git remote add discourse git@github.com:discourse/discourse.git

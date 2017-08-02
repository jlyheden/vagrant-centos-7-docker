#!/usr/bin/env bash

vagrant box remove centos-7-docker
vagrant box add --name centos-7-docker ./centos-7-docker.box

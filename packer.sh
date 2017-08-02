#!/usr/bin/env bash

BOX=${BOX:-"centos/7"}
FETCH_BOX=${FETCH_BOX:-""}

fetch_box() {
  vagrant box list |egrep -qs "^${BOX}\s+"

  case "$?" in
    0)
      vagrant box update --box $BOX
      RV=$?
      ;;
    *)
      vagrant box add $BOX
      RV=$?
  esac
}

test -z "$FETCH_BOX" || fetch_box

VAGRANT_BOX_DIR="${HOME}/.vagrant.d/boxes"
BOX_DIRNAME=$(echo $BOX | sed -e "s|\/|-VAGRANTSLASH-|")
LATEST_BOX_DIR=$(ls -dt $VAGRANT_BOX_DIR/$BOX_DIRNAME/* | head -1)
OVF_FILE=$(find $LATEST_BOX_DIR -name "*.ovf")
VAGRANT_KEY="${HOME}/.vagrant.d/insecure_private_key"

packer build \
  -var ovf_file=$OVF_FILE \
  -var vagrant_key=$VAGRANT_KEY \
  packer.json

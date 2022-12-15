#!/bin/bash

# this is set by Az DevOps, user must be vsts
export OCI_HOME=/home/vsts/lib/oracle-cli/bin
export TF_HOME=/home/vsts/bin
export PATH=$PATH:$OCI_HOME:$TF_HOME

# create the OCI config directory
/bin/mkdir $HOME/.oci
/bin/chmod 700 $HOME/.oci
/bin/ls -la $HOME

# copy the config and API keys, this action to be replaced by Azure Files
# after consultation with Rel.
/bin/cp config $HOME/.oci
/bin/cp oci_api_key.pem $HOME/.oci
/bin/chmod 600 $HOME/.oci/*
ls -l $HOME/.oci

# test the oci cli tools
oci --version
oci iam user list

# copy the terraform files and setup the path
/bin/mkdir $TF_HOME
/bin/cp $TF_HOME/terraform.zip
$PWD=`pwd`
cd $TF_HOME
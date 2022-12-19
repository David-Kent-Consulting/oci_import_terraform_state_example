#!/bin/bash

# where am i
pwd

# what is here
/bin/ls

# this is set by Az DevOps, user must be vsts
export OCI_HOME=/home/vsts/lib/oracle-cli/bin
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
/bin/cp terraform.zip $HOME/bin
cd $HOME/bin
/bin/unzip terraform.zip
/bin/rm terraform.zip
/bin/ls -l $HOME/bin
# had to hard code this, shell was ignoring $PWD on changedir
cd /home/vsts/work/1/s
pwd
terraform --version
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
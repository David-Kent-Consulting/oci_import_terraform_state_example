#!/bin/bash

# this is set by Az DevOps, user must be vsts
export OCI_HOME=/home/vsts/lib/oracle-cli/bin

# create the OCI config directory
/bin/mkdir $HOME/.oci
/bin/chmod 700 $HOME/.oci
/bin/ls -la $HOME

# copy the config and API keys, this action to be replaced by Azure Files
# after consultation with Rel.


# test the oci cli tools
$OCI_HOME/oci --version


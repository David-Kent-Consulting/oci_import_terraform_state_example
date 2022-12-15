#!/bin/bash


# create the OCI config directory
/bin/mkdir $HOME/.oci
/bin/chmod 700 $HOME/.oci
/bin/ls -la $HOME

# install OCI CLI tools
/bin/wget -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh > /tmp/install.sh
/bin/chmod 500 /tmp/install.sh
/tmp/install.sh --accept-all-defaults
/bin/sleep 180
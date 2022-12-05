# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export TF_VAR_tenancy_ocid=<your tenancy ODIC>
export TF_VAR_user_ocid=<service user OCID>
export TF_VAR_fingerprint=<fingerprint of the API key created in step 4>
export TF_VAR_private_key_path=~/.oci
export TF_VAR_region=<region where this terraform code will pull the state from>
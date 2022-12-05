#################################################################################################
#                                           AUDIT LOG                                           #
#################################################################################################
# 01-Feb-2022 - hankwojteczko@davidkentconsulting.com

# Pandas must be pinned to version 1.1.5, later versions not available for OLE 8.5. You should
# test at this version of pandas.

# Powershell left at stable release 7.1.4-1.rhel.7.x86_64.rpm, later releases changed package
# format, which has not been tested in container image. It is safe to test up to level
# 7.2.1.0.

# OCI distro pushed to version 2.55.1

# 30-March-2022 - hankwojteczko@davidkentconsulting.com

# added back cronie & ansible for client requirement with regard to running utilities within a 
# container on k8s. Varies defects repaired.

# 29-NOV-2022 - hankwojteczko@davidkentconsulting.com
# Required Versions:
#  oci cli 3.20.3
#  ole 8.7
#  pandas stuck at 1.1.5 on OLED 8.x, 2.0 is available, NFW
#  tabulate 0.8.9
#  oci 2.88.2
#  ansible stuck at 4.10.0 on OLE 8.6, later versions will not install on this distro
# OCI Terraform plugin 4.100.0

# 30-Nov-2022 - Add terraform code
# Hasicorp rpm repos are empty. You must download the latest version of terraform, copy
# it to the build directory, and rename it to terraform.zip. Then run the container
# image build.

# CAVEAT:   Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated
#           in cryptography and will be removed in a future release. Oracle Linux 9 resolves this. Note we
#           are waiting for a few releases past 9.0 prior to building at this level. Testing at version 9
#           will require all developer tools and libraries to be fully retested.


#################################################################################################
#                                           INSTRUCTIONS                                        #
#################################################################################################
#
#       These instructions will show you how to install the David Kent Cloud Solutions
#       OCI Express Cloud Administrator's Utilities onto your desktop. The entire process
#       start to finish should take about 15 minutes to complete.
#
# 1.    Install docker desktop onto your cloud administrator machine. You can get docker
#       desktop from https://www.docker.com/products/docker-desktop . For a Linux
#       installation, you can install for your Linux distro per
#       https://docs.docker.com/engine/install/ . If your OS is Oracle Linux Enterprise,
#       we recommend that you simply install with yum with the command below:
#                           sudo yum install docker -y
#
# 2.    Start by adding the microservice kernel to your repository. Use of a Fedora, Redhat,
#       or Oracle kernel is supported. Note however our primary development kernel is Oracle
#       Linux. We support kernels from version 7.5 and above. To pull the microservice kernel,
#       run "docker pull oraclelinux:x.x", where x.x is the major version of the microservice
#       kernel image to deploy on. For example, "docker pull oraclelinux:8.3" will pull
#       the version 8.3 kernel.
#
# 3.    Create a parent directory where you will build the container image from. We recommend
#       that you pick a directory that is separate from other development you may be doing
#       but is closely linked to other code. For example, I install my docker build files
#       starting at /home/hank/GitHub/DKC/docker, and I have my projects stored in branches
#       under /hone/hank/GitHub/DKC in other child directories where I have projects and
#       branches copied to. This makes it easy for me to push the Docker file to GitHub
#       and available for others to see and work on it.
#
# 4.    You'll need a copy of the codebase and this Dockerfile configuration file. This is
#       downloadable from the same GitHub repository that you downloaded this file from.
#       Of course, you must have permission to the repository to get the code since it is
#       not free or open source. If you have rights to the code but do not have access to
#       the codebase, contact your David Kent Cloud Solutions sales rep, and she/he will
#       be more than happy to get your access established. The code base is in two forms.
#       A zip file called KENT.zip is what you'll need to put in the same directory as
#       this docker file. The actual code should be copied to a location where you store
#       other code for other development work. Do not store any raw source code in the
#       directory where you are building the container image from.

# 5.    From this directory where the KENT.zip fiile and this Dockerfile is stored, run
#       the command "docker build -t <image name> ." to create the image into your
#       docker repository. For example, the command could be:
#
#       docker build -t davidkentcloudsolutions/ociexpressutils:B2.1b .
#
# 6.   Now push the container to the docker private repository, then clean-up your docker environment.
#
#       docker push davidkentcloudsolutions/ociexpressutils:B2.1b
#
# 7.   On the client's VM, install Docker, then pull the container, then list it
#
#       docker pull davidkentcloudsolutions/ociexpressutils:B2.1b
#
# 8.   Now launch a container from your image and connect to it. The container will immediately
#       work without any configuration:
#
#       docker container run -dit --hostname kentanst01 \
#           --name kentcollegemycontainer -v $(pwd):/files \
#           davidkentcloudsolutions/ociexpressutils:B2.1b
#       NOTE - Substitute bindmount path with ${PWD}:/files when calling within PowerShell
#
#       docker container exec -it kentcollegemycontainer bash -c "su - ansible"
#
#       Note the above when used with '--restart always' will always restart the container when docker restarts, or if the container core dumps.
#       Omit this option if you desire to manually start and stop the container.
#
# 9.   You can now use the docker dashboard or "docker container start/stop" to start or stop your container.
#       See the David Kent Cloud Solutions OCI Express Cloud Administrator's Utilities documentation or speak
#       with your assigned David Kent Cloud Solutions consultant for help with using the utilities.
#
#       You should become familiar with Docker. There are two courses from Udemy that I recommend. For beginners:
#       "Docker for the Absolute Beginner - Hands On - DevOps"
#
#       And for developers, I recommend:
#       "Docker Mastery: with Kubernetes +Swarm from a Docker Captain"

# WARNING! Oracle Linux 8.5's python3 rpm is version 3.6.8. Ansible version 4.12.0 will only
# support version 3.8 or later of python. We must keep ansible pinned to version 4.10.0 until
# this is resolved.
FROM oraclelinux:8.7
# Define Args and Env needed to create links
ENV PS_INSTALL_FOLDER=/opt/microsoft/powershell/7 \
    # Define ENVs for Localization/Globalization
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    C_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

ADD https://github.com/PowerShell/PowerShell/releases/download/v7.2.5/powershell-7.2.5-1.rh.x86_64.rpm   \
    /tmp/powershell-linux.rpm

# update the system and install required RPMs
RUN yum update -y \
   && yum install cronie -y \
   && yum install git -y \
# must be installed before powershell
   && yum install icu.x86_64 libicu-devel.x86_64 -y
RUN rpm -ivh /tmp/powershell-linux.rpm
RUN yum install python3 -y \
   && yum install python38-pip -y \
   && yum install unzip -y \
   && yum install vim -y \
   && yum install wget -y
RUN ln -s /usr/bin/python3 /usr/bin/python \
   && ln -s /usr/bin/pip3 /usr/bin/pip

# RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
#    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl



RUN useradd ansible \
   && su - ansible -c "pip install --upgrade pip --user" \
   && su - ansible -c "pip install pandas==1.1.5 --user" \
   && su - ansible -c "pip install tabulate==0.8.9 --user" \
   && su - ansible -c "pip install detect_delimiter==0.1.1 --user" \
   && su - ansible -c "pip install oci==2.88.2 --user" \
   && su - ansible -c "pip install ansible==4.10.0 --user"
   
   # && su - ansible -c "pip install tabulate==0.8.9 --user" \
   # && su - ansible -c "pip install oci==2.72.0 --user" \

# [DEPRECATION WARNING]: Ansible will require Python 3.8 or newer on the controller starting with Ansible 2.12.
# Current version: 3.6.8 (default, Nov 10 2021, 06:50:23) [GCC 8.5.0 20210514 (Red Hat 8.5.0-3.0.2)]. This 
# feature will be removed from ansible-core in version 2.12. Deprecation warnings can be disabled by setting 
# deprecation_warnings=False in ansible.cfg.


# install the codebase and required python modules, create the ansible user
# section commented out below since I am developing new code.
COPY terraform.zip bin
RUN cd bin \
   && unzip -o terraform.zip \
   && rm terraform.zip

# install the OCI CLI
RUN su - ansible -c "curl -L https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh > install.sh" \
   && su - ansible -c "chmod 750 install.sh" \
   && su - ansible -c "./install.sh --accept-all-defaults"

# Install the terraform plugin for OCI

RUN cd /home/ansible/bin \
   && wget https://releases.hashicorp.com/terraform-provider-oci/4.100.0/terraform-provider-oci_4.100.0_linux_386.zip \
   && unzip terraform-provider-oci_4.100.0_linux_386.zip \
   && rm terraform-provider-oci_4.100.0_linux_386.zip \
   && /bin/ln -s terraform-provider-oci_v4.100.0 tf-oci

# clean up the cache
RUN rm -Rf /var/cache/dnf && rm -Rf /var/cache/ldconfig
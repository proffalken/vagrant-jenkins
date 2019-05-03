#!/bin/bash

## install.sh - Create a secured CentOS vagrant box and install
## Jenkins on it with blueocean and a few other plugins

if ! [ -x "$(command -v virtualenv)" ]; then
  echo 'Error: virtualenv is not installed on your machine.  Please install it and retry this command.' >&2
  exit 1
fi

echo "Please enter the admin password you would like to use for Jenkins (Note: The input will be hidden)"
read -s jenkins_admin_password
export jenkins_admin_password

# Create the virtualenv using Python2 because
# not all modules within Ansible are Python3
# ready yet 
virtualenv -p /usr/bin/python2 .venv
# activate the virtualenv
source .venv/bin/activate
# install ansible
pip install ansible
# install the ansible requirements
ansible-galaxy install -r ansible-requirements.yml
# launch the platform
vagrant up
# Tell the user where they can log in
cat <<-EOF
Thanks for installing Jenkins in virtualbox.

Your installation is now ready, and you can
access it by visiting http://localhost:8888/
in a browser of your chosing.

You will need to use the password you created
at the start of this script in order to log in,
the username is "admin".
EOF

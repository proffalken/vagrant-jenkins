# Vagrant Jenkins

A CI/CD server running on Virtualbox using Jenkins

## About the platform

This Vagrant setup takes the standard CentOS 7 image and then
hardens it to [CIS standards](https://www.cisecurity.org/) using Ansible,
before opening the firewall ports and installing Jenkins along with the
slack, github, greenballs, and blueocean plugins.

The installation script will set a custom password for the admin user,
create a virtualenv for Ansible to run in, and then launch the Vagrantfile.

## Usage

1. Clone this repository onto a Linux system that already has Virtualbox and Vagrant installed.
2. Run `./install.sh` and follow the prompts.
3. Log in to the web interface and setup your jobs.

### Notes:

* The python version used is 2.7.  This is because there are still some Ansible modules that do not support Python3.  This is acknowledged by the author as Technical Debt and will be fixed once Ansible are clear that python3 is the only appropriate version of Python to use.
* This platform re-uses Ansible roles from ansible-galaxy.  These roles are known to work and (in most cases) be fully tested, removing the effort required to reinvent the wheel and create your own roles.  It also makes installation much easier, and the git repository much smaller.




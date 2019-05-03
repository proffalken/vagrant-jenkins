# -*- mode: ruby -*-
# vi: set ft=ruby :
jenkins_admin_password = ENV['jenkins_admin_password'] || "admin"

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 8080, host: 8888
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "jenkinsci.yml"
    ansible.extra_vars = {
      jenkins_admin_password: jenkins_admin_password
    }
  end
end

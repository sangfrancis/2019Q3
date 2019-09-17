#!/bin/bash
sudo yum update -y --disablerepo=\* --enablerepo=base,updates ca-certificates
sudo yum install -y epel-release
sudo yum install -y --enablerepo=epel sshpass git
sudo yum install -y ansible
cd ansible-playbook
cp config/insecure_private_key /home/vagrant/.ssh/id_rsa
cp config/ssh_config /home/vagrant/.ssh/config
chmod -R og-rwx /home/vagrant/.ssh
chown -R vagrant.vagrant /home/vagrant/.ssh
sudo cp config/ansible.cfg /etc/ansible/ansible.cfg
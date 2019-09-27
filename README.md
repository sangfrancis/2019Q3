README

1. install and config nginx
vagrant ssh
cd ansible-playbook
ansible-playbook -i hosts.local nginx_install.yml -b

2. Compose
vagrant ssh
cd ansible-playbook
ansible-playbook -i hosts.local provision.yml -b
ansible-playbook -i hosts.local deployment.yml -b
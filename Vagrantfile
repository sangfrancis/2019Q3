Vagrant.configure(2) do |config|

  server_configs = [
    {"hostname" => "challenge", "ip" => "192.168.50.2", "port" => 5052, "memory_size" => "1024", "cpus" => 2, "execute_script" => true},
  ]
  
  server_configs.each do |server_config|
    config.vm.define "#{server_config['hostname']}" do |server|
      server.vm.hostname = server_config['hostname']
      server.vm.box = "bento/centos-7.4"
      server.vm.network :private_network, ip: server_config['ip']
      server.vm.network :forwarded_port, guest: 22, host: server_config['port'], id: "ssh"
      server.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--cpus", server_config['cpus']]
        v.customize ["modifyvm", :id, "--memory", server_config['memory_size']]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["setextradata", :id, "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled", 0]
      end
      server.vm.synced_folder ".", "/home/vagrant/ansible-playbook", owner: "root", group: "root", :create => true, :mount_options => ["fmode=777", "dmode=777"]
      if server_config['execute_script'] then
        server.vm.provision :shell, path: "run.sh"
      end
      server.ssh.private_key_path = "./config/insecure_private_key"
      server.ssh.insert_key = false
    end
  end
end
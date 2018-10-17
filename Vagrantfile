# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define 'controller' do |controller|
    controller.ssh.forward_agent = true
    controller.vm.box = 'ubuntu/xenial64'
    controller.vm.hostname = 'controller'
    controller.vm.provision :shell, path: 'provision-controller.sh'
    controller.vm.provision :shell, path: 'provision-go.sh'
    controller.vm.provision :shell, path: 'provision-kubectl.sh'
    controller.vm.network 'private_network',
                          ip: '172.42.42.10',
                          netmask: '255.255.255.0',
                          auto_config: true,
                          virtualbox__intnet: 'k8s-net'
    controller.vm.provider 'virtualbox' do |v|
      v.name = 'controller'
      v.memory = 1024
      v.gui = false
    end
  end

  config.vm.define 'node01' do |node|
    node.ssh.forward_agent = true
    node.vm.box = 'ubuntu/xenial64'
    node.vm.hostname = 'node01'
    node.vm.provision :shell, path: 'provision-node.sh'
    node.vm.network 'private_network',
                    ip: '172.42.42.11',
                    netmask: '255.255.255.0',
                    auto_config: true,
                    virtualbox__intnet: 'k8s-net'
    node.vm.provider 'virtualbox' do |v|
      v.name = 'node01'
      v.memory = 256
      v.gui = false
    end
  end

  config.vm.define 'node02' do |node|
    node.ssh.forward_agent = true
    node.vm.box = 'ubuntu/xenial64'
    node.vm.hostname = 'node02'
    node.vm.provision :shell, path: 'provision-node.sh'
    node.vm.network 'private_network',
                    ip: '172.42.42.12',
                    netmask: '255.255.255.0',
                    auto_config: true,
                    virtualbox__intnet: 'k8s-net'
    node.vm.provider 'virtualbox' do |v|
      v.name = 'node02'
      v.memory = 256
      v.gui = false
    end
  end
end

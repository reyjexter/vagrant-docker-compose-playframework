# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.customize ["modifyvm", :id, "--nictype1", "virtio"]
    end

    config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
        owner: "vagrant",
        group: "www-data",
        mount_options: ["dmode=777,fmode=777"]

    config.vm.provision :docker
    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: false, project_name: "docker-play", run: "always"

    config.vm.network "forwarded_port", guest: 9000, host: 9000
    config.vm.network "forwarded_port", guest: 80, host: 8080
end
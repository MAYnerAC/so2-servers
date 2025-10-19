Vagrant.configure("2") do |config|
  # Configuración para Servidor01
  config.vm.define "Servidor01a" do |server|
    server.vm.box = "debian/bookworm64"
    server.vm.hostname = "anahua"
    server.vm.network "public_network", ip: "192.168.0.101"

    server.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "Servidor01a"
      #vb.customize ["modifyvm", :id, "--nic1", "bridged"]
      # vb.customize ["modifyvm", :id, "--bridgeadapter1", "net0"] # NO enp0s3
      vb.customize ["modifyvm", :id, "--name", "Servidor01a"]
    end

    server.vm.provision "shell", path: "scripts/provision.sh"
  end

  # Configuración para Servidor02
  config.vm.define "Servidor02a" do |server|
    server.vm.box = "debian/bookworm64"
    server.vm.hostname = "anahua"
    server.vm.network "public_network", ip: "192.168.0.102"

    server.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.name = "Servidor02a"
      #vb.customize ["modifyvm", :id, "--nic1", "bridged"]
      # vb.customize ["modifyvm", :id, "--bridgeadapter1", "net0"]
      vb.customize ["modifyvm", :id, "--name", "Servidor02a"]
    end

    server.vm.provision "shell", path: "scripts/provision.sh"
  end
end


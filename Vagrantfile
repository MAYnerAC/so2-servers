Vagrant.configure("2") do |config|
  # Configuración para Servidor01
  config.vm.define "Servidor01" do |servidor01|
    servidor01.vm.box = "debian/bookworm64"
    servidor01.vm.network "public_network", type: "dhcp"
    servidor01.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
    
    servidor01.vm.provision "shell", inline: <<-SHELL
      useradd -m -s /bin/bash anahua
      echo "anahua:Upt2025" | chpasswd
      echo "root:Upt2025" | chpasswd
      apt-get update
      apt-get install -y openssh-server
      systemctl enable ssh
      systemctl start ssh
    SHELL
  end

  # Configuración para Servidor02
  config.vm.define "Servidor02" do |servidor02|
    servidor02.vm.box = "debian/bookworm64"
    servidor02.vm.network "public_network", type: "dhcp"
    servidor02.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    servidor02.vm.provision "shell", inline: <<-SHELL
      useradd -m -s /bin/bash anahua
      echo "anahua:Upt2025" | chpasswd
      echo "root:Upt2025" | chpasswd
      apt-get update
      apt-get install -y openssh-server
      systemctl enable ssh
      systemctl start ssh
    SHELL
  end
end


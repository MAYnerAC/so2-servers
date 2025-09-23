#!/bin/bash

# Verificar qué usuario está ejecutando el script
echo "Ejecutando como: $(whoami)"

# Cambiar al usuario root
# sudo su -

# Actualizar el sistema
sudo apt update
# sudo apt upgrade -y

# Configurar idioma del sistema
# sudo update-locale LANG=en_US.UTF-8 #(NO)

# Configurar la zona horaria
# sudo timedatectl set-timezone US/Pacific #(NO)

# Configurar el teclado
# sudo localectl set-keymap latam #(NO)

# Cambiar el hostname
# sudo hostnamectl set-hostname anahua # (En Vagrantfile)

# Establecer contraseña root
echo "root:Upt2025" | sudo chpasswd

# Crear un usuario con contraseña
sudo useradd -m -s /bin/bash anahua
echo "anahua:Upt2025" | sudo chpasswd

# Permitir login SSH
sudo sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# Instalar SSH
# sudo apt install -y openssh-server
# systemctl enable ssh
# systemctl start ssh


# sudo ssh-keygen -A
# sudo systemctl restart ssh


# Otros paquetes necesario
# sudo apt install -y 


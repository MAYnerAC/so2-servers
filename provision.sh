#!/bin/bash

# Verificar qué usuario está ejecutando el script
echo "Inicio, Usuario: $(whoami)"

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

# Instalar SSH (Formulario de configuracion)
# sudo apt install -y openssh-server
# systemctl enable ssh
# systemctl start ssh

# Otros paquetes
# sudo apt install -y 



# 1. Eliminar paquetes en conflicto (si es que existen)
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do apt-get remove -y $pkg; done

# 2. Actualizar sistema e instalar dependencias
apt-get install -y ca-certificates curl

# 3. Agregar la clave GPG oficial de Docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# 4. Agregar el repositorio oficial de Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Instalar Docker
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 6. Verificar que Docker funcione correctamente
docker ps

# 7. Permitir usar Docker sin root
apt-get install -y passwd
usermod -aG docker anahua
newgrp docker

echo "Final, Usuario: $(whoami)"
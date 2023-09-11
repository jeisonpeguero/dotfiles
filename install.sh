#!/usr/bin/bash

#######################################################"
echo "CONFIGURANDO EL LOCALE"
#######################################################"
sudo sed -i 's/# es_US.UTF-8 UTF-8/es_US.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG=es_US.UTF-8' | sudo tee /etc/default/locale
# echo 'LANG=en_US.UTF-8' | sudo tee /etc/default/locale
sudo locale-gen

#######################################################"
echo "CONFIGURANDO LOS PPAs"
#######################################################"
#Git
sudo add-apt-repository ppa:git-core/ppa -y -n

#PHP
sudo add-apt-repository ppa:ondrej/php -y -n
sudo add-apt-repository ppa:ondrej/apache2 -y -n

#Microsoft Repos
sudo apt remove 'dotnet*' 'aspnet*' 'netstandard*'
sudo rm /etc/apt/sources.list.d/microsoft-prod.list
sudo ln -s ~/.dotfiles/etc/apt/preferences /etc/apt/preferences

wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

#Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Docker Compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

#Kubernetes
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#Golang
sudo add-apt-repository ppa:longsleep/golang-backports -y -n

#NodeJS
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

#######################################################"
echo "ACTUALIZANDO EL SISTEMA"
#######################################################"
sudo apt update -y
sudo apt upgrade -y

#######################################################"
echo "DESINTALANDO PAQUETES"
#######################################################"
sudo apt purge -y docker docker-engine docker.io containerd runc
sudo apt autoremove --purge

#######################################################"
echo "INSTALANDO PAQUETES"
#######################################################"
sudo apt install -y \
                zsh \
                git \
                vim \
                htop \
                tree \
                nodejs \
                ca-certificates \
                curl \
                gnupg \
                lsb-release \
                zip \
                unzip \
                gcc g++ make \
                php8.1 apache2 php8.1-bcmath php8.1-curl php8.1-mbstring php8.1-mysql php8.1-pgsql php8.1-sqlite3 php8.1-xml php8.1-bcmath php8.1-zip libapache2-mod-php8.1 \
                dotnet-sdk-6.0 dotnet-sdk-7.0 \
                docker-ce docker-ce-cli containerd.io docker-compose-plugin \
                golang-go \
                #kubectl kubeadm kubelet \
                ranger \
                neofetch \
                sqlite3 \
                fzf


#######################################################"
echo "CONFIGURANDO CARPETAS DE DESARROLLO"
#######################################################"
mkdir -p -v ~/dev
mkdir -v ~/dev/php
# mkdir -p -v ~/code/dotnet
# mkdir -v ~/code/docker
# mkdir -v ~/code/angular
# mkdir -v ~/code/react
# mkdir -v ~/code/php
# mkdir -v ~/code/go
# mkdir -v ~/code/vue

#######################################################"
echo "CONFIGURANDO SSH"
#######################################################"
mkdir ~/.ssh
cp ~/.dotfiles/.ssh/config ~/.ssh/config
cp ~/.dotfiles/.ssh/github ~/.ssh/github
cp ~/.dotfiles/.ssh/github.pub ~/.ssh/github.pub
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

#######################################################"
echo "CONFIGURANDO BASH"
#######################################################"
# bash -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# sudo chmod +x /usr/local/bin/oh-my-posh
# yes | mv -v ~/.bashrc ~/.bashrc.bak
# ln -s ~/.dotfiles/.bashrc ~/.bashrc
# mkdir ~/.oh-my-bash/custom/themes/font
# ln -s ~/.dotfiles/oh-my-bash/themes/font/font.theme.sh ~/.oh-my-bash/custom/themes/font/font.theme.sh
# ln -s ~/.dotfiles/oh-my-bash/aliases/personal.aliases.sh ~/.oh-my-bash/custom/aliases/personal.aliases.sh

#######################################################"
echo "CONFIGURANDO BAT"
#######################################################"
BAT_VERSION="0.23.0"
wget "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
sudo dpkg -i "bat_${BAT_VERSION}_amd64.deb"
rm "bat_${BAT_VERSION}_amd64.deb"
mkdir -p "$(bat --config-dir)/themes"
wget "https://raw.githubusercontent.com/dracula/sublime/master/Dracula.tmTheme" -P "$(bat --config-dir)/themes"
bat cache --build
ln -s ~/.dotfiles/.bat.conf ~/.bat.conf

#######################################################"
echo "CONFIGURANDO LSD"
#######################################################"
LSD_VERSION="0.23.1"
wget "https://github.com/lsd-rs/lsd/releases/download/${LSD_VERSION}/lsd_${LSD_VERSION}_amd64.deb"
sudo dpkg -i "lsd_${LSD_VERSION}_amd64.deb"
rm "lsd_${LSD_VERSION}_amd64.deb"

#######################################################"
echo "CONFIGURANDO DOCKER"
#######################################################"
sudo usermod -aG docker $USER
newgrp docker
mkdir ~/dev/docker
ln -s ~/.dotfiles/docker/db-services.yml ~/dev/docker/db-services.yml
mkdir -p -v ~/.docker-volumes/redis-server-5/conf
mkdir -p -v ~/.docker-volumes/redis-server-6/conf
touch ~/.docker-volumes/redis-server-5/conf/redis.conf
touch ~/.docker-volumes/redis-server-6/conf/redis.conf
# sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
# sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
sudo systemctl start docker
docker compose -f ~/dev/docker/db-services.yml up --no-start

#######################################################"
echo "CONFIGURANDO KUBERNETES"
#######################################################"
# sudo rm /etc/containerd/config.toml
# sudo systemctl restart containerd
# sudo kubeadm init --control-plane-endpoint=localhost
# mkdir -p ~/.kube
# sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
# sudo chown $(id -u):$(id -g) ~/.kube/config

#######################################################"
echo "CONFIGURANDO PHP COMPOSER"
#######################################################"
curl -sS https://getcomposer.org/installer -o ~/composer-setup.php
sudo php ~/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm ~/composer-setup.php
composer global require friendsofphp/php-cs-fixer --dev

#######################################################"
echo "CONFIGURANDO PHP"
#######################################################"
# sudo mv /etc/php/8.0/apache2/php.ini /etc/php/8.0/apache2/php.ini.bak
# sudo ln -s ~/.dotfiles/etc/php/8.0/apache2/php.ini /etc/php/8.0/apache2/php.ini

#######################################################"
echo "CONFIGURANDO LARAVEL"
#######################################################"
composer global require laravel/installer

#######################################################"
echo "CONFIGURANDO APACHE2"
#######################################################"
sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
sudo ln -s ~/.dotfiles/etc/apache2/apache2.conf /etc/apache2/apache2.conf
sudo mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak
sudo ln -s ~/.dotfiles/etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.bak
sudo ln -s ~/.dotfiles/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf

#######################################################"
echo "CONFIGURANDO VUEJS"
#######################################################"
sudo npm install -g @vue/cli

#######################################################"
echo "CONFIGURANDO ANGULAR"
#######################################################"
sudo npm install -g @angular/cli

#######################################################"
echo "CONFIGURANDO VIM"
#######################################################"
ln -s ~/.dotfiles/.vimrc ~/.vimrc

#######################################################"
echo "CONFIGURANDO GIT"
#######################################################"
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.git-credentials ~/.git-credentials

#######################################################"
echo "CONFIGURANDO ZSH"
#######################################################"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yes | mv -v ~/.zshrc ~/.zshrc.bak
ln -s ~/.dotfiles/.zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

#######################################################"
echo "CONFIGURANDO WSL CONFIG"
#######################################################"
sudo rm /etc/wsl.conf
sudo ln -s ~/.dotfiles/wsl.conf /etc/wsl.conf

#######################################################"
echo "REMOVIENDO PAQUETES"
#######################################################"
sudo apt autoremove --purge

#######################################################"
# echo "CONFIGURANDO DOTNET"
#######################################################"
# dotnet tool install --global dotnet-ef --version '6.*'

#######################################################"
echo "DESHABILITAR SERVICIOS"
#######################################################"
# sudo systemctl disable apache2.service
# sudo systemctl disable docker.service --no
# sudo systemctl disable containerd.service --no
# sudo systemctl disable kubelet.service --no
#######################################################"

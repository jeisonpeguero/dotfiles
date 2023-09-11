#!/usr/bin/bash

# Windows
# --Instalar y habilitar la wsl
# --Instalar la distro Ubuntu 22.04
# --Instalar las nerd fonts en la terminal
# --Instalar las extensiones wsl en vscode
# --Abrir la wsl en vscode
# --Abrir la wsl en la terminal

# Config Inicial
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove --purge

sudo apt install -y vim htop tree curl zip unzip neofetch sqlite3

# Locale
sudo sed -i 's/# es_US.UTF-8 UTF-8/es_US.UTF-8 UTF-8/' /etc/locale.gen
echo 'LANG=es_US.UTF-8' | sudo tee /etc/default/locale
# echo 'LANG=en_US.UTF-8' | sudo tee /etc/default/locale
sudo locale-gen
# Cerrar y abrir la terminal para reflejar cambios

# VIM
ln -s ~/.dotfiles/.vimrc ~/.vimrc

# WSL
sudo rm /etc/wsl.conf
sudo ln -s ~/.dotfiles/wsl.conf /etc/wsl.conf

# PATH
# --Configurar el path como en .zshrc

# Git
sudo add-apt-repository ppa:git-core/ppa -y -n
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.git-credentials ~/.git-credentials

# ZSH
sudo apt install -y zsh fzf
yes | mv -v ~/.zshrc ~/.zshrc.bak
ln -s ~/.dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab.git ~/.oh-my-zsh/custom/plugins/fzf-tab

# BAT
BAT_VERSION="0.23.0"
wget "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
sudo dpkg -i "bat_${BAT_VERSION}_amd64.deb"
rm "bat_${BAT_VERSION}_amd64.deb"
bat cache --build
ln -s ~/.dotfiles/.bat.conf ~/.bat.conf

# LSD
LSD_VERSION="0.23.1"
wget "https://github.com/lsd-rs/lsd/releases/download/${LSD_VERSION}/lsd_${LSD_VERSION}_amd64.deb"
sudo dpkg -i "lsd_${LSD_VERSION}_amd64.deb"
rm "lsd_${LSD_VERSION}_amd64.deb"

# NVM y NodeJS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

nvm install node #latest
nvm install --lts

# Angular
npm install -g @angular/cli
mkdir ~/code
cd ~/code
ng new angular-test-app
cd angular-test-app
ng serve

# VueJS
npm install -g @vue/cli
vue create vue-test-app
cd vue-test-app
npm run serve

# Dotnet
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo ln -s ~/.dotfiles/etc/apt/preferences /etc/apt/preferences
sudo apt update
sudo apt install dotnet-sdk-6.0 dotnet-sdk-7.0
dotnet --info
dotnet new webapi -o dotnet-test-app
cd dotnet-test-app
dotnet run

# PHP
sudo add-apt-repository ppa:ondrej/php -y -n
sudo apt install -y php8.1 apache2 php8.1-bcmath php8.1-curl php8.1-mbstring php8.1-mysql php8.1-pgsql php8.1-sqlite3 php8.1-xml php8.1-bcmath php8.1-zip libapache2-mod-php8.1
sudo chown -R jeison.jeison /var/www
cd /var/www/html
vim index.php
sudo ln -s ~/.dotfiles/etc/php/8.0/apache2/php.ini /etc/php/8.0/apache2/php.ini

# PHP Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php ~/composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm ~/composer-setup.php
echo 'Agregar al PATH la ruta de composer $HOME/.config/composer/vendor/bin'
composer global require friendsofphp/php-cs-fixer --dev

# Laravel
composer global require laravel/installer
laravel new laravel-test-app
php artisan serve
echo 'si es con apache hay que darle permisos 777 a la carpeta storage'
chmod -R 777 /var/www/html/laravel-test-app/storage

# Golang
sudo add-apt-repository ppa:longsleep/golang-backports -y -n
sudo apt install golang-go -y
go version

# Docker
sudo apt install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl status docker.service
# sudo systemctl enable docker.service
# sudo systemctl enable containerd.service
# sudo systemctl disable docker.service
# sudo systemctl disable containerd.service
sudo docker run hello-world
sudo usermod -aG docker $USER
docker run hello-world

# Docker DB-Services
docker compose -p db-services -f ~/.dotfiles/docker/db-services.yml up --no-start

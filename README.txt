#####################
#  VM Installation  #
#####################
apt update
apt install -y sudo ufw docker docker-compose make openbox xinit kitty firefox-esr wget curl libnss3-tools
# wget curl libnss3-tools -> are for certificate creation

# Starts X server
startx

# Config ssh
nano /etc/ssh/sshd_config

	Port 42
	PermitRootLogin yes
	PubkeyAuthentication no
	PasswordAuthentication yes

service ssh restart
service sshd restart

# After opening the ports
ssh root@localhost -p 42
ssh <users>@localhost -p 42
# For WSL CMD [hostname] to find the <hostname>
ssh <user>@<hostname>.local -p 42

# Firewall
ufw enable
ufw allow 443
ufw allow 80
ufw allow 42
shutdown now

# Port forwarding at the VBox
42 SSH
80 HTTP
443 HTTPS

##################
# Configurations #
##################

nano /etc/sudoers
 -> under root	ALL=(ALL:ALL) ALL
 jibanez-	ALL=(ALL:ALL) ALL

# group config
sudo usermod -aG docker jibanez-
groups jibanez-

# Check open ports
ss -tnlp

# Visualize the network
docker network ls

########################
# Certificate Creation #
########################
# mkcert binary
curl -s https://api.github.com/repos/FiloSottile/mkcert/releases/latest| grep browser_download_url  | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
mv mkcert-v*-linux-amd64 mkcert
chmod a+x mkcert
mv mkcert /usr/local/bin/
mkcert --version

cd ~/project/srcs/requirements/tools/
mkcert <user>.42.fr
mv <user>.42.fr-key.pem <user>.42.fr.key
mv <user>.42.fr.pem <user>.42.fr.crt

#######################
#    Local Domains#   #
#######################
sudo nano /etc/hosts
	-> 127.0.0.1	jibanez-.42.fr localhost

############
#   .env   #
############
DOMAIN_NAME=jibanez-.42.fr
CERT_=./requirements/tools/jibanez-.42.fr.crt
KEY_=./requirements/tools/jibanez-.42.fr.key
DB_NAME=wordpress
DB_ROOT=rootpass
DB_USER=wpuser
DB_PASS=wppass


TREE GENERATOR SH:

#!/bin/bash
mkdir project
mkdir project/srcs
touch project/Makefile
mkdir project/srcs/requirements
touch project/srcs/docker-compose.yml
touch project/srcs/.env
echo "DOMAIN_NAME=<user>.42.fr" > project/srcs/.env
echo "CERT_=./requirements/tools/<user>.42.fr.crt" >> project/srcs/.env
echo "KEY_=./requirements/tools/<user>.42.fr.key" >> project/srcs/.env
echo "DB_NAME=wordpress" >> project/srcs/.env
echo "DB_ROOT=rootpass" >> project/srcs/.env
echo "DB_USER=wpuser" >> project/srcs/.env
echo "DB_PASS=wppass" >> project/srcs/.env
mkdir project/srcs/requirements/bonus
mkdir project/srcs/requirements/mariadb
mkdir project/srcs/requirements/mariadb/conf
touch project/srcs/requirements/mariadb/conf/create_db.sh
mkdir project/srcs/requirements/mariadb/tools
echo "" > project/srcs/requirements/mariadb/tools/.gitkeep
touch project/srcs/requirements/mariadb/Dockerfile
touch project/srcs/requirements/mariadb/.dockerignore
echo ".git" > project/srcs/requirements/mariadb/.dockerignore
echo ".env" >> project/srcs/requirements/mariadb/.dockerignore
mkdir project/srcs/requirements/nginx
mkdir project/srcs/requirements/nginx/conf
touch project/srcs/requirements/nginx/conf/nginx.conf
mkdir project/srcs/requirements/nginx/tools
touch project/srcs/requirements/nginx/Dockerfile
echo ".git" > project/srcs/requirements/mariadb/.dockerignore
echo ".env" >> project/srcs/requirements/mariadb/.dockerignore
mkdir project/srcs/requirements/tools
mkdir project/srcs/requirements/wordpress
mkdir project/srcs/requirements/wordpress/conf
touch project/srcs/requirements/wordpress/conf/wp-config-create.sh
mkdir project/srcs/requirements/wordpress/tools
echo "" > project/srcs/requirements/wordpress/tools/.gitkeep
touch project/srcs/requirements/wordpress/Dockerfile
touch project/srcs/requirements/wordpress/.dockerignore
echo ".git" > project/srcs/requirements/wordpress/.dockerignore
echo ".env" >> project/srcs/requirements/wordpress/.dockerignore

#!/bin/bash
set -e
echo "🔹 Instalando dependências extras..."
apt-get update && apt-get install -y \
  git curl wget unzip nano vim htop net-tools \
  docker-compose tightvncserver xfce4 xfce4-goodies \
  python3-pip
pip3 install --upgrade pip
pip3 install flask requests
docker run -d -p 9000:9000 --name portainer \
  --restart=always -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer-ce

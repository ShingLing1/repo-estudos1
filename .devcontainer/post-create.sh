#!/bin/bash
set -e

echo "🔹 Atualizando pacotes..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🔹 Instalando Python3 e pip..."
sudo apt-get install -y python3 python3-pip python3-venv

echo "🔹 Instalando Node.js e npm..."
sudo apt-get install -y nodejs npm

echo "🔹 Instalando Docker e Docker Compose..."
sudo apt-get install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker || echo "⚠️ Docker não iniciado, pode iniciar manualmente."

echo "🔹 Instalando MongoDB client..."
sudo apt-get install -y mongodb-clients

echo "🔹 Instalando ferramentas adicionais de desenvolvimento..."
sudo apt-get install -y git vim nano wget unzip curl

echo "🔹 Instalando Flask e FastAPI via pip..."
pip3 install --upgrade pip
pip3 install flask fastapi

echo "🔹 Instalando Express via npm..."
sudo npm install -g express

echo "🔹 Instalando Portainer para gerenciamento Docker..."
docker volume create portainer_data || true
docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce || echo "⚠️ Portainer já está rodando."

echo "✅ DevContainer pronto! Python, Node.js, Docker, MongoDB e Portainer instalados."


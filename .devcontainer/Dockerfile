FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Atualizar pacotes básicos
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    sudo curl wget git vim nano \
    build-essential \
    python3 python3-pip python3-venv \
    nodejs npm \
    mongodb-clients \
    docker.io docker-compose \
    openssh-server \
    xfce4 xfce4-goodies tightvncserver \
    && apt-get clean

# Instalar Portainer (via Docker)
RUN docker volume create portainer_data && \
    docker run -d \
      -p 9000:9000 -p 9443:9443 \
      --name=portainer \
      --restart=always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v portainer_data:/data \
      portainer/portainer-ce

# Usuário padrão vscode
RUN useradd -m -s /bin/bash vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /workspace

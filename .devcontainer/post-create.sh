#!/bin/bash
set -e
apt-get update
apt-get install -y python3 python3-pip nodejs npm docker.io docker-compose mongodb-clients tigervnc-standalone-server tigervnc-common
pip3 install flask fastapi
npm install -g express

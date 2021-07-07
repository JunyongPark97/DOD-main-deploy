#!/bin/bash

# step 0 : git pull each repository
cd ~/DOD-main-server/
git pull origin master

cd ~/dod-react-app/
git pull origin master

# step 0: copy whole code to main-deploy repo
sudo rm -rf ~/DOD-main-deploy/DOD-main-server/
sudo rm -rf ~/DOD-main-deploy/dod-react-app/
sudo cp -r ~/DOD-main-server/ ~/DOD-main-deploy/
sudo cp -r ~/dod-react-app/ ~/DOD-main-deploy/

# step 1 : delete ssl
sudo rm -rf ~/DOD-main-deploy/docker/nginx/certbot

# step 2 : build docker image with updated code
docker-compose -f docker-compose.yml build

# step 3 : re-copy certbot info to docker/nginx/
sudo cp -r ~/letsencrypt/certbot/ ~/DOD-main-deploy/docker/nginx/

# step 4 : docker-compose restart
# 만약 docker-compose down 을 해야할 경우에는 step 1 시작 전 혹은 restart 시작 전으로 해놓도록
docker-compose up -d 

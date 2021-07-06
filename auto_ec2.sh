#!/bin/bash

sudo rm -rf ~/DOD-main-deploy/docker/nginx/certbot

docker-compose -f docker-compose.yml build

sudo cp -r ~/letsencrypt/certbot/ ~/DOD-main-deploy/docker/nginx/

docker-compose up -d 

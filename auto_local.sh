#!/bin/bash


cd ~/Desktop/DOD-main-server/
git pull origin master

cd ~/Desktop/dod-react-app/
git pull origin master

cd ~/Desktop/DOD-main-deploy/
sudo cp -r ./DOD-main-server/ ~/Desktop/past/1/DOD-main-server/
sudo cp -r ./dod-react-app/ ~/Desktop/past/1/dod-react-app/

sudo cp -r ~/Desktop/DOD-main-server/ ~/Desktop/DOD-main-deploy/DOD-main-server/
sudo cp -r ~/Desktop/dod-react-app/ ~/Desktop/DOD-main-deploy/dod-react-app/

commit_message=""

if [ "$1" = "" ]
then commit_message="[UPDATED] update backend & frontend code"
else commit_message=$1
fi

git add . 
git commit -m "$message"
git push origin main

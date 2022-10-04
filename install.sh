#!/bin/bash

#we can't just store homebrew in tmp we must do it by user because FEUP doesn't allow
#you to alter other user's files. This is the easier way to do it but every user must redownload everything even
#though some other user might have it already
USER = $(whoami)
NEW_PATH = 'export PATH="$HOME/bin:/tmp/'+$USER+'/homebrew/bin:$PATH"'

if grep -Fxq "#LUIS POGGERS BREW FEUP SCRIPT ENV" $HOME/.bashrc
then
echo ".bashrc already with env vars"
else
#put bashrc exports to make brew usable in /tmp, brew apparently doesnt like
#this but so far it doesn't complain. it is needed to because FEUP gives you
#like 300mb of /home space 
echo "#LUIS POGGERS BREW FEUP SCRIPT ENV" >> $HOME/.bashrc
echo "export HOMEBREW_CURL_PATH=~/bin/curl" >> $HOME/.bashrc
echo "export HOMEBREW_CACHE=/tmp/$USER" >> $HOME/.bashrc
echo  "export PATH='$HOME/bin:/tmp/$USER/homebrew/bin:$PWD/scripts:$PATH'">> $HOME/.bashrc 
echo  "export CARGO_HOME=/tmp/$USER/cargo" >> $HOME/.bashrc
echo "export CMAKE_PREFIX_PATH=/tmp/$USER/homebrew" >> $HOME/.bashrc

fi

. $HOME/.bashrc #reload bashrc in this session

mkdir -p $HOME/bin
cd $HOME/bin
#download local copy of curl because ubuntu doesnt have by default ;-;
#this assumes amd64 
wget -nc https://github.com/moparisthebest/static-curl/releases/download/v7.83.1/curl-amd64
mv curl-amd64 curl
chmod +x curl

#clone homebrew
cd /tmp
mkdir -p $(whoami)
cd $(whoami)
mkdir -p cargo
git clone https://github.com/Homebrew/brew homebrew

. $HOME/.bashrc 
brew update --force

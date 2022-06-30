#!/bin/bash


if grep -Fxq "#LUIS POGGERS BREW FEUP SCRIPT ENV" $HOME/.bashrc
then
echo ".bashrc already with env vars"
else
#put bashrc exports to make brew usable in /tmp, brew apparently doesnt like
#this but so far it doesn't complain. it is needed to because FEUP gives you
#like 300mb of /home space 
echo "#LUIS POGGERS BREW FEUP SCRIPT ENV" >> $HOME/.bashrc
echo "export HOMEBREW_CURL_PATH=~/bin/curl" >> $HOME/.bashrc
echo "export HOMEBREW_CACHE=/tmp" >> $HOME/.bashrc
echo 'export PATH="$HOME/bin:/tmp/homebrew/bin:$PATH"' >> $HOME/.bashrc 
echo 'export CARGO_HOME=/tmp/cargo' >> $HOME/.bashrc
echo 'export CMAKE_SYSTEM_INCLUDE_PATH=/tmp/homebrew/include' >> $HOME/.bashrc
echo 'export CMAKE_SYSTEM_LIBRARY_PATH=/tmp/homebrew/lib' >> $HOME/.bashrc

fi

. $HOME/.bashrc #reload bashrc in this session

mkdir -p $HOME/bin
mkdir -p /tmp/cargo
cd $HOME/bin
#download local copy of curl because ubuntu doesnt have by default ;-;
#this assumes amd64 
wget -nc https://github.com/moparisthebest/static-curl/releases/download/v7.83.1/curl-amd64
mv curl-amd64 curl
chmod +x curl

#clone homebrew
cd /tmp
git clone https://github.com/Homebrew/brew homebrew

brew update --force


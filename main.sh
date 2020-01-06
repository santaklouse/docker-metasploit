#!/bin/bash

echo '[+] Initializing local clock'
ntpdate -B -q 0.debian.pool.ntp.org
source /usr/local/rvm/scripts/rvm
echo '[+] Initializing postgres'
service postgresql start
echo '[+] Initializing tor'
service tor start

git config --global user.name git
git config --global user.email "email@example.com"

echo '[+] Updating msf'
/opt/msf/msfupdate --git-remote origin

rvm install "ruby-2.6.5"
cd /opt/msf/
bundle install

echo '[+] Well done, enjoy your shell'
tmux new-session  "msfconsole; read"

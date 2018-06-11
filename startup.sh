#!/bin/bash

export DISPLAY=:1.0
mkdir $HOME/.vnc
echo -e 'password\npassword' | vncpasswd $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd
vncserver -geometry 1600x1200 -ZlibLevel=9 -AlwaysShared=on :1
pybot /home/robot
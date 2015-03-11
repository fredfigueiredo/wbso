#!/usr/bin/env bash

# Clear terminal screen
clear

# Define variables
scripts_folder="$HOME/.wsbo"
scripts_file='master.zip'

echo 'Preparing your WBSO Report Automator...'
# Download or update the WBSO Automator scripts
[ ! -d $scripts_folder ] && mkdir $scripts_folder
cd $scripts_folder
curl -sLOk https://github.com/fredfigueiredo/wbso/archive/${scripts_file}
tar -xf $scripts_file --strip 1 && rm $scripts_file

source wbso.sh
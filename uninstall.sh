#!/usr/bin/env bash

# Clear terminal screen
clear

# Define variables
scripts_folder="$HOME/.wsbo"

echo 'Uninstalling your WBSO Report Automator...'

if [ -d $scripts_folder ]; then
  rm -rf $scripts_folder
  echo "You're done! Keep submitting your WBSO report weekly."
else
  echo 'No track of WBSO Report Automator found.'
fi
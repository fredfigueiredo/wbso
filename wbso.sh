#!/usr/bin/env bash

# Load common functions
source parts/functions.sh

# Install Homebrew, required
source parts/brew.sh

# Setup WBSO configuration file
source parts/setup.sh

[ ! -f $config_file ] && echo 'Configuration file missing. Abort.' && exit 1
source $config_file

# Create this week report
source parts/report.sh

# Submit file
if [ ! -f $result_week_file_path ]; then
  echo -e '\nSubmitting this week Report...'
  curl -s -u $username -F "$input_name=@$wbso_week_file_path" --output $result_week_file_path $wbso_url_csv

  # TODO Check if file was submitted successfully
  echo -e '\nReport submitted successfully.'
fi

# Open WBSO for checking submission
echo 'Opening WBSO in your browser in 5 seconds...'
echo '(hit CTRL+C to abort)'
sleep 5
open $wbso_url
pause

echo -e "\nYou're all done. See you next week!"
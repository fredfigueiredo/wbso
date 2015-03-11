# Create the configuration file with WBSO URLs, ...

config_file='config.cfg'

# Function to ask user input and create a configuration file
function create_config() {

  echo -e '\nConfiguring your WBSO reporter...'

  # Ask for user input and create file
  echo -e '\nEnter WBSO main url:'
  echo -e '(example: https://yourcompany/wbso)'
  read wbso_url

  echo -e '\nEnter WBSO form url for uploading CSV files (check in HTML form action):'
  echo -e '(example: https://yourcompany/wbso/rest/import_csv.html)'
  read wbso_url_csv

  echo -e '\nEnter name of HTML input tag for the CSV file'
  echo -e '(example: source)'
  read input_name

  echo -e '\nEnter your WBSO username:'
  read username

  if test $wbso_url && test $wbso_url_csv && test $input_name && test $username; then

    # Create configuration file
    echo '# WBSO endpoint URLs' > $config_file
    echo "wbso_url='$wbso_url'" >> $config_file
    echo "wbso_url_csv='$wbso_url_csv'" >> $config_file
    echo '# HTML form input name' >> $config_file
    echo "input_name='$input_name'" >> $config_file
    echo '# Authentication credentials' >> $config_file
    echo "username='$username'" >> $config_file

    echo 'Configuration file created.'

  else

    echo 'Configuration file NOT created.'

  fi

  # TODO Check if configuration is valid (e.g. upload URL is valid?)

}

# Function to update the configuration
# TODO Call it to update configuration
function update_config() {

  echo 'Configuration file already exists.'
  read -n1 -p 'Do you want to update it [Y]es / [N]o? '
  if [[ $REPLY =~ ^[yY]$ ]]; then
    create_config
  fi

}

# Function to allow editing daily, weekly templates
# TODO change to support different template types
function edit_template() {

  echo -e '\nEdit your daily template. Opening in 3 seconds...'
  sleep 3
  open 'parts/templates/day.txt'
  pause

}


# Create configuration if file does exist
if [ ! -f $config_file ]; then
  create_config
  edit_template
fi
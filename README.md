# WBSO Report Automator

> Script to automate the generation and submission of your weekly WBSO report.

## Before You Start

By no means this script was created with the intention of overlooking the importance of filling
out your WBSO weekly sheets correctly.

On the contrary, the purpose is to automate a repetitive task and make it more efficient
and less error-prone (for you and your company).

Although this was created to meet my own needs, I am sure it can be extended to meet yours too.
For the moment, it assumes you submit always the same task / time per day.


## Requirements

* OS X (10.8 or 10.9)
* Homebrew and Coreutils


## Install

Open a terminal, copy & paste, and run:

```sh
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/wbso/master/install.sh)
```


## Setup

* Coreutils will be installed via Homebrew to access GNU/Linux bash
* You will be prompt to setup your WBSO during the first run
* Provide your WBSO main URL and the URL to the CSV upload page
* Edit your day template `parts/templates/day.txt`


## Usage

Go to your WBSO folder:
```sh
cd ~/.wbso
```

Run and follow the instructions:
```sh
wbso.sh
```

## Uninstall

Open a terminal, copy & paste, and run:

```sh
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/wbso/master/uninstall.sh)
```

## To Be Done

* Add and extend the templates to meet other scenarios
* Check template files validity
* Check in WBSO if current week was already submitted
 * Example: parse page for 100% complete
* Check submit output and show success or error messages
* Store encrypted password to allow passwordless submission
* Add support for running the script as a cron task
* Add command option to update configuration file
* Add possibility to customize any day of the week (e.g. vacations, sick days)
* Check configuration validity (e.g. are URLs correct?)


## Contributing

Feel free to contribute to this project with your own ideas and needs.
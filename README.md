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
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/wbso/dev/install.sh)
```


## Setup

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
bash <(curl -s https://raw.githubusercontent.com/fredfigueiredo/wbso/dev/uninstall.sh)
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


## License

The MIT License (MIT)

Copyright (c) 2015 Frederico Figueiredo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

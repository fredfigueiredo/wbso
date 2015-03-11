# Homebrew: http://brew.sh

# Check for Homebrew (OS X Packet Manager)
if test ! $(which brew); then

  echo 'Installing Homebrew...'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor

fi

# Check for coreutils (Linux/GNU tools)
if test ! $(brew list | grep 'coreutils'); then

  echo 'Installing coreutils...'
  brew install coreutils

fi
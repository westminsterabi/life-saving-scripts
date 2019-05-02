#!/bin/bash

# install atom
atom
if [[ $? != 0 ]]; then
  echo "Downloading atom"
  url="https://atom-installer.github.com/v1.36.0/atom-mac.zip?s=1554942428\
    &amp;ext=.zip"
  echo $(curl $url -o atom-mac.zip)
fi

# install homebrew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# make zsh default
chsh -s $(which zsh)

# install font icons
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# install powerlevel9k
ls ~/powerlevel9k
if [[ $? != 0 ]]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
fi


# configure powerlevel9k
echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()" >> ~/.zshrc
echo "POWERLEVEL9K_PROMPT_ADD_NEWLINE=true" >> ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc

echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

# make sfmono available to iterm
cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/

# get iterm and my color scheme
brew cask install iterm2
curl -O https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/lovelace.itermcolors

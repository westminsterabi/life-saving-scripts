#!/bin/bash

atom
if [[ $? != 0 ]]; then
  echo "Downloading atom"
  url="https://atom-installer.github.com/v1.36.0/atom-mac.zip?s=1554942428\
    &amp;ext=.zip"
  echo $(curl $url -o atom-mac.zip)
fi

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

chsh -s $(which zsh)

brew tap caskroom/fonts
brew cask install font-hack-nerd-font --dry-run


ls ~/powerlevel9k
if [[ $? != 0 ]]; then
  git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k
fi


echo "POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)" >> ~/.zshrc
echo "POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()" >> ~/.zshrc
echo "POWERLEVEL9K_PROMPT_ADD_NEWLINE=true" >> ~/.zshrc
echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc

echo 'source  ~/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

cd /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/
cp *.otf ~/Library/Fonts/

brew cask install iterm2

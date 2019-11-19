#!/bin/sh
set -e

#Install Homebrew if not present
tput setaf 2; echo 'Installing brew...'
which -s brew
if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

#Install zsh if not present
tput setaf 2; echo 'Installing zsh...'
which -s zsh
if [[ $? != 0 ]] ; then
	brew install zsh
else 
    tput setaf 2; echo "You already have zsh...skipping"
fi

#Install oh-my-zsh
tput setaf 2; echo 'Installing oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install figlet, cowsay, lolcat, fortune
tput setaf 2; echo 'Installing figlet, cowsay, lolcat, fortune, z, trash'
brew install cask
brew cask install visual-studio-code
brew cask install whatsapp
brew cask install spotify
brew install cowsay
brew install terminal-notifier
brew install lolcat
brew install figlet
brew install fortune
brew install z

#Setting up .vimrc and .zshrc
tput setaf 2; echo 'Setting up .vimrc and .zshrc...'
cp .vimrc ~/ &&
cp .zshrc ~/

#Install zsh-custom and zsh-syntax-highlighting
tput setaf 2; echo 'Install zsh-custom and zsh-syntax-highlighting...'
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &
wait

source ~/.zshrc

tput setaf 2; echo 'DONE!!!'
tput setaf 1; echo 'You need to download and setup cobalt-2 manually to complete the setup process.'

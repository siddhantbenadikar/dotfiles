# Script to update & clean up my macOS
#!/bin/bash
brew update
brew upgrade
brew cleanup -s
brew cask cleanup
#now diagnotic
brew doctor
brew missing

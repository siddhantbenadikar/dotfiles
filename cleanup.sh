# Script to update & clean up my macOS
#!/bin/bash
brew update
brew upgrade
brew cleanup -s
#now diagnotic
brew doctor
brew missing
conda clean -a -y

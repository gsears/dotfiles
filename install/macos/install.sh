# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew doctor
brew update

# So we use all of the packages we are about to install
echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
source ~/.bashrc

# Get stow for creating symlinks
brew install stow

# Link all simlinks
../../make link

# Install brew packages
cd ~
brew bundle
cd -

# Change default shell
chsh -s /bin/zsh

# Add tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Done"

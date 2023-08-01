# TODO: FIXME: XXX: HACK: NOTE: INTENT: USAGE:

sudo apt update

# INTENT: Install oh-my-zsh.
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# INTENT: Setup .zshrc and .zprofile
mv ~/.zshrc ~/.zshrc.bak
cp ubuntu-zshrc ~/.zshrc
cp ubuntu-zprofile ~/.zprofile
cp koh-my-zsh.zsh-theme ~/.oh-my-zsh/themes/koh-my-zsh.zsh-theme
source ~/.zprofile

# INTENT: Install Homebrew
sudo apt install build-essential git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zprofile
brew doctor
brew install gcc

# INTENT: Install pyenv and miniconda
brew install pyenv
source ~/.zprofile
pyenv install miniconda3-3.11-23.5.0-3

# INTENT: Set commit template.
cp commit_template ~/.commit_template
git config --global commit.template ~/.commit_template
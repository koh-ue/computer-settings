# TODO: FIXME: XXX: HACK: NOTE: INTENT: USAGE:

sudo apt update
sudo apt upgrade
sudo apt install curl
sudo apt install htop vim

# INTENT: Install oh-my-zsh.
sudo apt install git
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# INTENT: Install Homebrew
sudo apt install build-essential git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zprofile
brew doctor
brew install gcc

sudo chsh -s $(which zsh)

# INTENT: Setup .zshrc and .zprofile
mv ~/.zshrc ~/.zshrc.bak
cp ubuntu-zshrc ~/.zshrc
cp ubuntu-zprofile ~/.zprofile
cp koh-my-zsh.zsh-theme ~/.oh-my-zsh/themes/koh-my-zsh.zsh-theme
source ~/.zprofile

# INTENT: Install pyenv and miniconda
brew install pyenv
source ~/.zprofile
pyenv install miniconda3-3.11-23.5.0-3

# INTENT: Set commit template.
cp commit_template ~/.commit_template
git config --global commit.template ~/.commit_template
git config --global core.editor vim
git config --global user.email koh@uehara.to
git config --global user.name koh

# INTENT: Set ssh to GitHub.
touch ~/.ssh/config
echo -e "Host github github.com\n  HostName github.com\n  IdentityFile ~/.ssh/id_rsa\n  User git" >> ~/.ssh/config
ssh-keygen
cat ~/.ssh/id_rsa.pub

# INTENT: Install vscode.
sudo snap install --classic code

# INTENT: Install Gogh.
bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# INTENT: Install Chrome.
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
cd 

# INTENT: Make workspace directories.
mkdir ~/Documents/works

# INTENT: Install notion-app.
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt install notion-app-enhancecd
sudo apt install notion-app

# WARNING: PLEASE DO NOT USE THIS SCRIPT, JUST MANUALLY FOLLOW THE STEPS

# this script setup my personal ubuntu 18.04 dev-env for Ali cloud ECS host
# login as root

# change hosts
sudo gedit /etc/hosts

# install basic tools
apt-get update -y
apt-get upgrade -y
apt install -y vim clang cmake zsh tmux tree build-essential

# check git version
git --version
# install git
apt install git
# set git
git config --global user.name ""
git config --global user.email ""
# check git config
git config --list

# install python
apt install -y python3-pip
pip3 install numpy pandas jupyter virtualenv matplotlib requests

git clone https://github.com/you-as/dev-env
cd dev-env

# install vim config
cp /etc/vim/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
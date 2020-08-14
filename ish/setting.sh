apk add gcc gcc-objc git vim python lynx rsync

apk add make libpng libpng-devel libtiff libtiff-devel libobjc libxml2 libxml2-devel libX11-devel libXt-devel libjpeg libjpeg-devel

vi /etc/hosts

# set git
git config --global user.name ""
git config --global user.email ""
# check git config
git config --list

git clone https://github.com/you-as/dev-env
cd dev-env
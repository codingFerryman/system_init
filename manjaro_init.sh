mkdir -p ~/Workspace/aur
export AUR_DIR=~/Workspace/aur

# Enable time sync
sudo timedatectl set-ntp true

# yay
sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git $AUR_DIR/yay
cd $AUR_DIR/yay && makepkg -si --noconfirm

# System upgrade
yay --noconfirm

# github cli
sudo pacman -S --noconfirm github-cli

# Anaconda
pacman -Sy --noconfirm libxau libxi libxss libxtst libxcursor libxcomposite libxdamage libxfixes libxrandr libxrender mesa-libgl  alsa-lib libglvnd
curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -o ~/Downloads/anaconda.sh && bash ~/Downloads/anaconda.sh
~/anaconda3/bin/conda init zsh
source ~/.zshrc

jupyter server --generate-config
cp ./jupyter_server_config.py ~/.jupyter/
jupyter server password 

pip install --upgrade jupyterlab jupyterlab-git jupyter-server-proxy jupyterlab_latex jupyterlab-pullrequests
pip install --upgrade jupyterlab-fasta jupyterlab-geojson jupyterlab-katex jupyterlab-mathjax3 jupyterlab-vega2 jupyterlab-vega3
pip install jupyterlab-plugin-playground jupyterlab-lsp 'python-lsp-server[all]'

# Google Chrome
yay -S --noconfirm google-chrome

# Chinese(Pinyin) IME
# yay -S fcitx-libpinyin fcitx-cloudpinyin kcm-fcitx 
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki


# WeChat
yay -S --noconfirm deepin-wine-helper deepin-wine6-stable
yay -S --noconfirm xorg-xwininfo wqy-microhei noto-fonts-sc
git clone https://github.com/vufa/deepin-wine-wechat-arch.git $AUR_DIR/wechat
cd $AUR_DIR/wechat && makepkg -si --noconfirm

# MS Teams
yay -S --noconfirm teams

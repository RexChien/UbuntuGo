#!/bin/bash
cd ~

# edge (add apt source)
echo "deb [arch=amd64] http://packages.microsoft.com/repos/edge/ stable main" | 
  sudo tee "/etc/apt/sources.list.d/microsoft-edge-dev.list"

# firefox developer edition (direct download)
curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=zh-TW" | tar -xj
echo "[Desktop Entry]
Name=Firefox Developer Edition
Exec=$HOME/firefox/firefox
Icon=$HOME/firefox/browser/chrome/icons/default/default128.png
Categories=Network;" | sudo tee "/usr/share/applications/firefox-developer-edition.desktop"

sudo apt update
sudo apt install -y code microsoft-edge-dev google-chrome-stable gnome-keyring flameshot fonts-noto

git config --global user.name "inMyHeart"
git config --global user.email "inMyHeart@sample.com"
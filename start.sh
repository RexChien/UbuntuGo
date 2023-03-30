#!/bin/bash
cd ~

# edge (add apt source)
echo "deb [arch=amd64] http://packages.microsoft.com/repos/edge/ stable main" \
  | sudo tee "/etc/apt/sources.list.d/microsoft-edge-dev.list"

# firefox developer edition (direct download)
curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=zh-TW" | tar -xj
echo "[Desktop Entry]
Name=Firefox Developer Edition
Type=Application
Exec=$HOME/firefox/firefox
Icon=$HOME/firefox/browser/chrome/icons/default/default128.png
Categories=Network;" > .local/share/applications/firefox-developer-edition.desktop

sudo apt update
sudo apt install -y code microsoft-edge-dev google-chrome-stable gnome-keyring flameshot fonts-noto git

# config git
git config --global user.name "inMyHeart"
git config --global user.email "inMyHeart@sample.com"


# set firefox as default application
mkdir -p .local/share/xfce4/helpers
echo "[Desktop Entry]
Name=Firefox Developer Edition
Type=X-XFCE-Helper
Icon=$HOME/firefox/browser/chrome/icons/default/default128.png
X-XFCE-Category=WebBrowser
X-XFCE-Commands=$HOME/firefox/firefox
X-XFCE-CommandsWithParameter=$HOME/firefox/firefox "%s"
" > .local/share/xfce4/helpers/firefox-developer-edition.desktop
echo "WebBrowser=firefox-developer-edition" > .config/xfce4/helpers.rc

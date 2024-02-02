#!/bin/bash
cd ~

# Edge (add apt source)
echo "deb [arch=amd64] http://packages.microsoft.com/repos/edge/ stable main" \
  | sudo tee "/etc/apt/sources.list.d/microsoft-edge-dev.list"

# Firefox Developer Edition (direct download)
curl -L "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=zh-TW" | tar -xj
mkdir -p .local/share/applications
echo "[Desktop Entry]
Name=Firefox Developer Edition
Type=Application
Exec=$HOME/firefox/firefox
Icon=$HOME/firefox/browser/chrome/icons/default/default128.png
Categories=Network;" > .local/share/applications/firefox-developer-edition.desktop

# .net8
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt update
sudo apt install -y code microsoft-edge-dev google-chrome-stable gnome-keyring flameshot fonts-noto git dotnet-sdk-6.0 powershell

# config git
git config --global user.name "inMyHeart"
git config --global user.email "inMyHeart@sample.com"

# set Firefox Developer Edition as default application
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
mimeTypes=(text/html text/xml application/xhtml+xml application/xml \
  application/rss+xml application/rdf+xml application/x-xpinstall application/pdf application/x-wwf \
  image/gif mime image/jpeg image/png image/webp video/webm \
  x-scheme-handler/http x-scheme-handler/https x-scheme-handler/ftp x-scheme-handler/chrome)
for mimeType in ${mimeTypes[@]}; do
  gio mime $mimeType firefox-developer-edition.desktop
done

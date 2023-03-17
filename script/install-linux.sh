#!/bin/bash

RED='\033[1;31m'
CYAN='\033[1;36m'
BLUE='\033[1;34m'
NC='\033[0m'
d
echo -e "Hi! I will download and install ${BLUE}chat_desk${NC} into your system"

cd

rm -rf chat_desk
rm chat_desk*

echo -e "${CYAN}Grabbing the latest release from github${NC}"
(curl -s https://api.github.com/repos/omegaui/chat_desk/releases/latest \
| grep "browser_download_url.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -) || (echo -e "${RED}Download Failed!${NC}" && exit 1)

echo -e "${CYAN}You need to be logged in to install it to ${BLUE}/opt${NC}"

unzip "chat_desk*" -d chat_desk

echo -e "${CYAN}Downloading ${BLUE}Core, executable, App Icon and Desktop Entry${NC}"

sudo wget https://raw.githubusercontent.com/omegaui/chat_desk_core/main/script/chat_desk --output-document=/usr/bin/chat_desk
sudo wget https://raw.githubusercontent.com/omegaui/chat_desk_core/main/bin/chat_desk_core.exe --output-document=chat_desk/chat_desk_core.exe
sudo wget https://raw.githubusercontent.com/omegaui/chat_desk_core/main/pubspec.yaml --output-document=chat_desk/pubspec.yaml
sudo chmod 777 /usr/bin/chat_desk
sudo chmod 777 chat_desk/chat_desk_core.exe

sudo wget "https://raw.githubusercontent.com/omegaui/chat_desk_linux_install_script/main/resources/app_icon.png" --output-document=/opt/chat_desk_icon.png
sudo wget "https://raw.githubusercontent.com/omegaui/chat_desk_linux_install_script/main/resources/chat_desk.desktop" --output-document=/usr/share/applications/chat_desk.desktop

echo -e "${CYAN}Integrated Install Successful!${NC}"
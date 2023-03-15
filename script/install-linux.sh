#!/bin/bash

RED='\033[1;31m'
CYAN='\033[1;36m'
BLUE='\033[1;34m'
NC='\033[0m'

echo -e "Hi! I will download and install ${BLUE}chat_desk${NC} into your system"

echo -e "${CYAN}Grabbing the latest release from github${NC}"
(curl -s https://api.github.com/repos/omegaui/chat_desk/releases/latest \
| grep "browser_download_url.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -) || (echo "${RED}Download Failed!${NC}" && exit 1)

echo "${CYAN}You need to be logged in to install it to ${BLUE}/opt${NC}"

sudo unzip "chat_desk*" -d /opt/chat_desk

echo "Downloading App Icon and Desktop Entry"

sudo wget "https://raw.githubusercontent.com/omegaui/chat_desk_linux_install_script/main/resources/app_icon.png" --output-document=/opt/chat_desk/app_icon.png
sudo wget "https://raw.githubusercontent.com/omegaui/chat_desk_linux_install_script/main/resources/chat_desk.desktop" --output-document=/usr/share/applications/chat_desk.desktop

echo "${CYAN}Integrated Install Successful!${NC}"
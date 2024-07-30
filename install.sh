#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'
OK_EMOJI_TEXT='\n✅\n'

echo -e "${YELLOW}Atualizando os repositórios apt...${RESET}"
sudo apt update && sudo apt upgrade
echo -e "${OK_EMOJI_TEXT}" 

echo -e "${YELLOW}Instalando o curl...${RESET}"
sudo apt-get install curl
echo -e "${OK_EMOJI_TEXT}" 

if ! [ -n "$(command -v nvm)" ]; then
  echo -e "${YELLOW}Instalando NVM...${RESET}"
  eval "$(curl -o-  https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh| bash | grep -E -v "^.?=>")"
  echo -e "${OK_EMOJI_TEXT}"
fi

if [ -n "$(command -v nvm)" ]; then
  echo -e "${YELLOW}Instalando Node.js 22...${RESET}"
  nvm install 22
  node_version=$(node -v)
  echo -e "${GREEN}Versão instalada: ${RESET}${RED}${node_version}${RESET}"
  echo -e "${OK_EMOJI_TEXT}"
fi

echo -e "${YELLOW}Instalando as dependências Node.js...${RESET}"
npm i
echo -e "${OK_EMOJI_TEXT}"

#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 

while IFS= read -r ip; do
  if [[ -z "$ip" ]]; then continue; fi
  echo -e "Pinging $ip ..."
  if ping -c 4 -W 1 "$ip" &> /dev/null; then
    echo -e "${GREEN}$ip is reachable.${NC}"
  else
    echo -e "${RED}$ip is NOT reachable.${NC}"
  fi
done < /home/kali/Desktop/targets.txt

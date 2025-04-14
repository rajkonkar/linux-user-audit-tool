#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🛡️ Linux Security Audit Tool (Cybersec Edition)${NC}"

read -p "Enter the full path to the file to analyze (e.g., /etc/passwd): " filepath

if [[ ! -f "$filepath" ]]; then
    echo -e "${RED}❌ File not found or invalid path.${NC}"
    exit 1
fi

while true; do
    echo -e "\n${YELLOW}Select an analysis option:${NC}"
    echo "1. List all login-enabled users (excluding nologin/false)"
    echo "2. Count login-enabled users"
    echo "3. List all users with UID < 1000 (system accounts)"
    echo "4. List all users with UID >= 1000 (human users)"
    echo "5. List users with real interactive shells"
    echo "6. Find misconfigurations (e.g., /bin/bash shell but no home dir)"
    echo "7. List users with empty or missing home directories"
    echo "8. Show UID, GID, Home, and Shell for all users"
    echo "9. Export login-enabled users to findings.txt"
    echo "10. Check /etc/shadow for disabled or locked accounts"
    echo "11. Check /etc/group for important group memberships"
    echo "h. Help"
    echo "q. Quit"
    read -p "Enter your choice [1-11, h, q]: " choice

    echo ""
    case $choice in
      1)
        echo -e "${GREEN}✅ Login-enabled users:${NC}"
        awk -F: '!/nologin/ && !/false/ {print $1}' "$filepath"
        ;;
      2)
        echo -e "${GREEN}🔢 Count of login-enabled users:${NC}"
        awk -F: '!/nologin/ && !/false/ {print $1}' "$filepath" | wc -l
        ;;
      3)
        echo -e "${GREEN}⚙️ System users (UID < 1000):${NC}"
        awk -F: '$3 < 1000 {print $1","$3","$7}' "$filepath"
        ;;
      4)
        echo -e "${GREEN}👥 Human users (UID >= 1000):${NC}"
        awk -F: '$3 >= 1000 {print $1","$3","$7}' "$filepath"
        ;;
      5)
        echo -e "${GREEN}🖥️ Interactive shell users:${NC}"
        awk -F: '$7 ~ /bash|sh/ {print $1","$7}' "$filepath"
        ;;
      6)
        echo -e "${GREEN}⚠️ Users with /bin/bash but no home directory:${NC}"
        awk -F: '$7 ~ /bash/ && ($6 == "" || $6 == "/") {print $1","$6","$7}' "$filepath"
        ;;
      7)
        echo -e "${GREEN}📂 Users with empty or missing home directory:${NC}"
        awk -F: '($6 == "" || $6 == "/") {print $1","$6}' "$filepath"
        ;;
      8)
        echo -e "${GREEN}📋 UID, GID, Home, Shell for all users:${NC}"
        awk -F: '{print "User: " $1 ", UID: " $3 ", GID: " $4 ", Home: " $6 ", Shell: " $7}' "$filepath"
        ;;
      9)
        echo -e "${GREEN}📝 Exporting login-enabled users to findings.txt...${NC}"
        awk -F: '!/nologin/ && !/false/ {print $1","$3","$6","$7}' "$filepath" > findings.txt
        echo -e "${BLUE}Saved to findings.txt${NC}"
        ;;
      10)
        if [[ -f /etc/shadow ]]; then
          echo -e "${GREEN}🔐 Checking /etc/shadow for disabled/locked accounts:${NC}"
          awk -F: '($2 ~ /!|\*/){print $1 " is locked/disabled"}' /etc/shadow
        else
          echo -e "${RED}/etc/shadow not accessible. Run as root.${NC}"
        fi
        ;;
      11)
        if [[ -f /etc/group ]]; then
          echo -e "${GREEN}👥 Important group memberships (/etc/group):${NC}"
          grep -E '(^sudo|^wheel|^admin)' /etc/group
        else
          echo -e "${RED}/etc/group not found.${NC}"
        fi
        ;;
      h)
        echo -e "${BLUE}Help Menu:${NC}"
        echo "This tool analyzes system files (e.g., /etc/passwd) for common cybersecurity checks."
        echo "You can identify login-enabled users, system accounts, shell misconfigurations, and more."
        ;;
      q)
        echo -e "${YELLOW}Exiting the tool. Stay secure! 👋${NC}"
        break
        ;;
      *)
        echo -e "${RED}❌ Invalid option. Try again.${NC}"
        ;;
    esac
done

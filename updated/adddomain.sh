#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
#Getting
MYIP=$(wget -qO- ipinfo.io/ip);
error1="${RED} [ERROR] ${NC}"
success="${GREEN} [OK] ${NC}"
#Domain path
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
clear
echo -e "========================="
read -rp "Input Domain/Host : " -e domain1
echo -e "========================="
echo -e "Checking Domain: ${BLUE}${domain1} ${NC}Please Wait..."
echo -e "========================="
sleep 3

fi
# done
# Delete Files
rm -f /etc/xray/xray.crt
rm -f /etc/xray/xray.key
rm -f /root/domain
rm -f /etc/xray/domain
# Done
echo $domain1 >> /etc/xray/domain
echo $domain1 >> /root/domain
echo "IP=$domain1" >> /var/lib/akbarstorevpn/ipvps.conf
#Bersihkan terminal
clear
sleep 1

apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
mkdir -p /etc/xray
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m senowahyu62@gmail.com
bash acme.sh --issue --standalone -d $domain1 --force
bash acme.sh --installcert -d $domain1 --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
sleep 3
clear

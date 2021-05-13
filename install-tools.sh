#!/bin/bash

# APT

apt_tools=(

metasploit-framework
john
nmap
hydra
responder
wireshark
sqlmap
wfuzz
gobuster
smbclient
smbmap
curl
php-curl
tftp
vim
rusers
whois
dnsrecon
golang
xfce4-terminal
python3-pip
wpscan
joomscan
odat
gpp-decrypt
bruteforce-salted-openssl
checksec
binwalk
steghide
exiftool
gdb
ltrace
strace
netdiscover
snmp
snmp-mibs-downloader
snmpcheck
onesixtyone
nikto
davtest
padbuster
fcrackzip
cewl
crunch
bloodhound
sqlite3
knockd
finger
php
ftp
ldap-utils
kpcli
mdbtools
pst-utils
redis-tools
amass
subversion
rsync
ike-scan
rlwrap
mariadb-client
nfs-common
libreoffice
gimp
proxychains
gcc-multilib
xtightvncviewer
rdesktop
mingw-w64
socat
powershell
gss-ntlmssp
putty-tools
hashid
dos2unix
libcompress-raw-lzma-perl
jq
httptunnel
fping
atftp
powershell-empire
smtp-user-enum
awscli
crackmapexec
theharvester
recon-ng
flameshot
dirsearch

)

LIST=$(for i in ${apt_tools[@]}; do echo -n $i && echo -n ' '; done)

apt update && apt full-upgrade -y

apt install $LIST -y

# PIP

pip3 install bloodhound pypykatz droopescan mitm6 pwntools ropper uncompyle6 pacu s3scanner

# GO

mkdir -p /usr/local/go/src
mkdir -p /usr/local/go/bin
apt install libpcap-dev -y

go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe
GO111MODULE=on go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get github.com/projectdiscovery/naabu/v2/cmd/naabu
GO111MODULE=on go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go get github.com/haccer/subjack
go get github.com/ropnop/kerbrute

cd /usr/local/go/bin/
wget https://github.com/ropnop/go-windapsearch/releases/download/v0.3.0/windapsearch-linux-amd64
mv windapsearch-linux-amd64 windapsearch
chmod +x windapsearch
wget https://github.com/sensepost/gowitness/releases/download/2.3.4/gowitness-2.3.4-linux-amd64
mv gowitness-2.3.4-linux-amd64 gowitness
chmod +x gowitness

cd /usr/local/go/src/github.com/
https://github.com/N0MoreSecr3ts/wraith
cd wraith/
make build
cd
mkdir .wraith
cd .wraith/
git clone https://github.com/N0MoreSecr3ts/wraith-signatures
cd

# /OPT

mkdir -p /opt/tools
cd /opt/tools/

git clone https://github.com/SecureAuthCorp/impacket
cd impacket/
pip3 install .

git clone https://github.com/projectdiscovery/nuclei-templates
nuclei -ud /opt/tools/nuclei-templates/ -ut

git clone https://github.com/Ganapati/RsaCtfTool.git
apt install libgmp3-dev libmpc-dev -y
cd RsaCtfTool/
pip3 install -r requirements.txt
cd ..

mkdir ysoserial
cd ysoserial/
wget https://jitpack.io/com/github/frohoff/ysoserial/master-SNAPSHOT/ysoserial-master-SNAPSHOT.jar
mv ysoserial-master-SNAPSHOT.jar ysoserial.jar
cd ..

git clone https://github.com/swisskyrepo/SSRFmap

cd

# /USR/LOCAL/BIN

cd /usr/local/bin/
pip3 install mmh3 acefile

wget https://github.com/devanshbatham/FavFreak/raw/master/favfreak.py
chmod +x favfreak.py

wget https://github.com/Plazmaz/LNKUp/raw/master/generate.py
echo '#!/usr/bin/python3' | cat - generate.py > lnkup.py && rm generate.py
chmod +x lnkup.py

wget https://github.com/4n4nk3/Wordlister/raw/master/wordlister.py
mv wordlister.py wordlister
chmod +x wordlister

wget https://github.com/manulqwerty/Evil-WinRAR-Gen/raw/master/evilWinRAR.py
mv evilWinRAR.py evilWinRAR
chmod +x evilWinRAR

wget https://github.com/cddmp/enum4linux-ng/raw/master/enum4linux-ng.py
mv enum4linux-ng.py enum4linux-ng
chmod +x enum4linux-ng

cd

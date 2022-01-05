#!/bin/bash

echo '[*] STARTING'
echo ''
sleep 3

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
sendemail
wafw00f
rsh-client
hashcat
chromium

)

LIST=$(for i in ${apt_tools[@]}; do echo -n $i && echo -n ' '; done)

apt update && apt full-upgrade -y

apt install $LIST -y

download-mibs
sed -e '/mibs/ s/^#*/#/' -i /etc/snmp/snmp.conf

# PIP

pip3 install bloodhound pypykatz droopescan mitm6 pwntools ropper uncompyle6 pacu s3scanner pywerview git-dumper

# GO

mkdir -p /usr/local/go/src
mkdir -p /usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/local/go

apt install libpcap-dev -y

go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe
GO111MODULE=on go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get github.com/projectdiscovery/naabu/v2/cmd/naabu
GO111MODULE=on go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei
go get github.com/haccer/subjack
go get github.com/ropnop/kerbrute
go get github.com/hdm/nextnet

cd /usr/local/go/bin/
wget https://github.com/ropnop/go-windapsearch/releases/download/v0.3.0/windapsearch-linux-amd64
mv windapsearch-linux-amd64 windapsearch
chmod +x windapsearch
wget https://github.com/sensepost/gowitness/releases/download/2.3.4/gowitness-2.3.4-linux-amd64
mv gowitness-2.3.4-linux-amd64 gowitness
chmod +x gowitness

cd /usr/local/go/src/github.com/
git clone https://github.com/N0MoreSecr3ts/wraith
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
cd ..

git clone https://github.com/projectdiscovery/nuclei-templates
nuclei -ud /opt/tools/nuclei-templates/ -ut

git clone https://github.com/Ganapati/RsaCtfTool.git
apt install libgmp3-dev libmpc-dev -y
cd RsaCtfTool/
pip3 install -r requirements.txt
cd ..

mkdir java_tools
cd java_tools/
wget https://jitpack.io/com/github/frohoff/ysoserial/master-SNAPSHOT/ysoserial-master-SNAPSHOT.jar
cd ..

git clone https://github.com/danielbohannon/Invoke-Obfuscation
git clone https://github.com/dirkjanm/krbrelayx
git clone https://github.com/ambionics/phpggc
git clone https://github.com/0ang3el/aem-hacker
git clone https://github.com/sensepost/reGeorg

git clone https://github.com/ticarpi/jwt_tool
pip3 install cprint
cd jwt_tool
chmod +x jwt_tool.py
ln -s /opt/tools/jwt_tool/jwt_tool.py /usr/local/bin/jwt_tool
jwt_tool
cd ..

git clone https://github.com/swisskyrepo/SSRFmap
cd SSRFmap/
tail -n +2 ssrfmap.py > temp.py && echo '#!/usr/bin/python3' | cat - temp.py > ssrfmap.py && rm temp.py
chmod +x ssrfmap.py
ln -s /opt/tools/SSRFmap/ssrfmap.py /usr/local/bin/ssrfmap
cd ..

git clone https://github.com/epinna/tplmap
ln -s /opt/tools/tplmap/tplmap.py /usr/local/bin/tplmap

git clone https://github.com/fullhunt/log4j-scan
ln -s /opt/tools/log4j-scan/log4j-scan.py /usr/local/bin/log4j-scan

git clone https://github.com/WazeHell/sam-the-admin
cd sam-the-admin/
echo '#!/usr/bin/python3' | cat - sam_the_admin.py > noPac.py && rm sam_the_admin.py
chmod +x noPac.py
ln -s /opt/tools/sam-the-admin/noPac.py /usr/local/bin/noPac.py
cd ..

git clone https://github.com/codingo/NoSQLMap
cd NoSQLMap/
python setup.py install
ln -s /opt/tools/NoSQLMap/nosqlmap.py /usr/local/bin/nosqlmap
rm /usr/local/bin/NoSQLMap
cd ..

mkdir bloodhound
cd bloodhound/
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/AzureHound.ps1
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.ps1
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe

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

wget https://github.com/0x0000dd/subinfo/raw/main/subinfo
chmod +x subinfo
wget https://github.com/0x0000dd/p0rtscan/raw/main/p0rtscan
chmod +x p0rtscan
wget https://github.com/0x0000dd/xssthief/raw/main/xssthief
chmod +x xssthief
wget https://github.com/0x0000dd/tvdecrypt/raw/main/tvdecrypt
chmod +x tvdecrypt

cd

# OTHER

pip3 install keystone-engine
wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

gem install evil-winrm

wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
rm get-pip.py

apt autoremove -y

sleep 3
echo ''
echo '[*] DONE'

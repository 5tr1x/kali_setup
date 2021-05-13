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

pip3 install bloodhound pypykatz droopescan mitm6 pwntools ropper uncompyle6 pacu

# GO

mkdir -p /usr/local/go/src
mkdir -p /usr/local/go/bin
apt install libpcap-dev -y

go get -u github.com/tomnomnom/assetfinder
go get -u github.com/tomnomnom/httprobe
GO111MODULE=on go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get github.com/projectdiscovery/naabu/v2/cmd/naabu
GO111MODULE=on go get github.com/projectdiscovery/nuclei/v2/cmd/nuclei

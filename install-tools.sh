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
theharvester
recon-ng
flameshot
dirsearch
sendemail
wafw00f
rsh-client
hashcat
chromium
jadx
radare2
ghidra

)

LIST=$(for i in ${apt_tools[@]}; do echo -n $i && echo -n ' '; done)

apt update && apt full-upgrade -y

apt install $LIST -y

download-mibs
sed -e '/mibs/ s/^#*/#/' -i /etc/snmp/snmp.conf

# PIP

pip3 install bloodhound pypykatz droopescan mitm6 pwntools ropper uncompyle6 s3scanner pywerview git-dumper crackmapexec keystone-engine

apt install python3-gi gir1.2-gtk-3.0 gir1.2-webkit2-4.0 -y
pip3 install https://github.com/dlenski/gp-saml-gui/archive/master.zip

apt install python2-minimal
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
rm get-pip.py

# GO

mkdir -p /usr/local/go/src
mkdir -p /usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/local/go

apt install libpcap-dev -y

go install github.com/tomnomnom/httprobe@master
go install github.com/tomnomnom/assetfinder@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/sensepost/gowitness@latest
go install github.com/haccer/subjack@latest
go install github.com/ropnop/kerbrute@latest
go install github.com/hdm/nextnet@latest
go install github.com/ffuf/ffuf@latest

cd /usr/local/go/bin/
wget https://github.com/ropnop/go-windapsearch/releases/download/v0.3.0/windapsearch-linux-amd64
mv windapsearch-linux-amd64 windapsearch
chmod +x windapsearch
wget https://github.com/cyberark/kubeletctl/releases/download/v1.8/kubeletctl_linux_amd64
mv kubeletctl_linux_amd64 kubeletctl
chmod +x kubeletctl

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
wget https://github.com/pimps/JNDI-Exploit-Kit/raw/master/target/JNDI-Exploit-Kit-1.0-SNAPSHOT-all.jar
cd ..

git clone https://github.com/danielbohannon/Invoke-Obfuscation
git clone https://github.com/sensepost/reGeorg

git clone https://github.com/0ang3el/aem-hacker
cd aem-hacker/
for i in `ls aem_*`; do for j in `ls aem_* | wc -l`; do echo '#!/usr/bin/python3' | cat - $i > t$j.py && mv t$j.py $i; done; done
chmod +x aem_*
for i in `ls aem_*`; do ln -s /opt/tools/aem-hacker/$i /usr/local/bin/$i; done
cd ..

git clone https://github.com/dirkjanm/krbrelayx
cd krbrelayx/
for i in `ls *.py`; do for j in `ls *.py | wc -l`; do echo '#!/usr/bin/python3' | cat - $i > t$j.py && mv t$j.py $i; done; done
chmod +x *.py
for i in `ls *.py`; do ln -s /opt/tools/krbrelayx/$i /usr/local/bin/$i; done
cd ..

git clone https://github.com/ticarpi/jwt_tool
pip3 install cprint
cd jwt_tool
chmod +x jwt_tool.py
ln -s /opt/tools/jwt_tool/jwt_tool.py /usr/local/bin/jwt_tool
jwt_tool
cd ..

git clone https://github.com/joaomatosf/jexboss
cd jexboss/
pip2 install -r requires.txt
ln -s /opt/tools/jexboss/jexboss.py /usr/local/bin/jexboss
cd ..

git clone https://github.com/swisskyrepo/SSRFmap
cd SSRFmap/
tail -n +2 ssrfmap.py > temp.py && echo '#!/usr/bin/python3' | cat - temp.py > ssrfmap.py && rm temp.py
chmod +x ssrfmap.py
ln -s /opt/tools/SSRFmap/ssrfmap.py /usr/local/bin/ssrfmap
cd ..

git clone https://github.com/epinna/tplmap
ln -s /opt/tools/tplmap/tplmap.py /usr/local/bin/tplmap

git clone https://github.com/ambionics/phpggc
ln -s /opt/tools/phpggc/phpggc /usr/local/bin/phpgcc

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

git clone https://github.com/ly4k/Certipy
cd Certipy/
python3 setup.py install
cd ..

git clone https://github.com/zackelia/ghidra-dark
cd ghidra-dark/
python3 install.py --path /usr/share/ghidra/
cd ..

mkdir bloodhound
cd bloodhound/
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/AzureHound.ps1
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
wget https://github.com/puckiestyle/powershell/raw/master/SharpHound.ps1
cd ..

mkdir sliver
cd sliver/
wget $(curl -s "https://api.github.com/repos/BishopFox/sliver/releases/latest" | awk -F '"' '/browser_download_url/{print $4}' | grep sliver-client_linux | grep -v sig)
wget $(curl -s "https://api.github.com/repos/BishopFox/sliver/releases/latest" | awk -F '"' '/browser_download_url/{print $4}' | grep sliver-server_linux | grep -v sig)
chmod +x sliver-*
ln -s /opt/tools/sliver/sliver-client_linux /usr/local/bin/sliver-client
ln -s /opt/tools/sliver/sliver-server_linux /usr/local/bin/sliver-server

cd

# /USR/LOCAL/BIN

cd /usr/local/bin/
pip3 install mmh3 acefile

wget https://github.com/devanshbatham/FavFreak/raw/master/favfreak.py
chmod +x favfreak.py

wget https://github.com/Plazmaz/LNKUp/raw/master/generate.py
echo '#!/usr/bin/python3' | cat - generate.py > lnkup.py && rm generate.py
chmod +x lnkup.py

wget https://github.com/topotam/PetitPotam/raw/main/PetitPotam.py
tail -n +8 PetitPotam.py > petitTemp.py && echo '#!/usr/bin/python3' | cat - petitTemp.py > petitpotam.py && rm PetitPotam.py petitTemp.py
chmod +x petitpotam.py

wget https://github.com/ktecv2000/ProxyShell/raw/main/exploit.py
echo '#!/usr/bin/python3' | cat - exploit.py > proxyshell.py && rm exploit.py
chmod +x proxyshell.py

wget https://github.com/hausec/ProxyLogon/raw/main/proxylogon.py -O pl.py
echo '#!/usr/bin/python3' | cat - pl.py > proxylogon.py && rm pl.py
chmod +x proxylogon.py

wget https://github.com/4n4nk3/Wordlister/raw/master/wordlister.py
mv wordlister.py wordlister
chmod +x wordlister

wget https://github.com/manulqwerty/Evil-WinRAR-Gen/raw/master/evilWinRAR.py
mv evilWinRAR.py evilWinRAR
chmod +x evilWinRAR

wget https://github.com/cddmp/enum4linux-ng/raw/master/enum4linux-ng.py
mv enum4linux-ng.py enum4linux-ng
chmod +x enum4linux-ng

wget https://github.com/ShutdownRepo/ShadowCoerce/raw/main/shadowcoerce.py
chmod +x shadowcoerce.py

wget https://github.com/ShutdownRepo/pywhisker/raw/main/pywhisker.py
chmod +x pywhisker.py

wget https://github.com/ShutdownRepo/smartbrute/raw/main/smartbrute.py
chmod +x smartbrute.py

wget https://github.com/ShutdownRepo/targetedKerberoast/raw/main/targetedKerberoast.py
chmod +x targetedKerberoast.py

wget https://github.com/n00py/LAPSDumper/raw/main/laps.py
mv laps.py lapsdumper.py
chmod +x lapsdumper.py

wget https://github.com/micahvandeusen/gMSADumper/raw/main/gMSADumper.py
mv gMSADumper.py gmsadumper.py
chmod +x gmsadumper.py

wget https://raw.githubusercontent.com/Wh04m1001/DFSCoerce/main/dfscoerce.py
chmod +x dfscoerce.py

wget https://raw.githubusercontent.com/roughiz/lfito_rce/master/lfito_rce.py
mv lfito_rce.py lfi2rce.py
chmod +x lfi2rce.py

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl

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

wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py
echo source ~/.gdbinit-gef.py >> ~/.gdbinit

gem install evil-winrm

apt autoremove -y

sleep 3
echo ''
echo '[*] DONE'

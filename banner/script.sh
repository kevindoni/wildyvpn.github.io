#!/bin/bash
# Script Modified By WILDYVPN

export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
echo -e "========================================"
echo -e "*   SCRIPT AUTO INSTALL BY WILDY VPN   *"
echo -e "========================================"
echo -e "Masukkan Domain VPS Mu Jika Ga ada skip"
read -p "Hostname Domain :" Domain
echo -e "========================================"
echo -e "*   SCRIPT AUTO INSTALL BY WILDY VPN   *"
echo -e "========================================"
echo "IP=$Domain" >> /root/ipvps.conf
MYIP=$(dig @resolver1.opendns.com -t A -4 myip.opendns.com +short)
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

cd
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

#Config RC LOCAL
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service

#MEMATIKAN IPV6
echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc

#UPDATE SOURCE
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt install python -y
apt -y install wget curl
apt -y autoremove
apt -y autoclean
apt -y clean
apt -y remove --purge unscd

#Membuat Config V2RAY
mkdir /etc/v2ray
cd /etc/v2ray
wget http://wildyvpn.my.id/akun.conf
li
cd
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install neofetch
apt -y install gcc
apt -y install make
apt -y install cmake
apt -y install git
apt -y install screen
apt -y install unzip
apt -y install curl
apt -y install zlib1g-dev
apt -y install bzip2
apt -y install neofetch
echo "clear" >> .profile
echo "neofetch" >> .profile

#Nginstall Nginx
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/wildyvpn/wildyvpn/main/server/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Script Created By WILDY VPN</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/wildyvpn/wildyvpn/main/server/vps.conf"
/etc/init.d/nginx restart

#CONFIG BADVPN
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/wildyvpn/wildyvpn/main/server/badvpn-udpgw64"
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:8000 --max-clients 1000' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:8000 --max-clients 1000
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

#MENGINSTALL DROPBEAR
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 110 -p 109 -p 456"/g' /etc/default/dropbear
wget https://matt.ucc.asn.au/dropbear/releases/dropbear-2020.80.tar.bz2
bzip2 -cd dropbear-2020.80.tar.bz2 | tar xvf -
cd dropbear-2020.80
./configure
make && make install
mv /usr/sbin/dropbear /usr/sbin/dropbear.old
ln /usr/local/sbin/dropbear /usr/sbin/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
rm -f /root/dropbear-2020.80.tar.bz2
rm -rf /root/dropbear-2020.80

#INSTALL SUID PROXY / SQUID3
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/config/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install 
cd
vnstat -u -i $NET
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz 
rm -rf /root/vnstat-2.6

# install webmin
cd
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.910_all.deb
dpkg --install webmin_1.910_all.deb;
apt-get -y -f install;
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
rm -f webmin_1.910_all.deb
/etc/init.d/webmin restart

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
END

[dropbear]
accept = 443
connect = 127.0.0.1:109

[dropbear]
accept = 400
connect = 127.0.0.1:109

[dropbear]
accept = 443
connect = 127.0.0.1:22

[dropbear]
accept = 098
connect = 127.0.0.1:22

[dropbear]
accept = 123
connect = 127.0.0.1:22

[dropbear]
accept = 456
connect = 127.0.0.1:22

[dropbear]
accept = 789
connect = 127.0.0.1:22

[dropbear]
accept = 29
connect = 127.0.0.1:109

[openvpn]
accept = 442
connect = 127.0.0.1:1194

[dropbear]
accept = 2020
connect = 127.0.0.1:22
END

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart


# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Wis Selamat Telah Berhasil install.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Jika terjadi masalah hubungi gua di wa 0896-3528-4000'

# xml parser
cd
apt install -y libxml-parser-perl

# banner /etc/issue.net
wget -O /etc/issue.net "https://wildyvpn.my.id/banner/issue.net" && echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config && sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# download script
cd /usr/bin
wget -O /usr/bin/about "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/about.sh"
wget -O /usr/bin/utama "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/utama.sh"
wget -O /usr/bin/menu "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/utama.sh"
wget -O /usr/bin/tambah "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/tambah.sh"
wget -O /usr/bin/percobaan "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/percobaan.sh"
wget -O /usr/bin/hapus "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/hapus.sh"
wget -O /usr/bin/anggota "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/anggota.sh"
wget -O /usr/bin/delexp "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/delexp.sh"
wget -O /usr/bin/cek "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/cek.sh"
wget -O /usr/bin/restart "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/restart.sh"
wget -O /usr/bin/remin "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/remin.sh"
wget -O /usr/bin/reovpn "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/reovpn.sh"
wget -O /usr/bin/redrop "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/redrop.sh"
wget -O /usr/bin/resquid "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/resquid.sh"
wget -O /usr/bin/ressh "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/ressh.sh"
wget -O /usr/bin/restun "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/restun"
wget -O /usr/bin/ujicoba "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/ujicoba.py"
wget -O /usr/bin/info "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/info.sh"
wget -O /usr/bin/installvpn "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/installvpn.sh"
wget -O /usr/bin/addl2tp "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/addvpn.sh"
wget -O /usr/bin/dell2tp "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/delvpn.sh"
wget -O /usr/bin/addpptp "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/addpptp.sh"
wget -O /usr/bin/delpptp "https://raw.githubusercontent.com/wildyvpn/wildyvpn.github.io/main/banner/ssh/Script/delpptp.sh"

#Sabar Mengchmod / Mengijinkan akses
echo "0 5 * * * root reboot" >> /etc/crontab
chmod +x utama
chmod +x menu
chmod +x about
chmod +x tambah
chmod +x percobaan
chmod +x hapus
chmod +x anggota
chmod +x delexp
chmod +x cek
chmod +x restart
chmod +x remin
chmod +x reovpn
chmod +x addvpn
chmod +x delvpn
chmod +x redrop
chmod +x resquid
chmod +x ressh
chmod +x restun
chmod +x ujicoba
chmod +x info
chmod +x installvpn
chmod +x addl2tp
chmod +x dell2tp
chmod +x addpptp
chmod +x delpptp

#Menganalisa Sayang Ku
sed -i -e 's/\r$//' utama
sed -i -e 's/\r$//' menu
sed -i -e 's/\r$//' about
sed -i -e 's/\r$//' tambah
sed -i -e 's/\r$//' percobaan
sed -i -e 's/\r$//' hapus
sed -i -e 's/\r$//' anggota
sed -i -e 's/\r$//' delexp
sed -i -e 's/\r$//' cek
sed -i -e 's/\r$//' restart
sed -i -e 's/\r$//' remin
sed -i -e 's/\r$//' reovpn
sed -i -e 's/\r$//' redrop
sed -i -e 's/\r$//' resquid
sed -i -e 's/\r$//' ressh
sed -i -e 's/\r$//' restun
sed -i -e 's/\r$//' ujicoba
sed -i -e 's/\r$//' info
sed -i -e 's/\r$//' installvpn
sed -i -e 's/\r$//' addl2tp
sed -i -e 's/\r$//' dell2tp
sed -i -e 's/\r$//' addpptp
sed -i -e 's/\r$//' delpptp

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/webmin restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart

cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/wildyvpn/wildyvpn/main/server/badvpn-udpgw64"
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:8000 --max-clients 1000' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:8000 --max-clients 1000
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

history -c
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/script.sh

cd /etc
rm issue.net
wget "https://wildyvpn.my.id/banner/issue.net"

#Menginstall Certificate
ls
cd /etc/stunnel/
rm stunnel.pem
wget "https://wildyvpn.my.id/banner/stunnel.pem"
cd

restart
# finihsing
clear
neofetch
echo -e "============================ SSH / OVPN =================================="
echo -e "* utama                    : Menampilkan Menu Menu yang ada              *"
echo -e "* tambah                   : Membuat akun SSH & OVPN Baru                *"
echo -e "* percobaan                : Membuat akun SSH & OVPN Percobaan           *"
echo -e "* hapus                    : Menghapus akun Yang Bandel                  *"
echo -e "* cek                      : Cek Siapa Saja Yang Login                   *"
echo -e "* anggota                  : Cek Semua Anggota Di SSH / OVPN             *"
echo -e "* delexp                   : Menghapus Akun Yang Expired                 *"
echo -e "============================ SSH / OVPN =================================="
echo -e "*               WILDY VPN AUTO INSTALL SSH / OVPN SCRIPT                 *"
echo -e "============================ Menu System ================================="
echo -e "* restart                  : Merestart Semua Menu VPN                    *"
echo -e "* ressh                    : Merestart SSH                               *"
echo -e "* redrop                   : Merestart Dropbear                          *"
echo -e "* resquid                  : Merestart Squid Proxy                       *"
echo -e "* reovpn                   : Merestart OVPN Service                      *"
echo -e "* restun                   : Merestart Stunnel                           *"
echo -e "* remin                    : Merestart Webmin                            *"
echo -e "* reboot                   : Merestart Server VPS                        *" 
echo -e "* ujicoba                  : Mencoba Kecepatan Jaringan                  *"
echo -e "* info                     : Menampilkan Informasi System                *"
echo -e "* about                    : Menampilkan Informasi Script                *"
echo -e "* exit                     : Logout Dari Server                          *"
echo -e "============================= Tambahan ==================================="
echo -e "* installvpn               : Meningstall Package L2TP                    *"
echo -e "* addvpn                   : Membuat Akun L2TP Baru                      *"
echo -e "* delvpn                   : Menghapus Akun L2TP                         *"
echo -e "============================ Menu System ================================="
echo -e "*                                                                        *"
echo -e "*                     Script Created By WILDYVPN                         *"
echo -e "*                         WA = 0896-3528-4000                            *"
echo -e "*                                                                        *"
echo -e "============================= Thanks You ================================="
echo -e ""
echo "Reboot Dulu VPS Mu Dengan Cara Ketik reboot !!!!"

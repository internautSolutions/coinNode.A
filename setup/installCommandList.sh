#Initialization commands commented out

#useradd -m -G wheel -s /bin/bash nodeuser
#passwd nodeuser

export EDITOR=nano

#fallocate -l 4G /home/nodeuser/swapFile
#chmod 600 /home/nodeuser/swapFile
#mkswap /home/nodeuser/swapFile
#swapon /home/nodeuser/swapFile

#timedatectl set-ntp true
#echo en_US.UTF-8 UTF-8 > /etc/locale.gen
#locale-gen
#echo LANGE=en_US.UTF-8 > /etc/locale.conf
#rm /etc/localtime
#ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
#hwclock --systohc --utc
#echo coinnode > /etc/hostname
#mv hosts /etc/hosts

pacman -Syu --noconfirm bitcoin-daemon bitcoin-cli nodejs npm apache php-apache php sysstat sudo

mv conFiles/*.service /etc/systemd/system/
mkdir /home/nodeuser/.bitcoin/
mv conFiles/bitcoin.conf /home/nodeuser/.bitcoin/
mv conFiles/httpd.conf /etc/httpd/conf/
mv conFiles/bitcoin.server /usr/bin

cd /srv/http/server
npm install express

cd /usr/bin
npm install bitcoin-node-api
npm install express

cd /srv/
git clone https://github.com/internautSolutions/coinnodeWeb http

systemctl enable dhcpcd
systemctl enable httpd
systemctl enable bitcoind
systemctl enable btcAPI

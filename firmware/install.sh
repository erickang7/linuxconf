
#download from

sudo su
wget http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/buster/current/firmware.tar.gz
tar xvfz firmware.tar.gz
dpkg -i firmware-misc-nonfree_20170823-1_all.deb 
dpkg -i firmware-iwlwifi_20170823-1_all.deb


git clone https://github.com/LibreELEC/iwlwifi-firmware.git
cd iwlwifi-firmware/firmware

sudo cp iwlwifi-8265-34.ucode /lib/firmware/
sudo cp iwlwifi-8000C-34.ucode /lib/firmware/ 



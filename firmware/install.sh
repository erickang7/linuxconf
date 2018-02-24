
#download from

wget http://cdimage.debian.org/cdimage/unofficial/non-free/firmware/buster/current/firmware.tar.gz
tar xvfz firmware.tar.gz
sudo dpkg -i firmware-misc-nonfree_20170823-1_all.deb 
sudo dpkg -i firmware-iwlwifi_20170823-1_all.deb


git clone https://github.com/LibreELEC/iwlwifi-firmware.git
cd iwlwifi-firmware

sudo cp iwlwifi-8265-34.ucode /lib/firmware/



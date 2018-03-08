sudo pacman -S bluez bluez-utils
sudo modprobe btusb

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
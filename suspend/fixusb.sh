sudo cp disable-USB-wakeup.service /etc/systemd/system

sudo systemctl enable disable-USB-wakeup.service
sudo systemctl start disable-USB-wakeup.service

cat /proc/acpi/wakeup
sudo apt-get install -y tlp tlp-rdw acpi-call

sudo systemctl start tlp

sudo cp sleep.conf /etc/systemd/system

mkdir -p ~/tlpui
cd ~/tlpui

wget https://github.com/d4nj1/TLPUI/archive/master.zip
unzip master.zip
python3 tlpui.py
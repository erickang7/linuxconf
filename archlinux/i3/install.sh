sudo pacman -S i3

sudo pacman -S rxvt-unicode dmenu perl-json-xs perl-anyevent-i3 acpi playerctl
alsa-utils sysstat feh conky terminator polkit ranger w3m

cp config ~/.config/i3/config

mkdir -p ~/.config/i3blocks
mkdir -p ~/.config/i3status
mkdir -p ~/.config/rofi
mkdir -o ~/.config/ranger

cp i3blocks.conf ~/.config/i3blocks/config
cp i3status.conf ~/.config/i3status/config
cp rofi.conf ~/.config/rofi/config
cp rc.conf  ~/.config/ranger/rc.conf

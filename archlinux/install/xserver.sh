#install x server

pacman -S xorg-server xorg-apps xorg-init
pacman -S xf86-video-intel xf86-video-vesa

pacman -S gdm gdm3setup
pacman -S gnome gnome-extra

systemctl enable gdm

reboot
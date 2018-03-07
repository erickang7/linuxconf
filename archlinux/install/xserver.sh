#install x server

pacman -S xorg-server xorg-apps xorg-xinit
pacman -S xf86-video-intel xf86-video-vesa

pacman -S gdm gnome
#pacman -S gnome-extra

systemctl enable gdm

reboot
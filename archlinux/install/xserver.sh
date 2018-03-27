#install x server

pacman -S xorg-server xorg-apps xorg-xinit
pacman -S xf86-video-intel xf86-video-vesa

#pacman -S gdm gnome
#pacman -S gnome-extra
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
git clone https://aur.archlinux.org/archlinux-artwork.git 


#systemctl enable gdm

sudo reboot

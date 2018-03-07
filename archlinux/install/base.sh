# check the disk layout
fdisk -l

# partition
cfdisk /dev/sda

#format and init swap
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkswap /dev/sda1
swapon /dev/sda1

# to configure wifi 
wifi-menu

# install the base
pacstrap /mnt base base-devel

# enter the installed base

arch-chroot /mnt
passwd

#find the right locale and uncomment
vi /etc/locale.gen 

#locale-gen

# set the timezone
cd /usr/share/zoneinfo/US
ls
ln -s /usr/share/zoneinfo/US/Pacific /etc/localtime

# set the hostname
echo bluewood > /etc/hostname

# install grub
pacman -S grub-bios
grub-install /dev/sda
mkinitcpio -p linux
grup-mkconfig -o /boot/grub/grub.cfg

#exit 
exit

genfstab /mnt >> /mnt/etc/fstab
umount /mnt
reboot

#add user
useradd -m -g users -s /bin/bash <username>
passwd
visudo
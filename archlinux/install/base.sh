# check the disk layout
fdisk -l

# partition
cfdisk /dev/nvme0n1

#format and init swap
mkfs.ext4 /dev/nvme0n1<n>
mount /dev/nvme0n1 /mnt
mkswap /dev/nvme0n1
swapon /dev/nvme0n1

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
pacman -S grub-bios efibootmgr
mkdir -p /boot/efi
mount /dev/nvme0n1<n> /boot/efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader=arch-linux
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
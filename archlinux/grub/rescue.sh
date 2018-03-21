grub rescue>

ls
ls (hd0,gpt6)/boot/grub
set prefix=(hd0,gpt6)/boot/grub/x86_64-efi
insmod normal
normal

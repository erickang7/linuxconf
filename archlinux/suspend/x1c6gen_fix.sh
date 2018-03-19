# https://delta-xi.net/#056

# Reboot, enter your BIOS/UEFI. Go to Config - Thunderbolt (TM) 3 
# - set Thunerbolt BIOS Assist Mode to Enabled. 
# sIt has also been reported that Security - Secure Boot must be disabled.

sudo apt-get update && apt-get install -y iasl cpio
sudo cat /sys/firmware/acpi/tables/DSDT > dsdt.aml

iasl -d dsdt.aml

# Download the patch and apply it against dsdt.dsl:
wget https://delta-xi.net/download/X1C6_S3_DSDT.patch
patch --verbose < X1C6_S3_DSDT.patch

# Note: Hunk 6 may fail due to different specified memory regions. 
# In this case, simply edit the (almost fully patched) dsdt.dsl file, search for and entirely delete 
# the two lines reading solely the word "One". 
# You can look at hunk 6 in the patch file to see how the lines above and below look like if you're unsure.

# Plan B: If this does not work (patch is rejected): 
# It has been the case, that certain UEFI settings may lead to different DSDT images. 
# This means that it may be possible that the above patch doesn't work at all with your decompiled DSL. 
# If that is the case, don't worry: Go through the .patch file in your editor, and change your dsdt.dsl by hand. 
# This means locating the lines which are removed in the patch and removing them in your dsl. 
# The patch contains only one section at the end which adds a few lines - these are important and make the sleep magic happen.

# Make sure that the hex number at the end of the first non-commented line is incremented by one 
# (reading DefinitionBlock, should be around line 21). E.g., if it was 0x00000000 change it to 0x00000001. Otherwise, the kernel won't inject the new DSDT table.

# Recompile your patched version of the .dsl source.

iasl -ve -tc dsdt.dsl

# There shouldn't be any errors. When recompilation was successful, iasl will have built a new binary 
# .aml file including the S3 patch. Now we have to create a CPIO archive with the correct structure, 
# which GRUB can load on boot (much like initrd is loaded). 
# We name the final image acpi_override and copy it into /boot/.

mkdir -p kernel/firmware/acpi
cp dsdt.aml kernel/firmware/acpi
find kernel | cpio -H newc --create > acpi_override

sudo cp acpi_override /boot

# We yet have to tell GRUB to load our new DSDT table on boot in its configuration file, 
# usually located in /boot/grub/grub.cfg or something similar. Look out for the GRUB menu entry you're usually 
# booting, and simply add our new image to the initrd line. It should look somewhat like that 
# (if your initrd line contains other elements, leave them as they are and simply add the new ACPI override):

initrd   /acpi_override /initramfs-linux.img

# Note: You will need to do this again when your distribution updates the kernel 
# and re-writes the GRUB configuration. I'm looking for a more automated approach, 
# but was too lazy to do it so far.

# Moreover, GRUB needs to boot the kernel with a parameter setting the deep sleep state as default. 
# The best place to do this is /etc/default/grub, since that file is not going to be overwritten 
# when the GRUB config becomes regenerated. Simply add mem_sleep_default=deep to the 
# GRUB_CMDLINE_LINUX_DEFAULT configuration option. It should look somewhat like that:

  GRUB_CMDLINE_LINUX_DEFAULT="quiet mem_sleep_default=deep"

sudo reboot

sudo dmesg | grep ACPI | grep supports
# [    0.213668] ACPI: (supports S0 S3 S4 S5)

sudo cat /sys/power/mem_sleep
#s2idle [deep]

systemctl suspend -i

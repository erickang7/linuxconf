#enable following kernel option to resolve synaptics: The touchpad can support a better bus than the too old PS/2 protocol. 
#Make sure MOUSE_PS2_SYNAPTICS_SMBUS and RMI4_SMB are enabled to get a better touchpad experience.
cat /proc/cmdline

sudo vim /etc/default/grub
psmouse.synaptics_intertouch=1

sudo update-grub
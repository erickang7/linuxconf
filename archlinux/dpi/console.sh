sudo pacman -S kbd terminus-fonts

touch /etc/vconsole.conf
echo FONT=ter-132n | sudo tee -a -i /etc/vconsole.conf
echo FONT_MAP=8859-2 | sudo tee -a -i /etc/vconsole.conf

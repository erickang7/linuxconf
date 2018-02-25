mkdie -p ~/.themes
cd ~/.themes

wget https://github.com/B00merang-Project/macOS-Sierra/archive/master.zip
unip master.zip

gsettings set org.gnome.desktop.interface gtk-theme "macOS Sierra"
gsettings set org.gnome.desktop.wm.preferences theme "macOS Sierra"

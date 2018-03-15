git clone https://aur.archlinux.org/pidgin-hg.git
git clone https://aur.archlinux.org/webkitgtk.git
git clone https://aur.archlinux.org/gplugin.git
git clone https://aur.archlinux.org/enchant1.6.git
git clone https://aur.archlinux.org/meanwhile.git

sudo pacman -S mercurial intltool meson gperf gobject-introspection cmake lua-lgi  

cd webkitgtk
makepkg -si

cd ../gplugin
makepkg -si

enchant1.6 meanwhile webkitgtk3


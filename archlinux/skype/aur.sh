git clone https://aur.archlinux.org/pidgin-hg.git
git clone https://aur.archlinux.org/webkitgtk.git
git clone https://aur.archlinux.org/gplugin.git

sudo pacman -S mercurial intltool meson gperf gobject-introspection cmake lua-lgi  

cd webkitgtk
makepkg -si

cd ../gplugin
makepkg -si


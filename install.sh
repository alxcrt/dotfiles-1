# Mpd && Ncmpcpp
install_mpd () {
    sudo pacman -S --needed mpd ncmpcpp
    mkdir ~/.config/mpd
    mkdir ~/.ncmpcpp
    ln mpd/* ~/.config/mpd
    ln ncmpcpp/* ~/.ncmpcpp
}

# Wallpapers
install_wallpapers () {
    sudo ln arch.png /usr/share/wallpapers
    sudo ln jellyfish.png /usr/share/wallpapers
    sudo ln mountain.png /usr/share/wallpapers
    sudo ln checkrain.png /usr/share/wallpapers
}

# Nvim
install_nvim () {
    sudo pacman -S --needed nvim
    mkdir ~/.config/nvim
    ln nvim/* ~/.config/nvim
    ln .vimrc ~
}

# Rofi
install_rofi () {
    sudo pacman -S --needed rofi
    mkdir ~/.config/rofi
    mkdir ~/.config/rofi/launchers
    mkdir -p ~/.config/rofi/themes/colorschemes
    ln rofi/* ~/.config/rofi
    ln rofi/launchers/* ~/.config/rofi/launchers
    ln rofi/themes/colorschemes/* ~/.config/rofi/themes/colorschemes
}

# Ranger (with image preview (needs kitty))
install_ranger () {
    sudo pacman -S --needed ranger w3m python-pip
    pip3 install pillow
    mkdir ~/.config/ranger
    ln ranger/* ~/.config/ranger
}

# Zshrc (oh-my-zsh needed)
install_zsh () {
    ln .zshrc ~
    ln .p10k.zsh ~

    # Oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Powerlevel 10k (to use: set ZSH_THEME="powerlevel10k/powerlevel10k" in .zshrc)
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
}

# Install bspwm + configs etc.
install_wm () {
    
    # Install needed tools
    sudo pacman -S --needed polybar sxhkd bspwm nitrogen picom conky

    # Bswpm
	mkdir ~/.config/bspwm
	mkdir ~/.config/bspwm/scripts
	mkdir ~/.config/bspwm/sxhkd
	ln wm/bspwm/* ~/.config/bspwm 
	ln wm/bspwm/scripts/* ~/.config/bspwm/scripts
	ln wm/bspwm/sxhkd/* ~/.config/bspwm/sxhkd
	
	# Kitty
	mkdir ~/.config/kitty
	ln wm/kitty/* ~/.config/kitty
	
	# Polybar
	mkdir ~/.config/polybar
	ln wm/polybar/* ~/.config/polybar

    # Conky
    mkdir ~/.config/conky
    ln wm/conky/* ~/.config/conky

}

# Add function you like
main () {
    install_wallpapers
    install_nvim
    install_rofi
    install_mpd
    install_zsh
    install_wm
}

main

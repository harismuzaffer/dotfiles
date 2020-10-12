# Magical dot-files

> Configuration files on unix, often begin with a dot hence the word 'dot-files'

After cloning this repo(https://github.com/harismuzaffer/dotfiles.git), Use [Stow](https://www.gnu.org/software/stow/) to symlink the files correctly.
For example to symlink vim directory only, use `stow vim`. This will e.g. create a symlink ~/.vimrc to ~/dotfiles/vim/.vim/.vimrc and you are good to go 

### Contents
- **Vim**
  - .vimrc
  - vim directory: contains vim plugins and ftplugins/ after_ftplugins files
- **Config files**
  - Alacritty: yaml configuration file of a stupid fast termminal emulator written in Rust
  - Neovim: contains .init file of noevim which basically does nothing except sourcing the .vimrc file
  - Sway: A compositor for [Wayland](https://wiki.archlinux.org/index.php/Sway)
  - Wofi: Launcher for wayland based compositors
- **Tmux**
  - .tmux.conf



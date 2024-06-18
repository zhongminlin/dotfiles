# dotfiles
## set up
install [chezmoi](https://github.com/twpayne/chezmoi)
## apply config
```bash
chezmoi init git@github.com:zhongminlin/dotfiles.git --branch <branch_name> --apply
```
## download packages
### arch
```bash
sudo pacman -Syu
sudo pacman -S ~/.config/arch_pkg
```
### void
```bash
sudo xbps-install -Syu
sudo xbps-install -S ~/.config/void_pkg
```
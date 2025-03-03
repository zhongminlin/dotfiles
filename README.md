# dotfiles
## set up
install [chezmoi](https://github.com/twpayne/chezmoi)
### arch
```bash
sudo pacman -S chezmoi
```
### void
```bash
sudo xbps-install -S chezmoi
```
## apply config
```bash
chezmoi init git@github.com:zhongminlin/dotfiles.git --branch <branch_name> --apply
```
## download packages
### arch
```bash
sudo pacman -S ~/.config/arch_pkglist
# or
sudo pacman -S ~/.config/arch_pkg
```
### void
```bash
sudo xbps-install -S ~/.config/void_pkg
```
## screenshots
![morandi1](Pictures/Screenshots/morandi1.png)
![morandi2](Pictures/Screenshots/morandi2.png)
![catppuccin1](Pictures/Screenshots/catppuccin1.png)
![catppuccin2](Pictures/Screenshots/catppuccin2.png)
![nord1](Pictures/Screenshots/nord1.png)
![nord2](Pictures/Screenshots/nord2.png)
![gruvbox1](Pictures/Screenshots/gruvbox1.png)
![gruvbox2](Pictures/Screenshots/gruvbox2.png)
![store1](Pictures/Screenshots/store1.png)
![store2](Pictures/Screenshots/store2.png)
![synthwave1](Pictures/Screenshots/synthwave1.png)
![synthwave2](Pictures/Screenshots/synthwave2.png)

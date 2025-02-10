# Shell variables
# Generated by 'wal'
wallpaper="/home/zlin/Pictures/Wallpapers/XI1VCeWo.jpg"

# Special
background='#1b0f0b'
foreground='#c6c3c2'
cursor='#c6c3c2'

# Colors
color0='#1b0f0b'
color1='#DFA069'
color2='#768E87'
color3='#A6A599'
color4='#CBB89F'
color5='#B3C7BB'
color6='#E0D0B1'
color7='#99928f'
color8='#6f605a'
color9='#d5b89f'
color10='#7bc6b1'
color11='#d3ce9a'
color12='#ddc9b1'
color13='#b9e1c9'
color14='#e6dac4'
color15='#c6c3c2'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:7,bg:0,hl:1,fg+:232,bg+:1,hl+:255
    --color info:7,prompt:2,spinner:1,pointer:232,marker:1
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
# Colors
accent=$color12
light_value='0.05'
dark_value='0.30'

# Wallpaper
#wdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
#wallpaper="$wdir/wallpaper"

# Polybar
#~ polybar_font='Iosevka Nerd Font:size=10;3'

# Rofi
rofi_font='Noto Sans 10'
rofi_icon='flattrcolor'

# Terminal
terminal_font_name='NotoSansM Nerd Font Mono'
terminal_font_size='7'

# Geany
geany_colors='wal.conf'
geany_font='Noto Sans 10'

# base16 colors for neovim, qtile, qutebrowser
# set to 'pywal' to use pywal colors
base16_colors='pywal'

# Appearance
gtk_font='Noto Sans 9'
gtk_theme='Gruvbox-Dark'
icon_theme='Gruvbox-Light'
cursor_theme=''

# Dunst
dunst_width='300'
dunst_height='80'
dunst_offset='10x42'
dunst_origin='top-right'
dunst_font='Iosevka Custom 9'
dunst_border='1'
dunst_separator='1'

# Picom
picom_backend='glx'
picom_corner='0'
picom_shadow_r='14'
picom_shadow_o='0.30'
picom_shadow_x='-12'
picom_shadow_y='-12'
picom_blur_method='none'
picom_blur_strength='0'

# Qtile
bspwm_fbc="$accent"
bspwm_nbc="$background"
bspwm_abc="$color5"
bspwm_pfc="$color2"
bspwm_border='1'
bspwm_gap='10'
bspwm_sratio='0.50'

# Don't Delete This File

#!/usr/bin/env bash

## Script To Apply Themes

## Theme ------------------------------------
QDIR="$HOME/.config/qtile"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

## Apply random theme
random_theme() {
	## Set you wallpaper directory here.
	WALLDIR="`xdg-user-dir PICTURES`/Wallpapers"
	WALFILE="$HOME/.cache/wal/colors.sh"
	
	if [[ `which wal` ]]; then
		# dunstify -u low --replace=699 -i /usr/share/archcraft/icons/dunst/hourglass.png "Generating Colorscheme. Please wait..."
		echo -e "Generating colors"
		wal -q -n -s -t -e -i "$WALLDIR"
		# wpg -n --noreload -s "$wallpaper" # wpg gtk theme, requires wpgtk and flatcolor theme
		if [[ "$?" != 0 ]]; then
			# dunstify -u low --replace=699 -i /usr/share/archcraft/icons/dunst/palette.png "Failed to generate colorscheme."
			echo -e "failed to generate color"
			exit
		fi
		if [[ -f "$WALFILE" ]]; then
			cat "$WALFILE" > "$QDIR"/themes/"$THEME"/theme.bash
			cat "$QDIR"/themes/random/config.bash >> "$QDIR"/themes/"$THEME"/theme.bash
			echo -e "\n# Don't Delete This File" >> "$QDIR"/themes/"$THEME"/theme.bash
			# cat $HOME/.config/wpg/sequences
			# bspc wm -r # restart window manager
		fi
	else
		# dunstify -u normal --replace=699 -i /usr/share/archcraft/icons/dunst/palette.png "'pywal' is not installed."
		echo -e "pywal not installed"
	fi
}

random_theme

source "$QDIR"/themes/"$THEME"/theme.bash
altbackground="`pastel color $background | pastel lighten $light_value | pastel format hex`"
altforeground="`pastel color $foreground | pastel darken $dark_value | pastel format hex`"
color8="`pastel color $color0 | pastel lighten $light_value | pastel format hex`"
color9="`pastel color $color1 | pastel lighten $light_value | pastel format hex`"
color10="`pastel color $color2 | pastel lighten $light_value | pastel format hex`"
color11="`pastel color $color3 | pastel lighten $light_value | pastel format hex`"
color12="`pastel color $color4 | pastel lighten $light_value | pastel format hex`"
color13="`pastel color $color5 | pastel lighten $light_value | pastel format hex`"
color14="`pastel color $color6 | pastel lighten $light_value | pastel format hex`"
color15="`pastel color $color7 | pastel lighten $light_value | pastel format hex`"
# base16
color16="`pastel color $color0 | pastel lighten 0.05 | pastel format hex`"
color17="`pastel color $color0 | pastel lighten 0.1 | pastel format hex`"
color18="`pastel color $color8 | pastel darken 0.15 | pastel format hex`"
color19="`pastel color $color8 | pastel lighten 0.15 | pastel format hex`"
color20="`pastel color $color15 | pastel darken 0.1 | pastel format hex`"

## Directories ------------------------------
PATH_CONF="$HOME/.config"
PATH_GEANY="$PATH_CONF/geany"
PATH_BSPWM="$PATH_CONF/bspwm"
PATH_TERM="$PATH_BSPWM/alacritty"
PATH_PBAR="$PATH_BSPWM/themes/$THEME/polybar"
PATH_ROFI="$PATH_BSPWM/themes/$THEME/rofi"

## Wallpaper ---------------------------------
apply_wallpaper() {
	feh --bg-fill "$wallpaper"
}

## Polybar -----------------------------------
apply_polybar() {
	# modify polybar launch script
	sed -i -e "s/STYLE=.*/STYLE=\"$THEME\"/g" ${PATH_BSPWM}/themes/polybar.sh

	# apply default theme fonts
	sed -i -e "s/font-0 = .*/font-0 = \"$polybar_font\"/g" ${PATH_PBAR}/config.ini

	# rewrite colors file
	cat > ${PATH_PBAR}/colors.ini <<- EOF
		[color]
		
		BACKGROUND = ${background}
		FOREGROUND = ${foreground}
		ALTBACKGROUND = ${altbackground}
		ALTFOREGROUND = ${altforeground}
		ACCENT = ${accent}
		
		BLACK = ${color0}
		RED = ${color1}
		GREEN = ${color2}
		YELLOW = ${color3}
		BLUE = ${color4}
		MAGENTA = ${color5}
		CYAN = ${color6}
		WHITE = ${color7}
		ALTBLACK = ${color8}
		ALTRED = ${color9}
		ALTGREEN = ${color10}
		ALTYELLOW = ${color11}
		ALTBLUE = ${color12}
		ALTMAGENTA = ${color13}
		ALTCYAN = ${color14}
		ALTWHITE = ${color15}
	EOF
}

# Rofi --------------------------------------
apply_rofi() {
	# modify rofi scripts
	sed -i -e "s/STYLE=.*/STYLE=\"$THEME\"/g" \
		${PATH_BSPWM}/scripts/rofi_askpass \
		${PATH_BSPWM}/scripts/rofi_asroot \
		${PATH_BSPWM}/scripts/rofi_bluetooth \
		${PATH_BSPWM}/scripts/rofi_launcher \
		${PATH_BSPWM}/scripts/rofi_music \
		${PATH_BSPWM}/scripts/rofi_powermenu \
		${PATH_BSPWM}/scripts/rofi_runner \
		${PATH_BSPWM}/scripts/rofi_screenshot \
		${PATH_BSPWM}/scripts/rofi_themes \
		${PATH_BSPWM}/scripts/rofi_windows
	
	# apply default theme fonts
	sed -i -e "s/font:.*/font: \"$rofi_font\";/g" ${PATH_ROFI}/shared/fonts.rasi

	# rewrite colors file
	cat > ${PATH_ROFI}/shared/colors.rasi <<- EOF
		* {
		    background:     ${background};
		    background-alt: ${altbackground};
		    foreground:     ${foreground};
		    selected:       ${accent};
		    active:         ${color2};
		    urgent:         ${color1};
		}
	EOF

	# modify icon theme
	if [[ -f "$PATH_CONF"/rofi/config.rasi ]]; then
		sed -i -e "s/icon-theme:.*/icon-theme: \"$rofi_icon\";/g" ${PATH_CONF}/rofi/config.rasi
	fi
}

# Network Menu ------------------------------
apply_netmenu() {
	if [[ -f "$PATH_CONF"/networkmanager-dmenu/nmd.ini ]]; then
		sed -i -e "s#dmenu_command = .*#dmenu_command = rofi -dmenu -theme $PATH_ROFI/networkmenu.rasi#g" ${PATH_CONF}/networkmanager-dmenu/nmd.ini
	fi
}

# Terminal ----------------------------------
apply_terminal() {
	# alacritty : fonts
	sed -i ${PATH_TERM}/fonts.toml \
		-e "s/family = .*/family = \"$terminal_font_name\"/g" \
		-e "s/size = .*/size = $terminal_font_size/g"

	# alacritty : colors
	cat > ${PATH_TERM}/colors.toml <<- _EOF_
		## Colors configuration
		## Default colors
		[colors.primary]
		background = '${background}'
		foreground = '${foreground}'

		[colors.normal]
		black =   '${color0}'
		red =     '${color1}'
		green =   '${color2}'
		yellow =  '${color3}'
		blue =    '${color4}'
		magenta = '${color5}'
		cyan =    '${color6}'
		white =   '${color7}'

		[colors.bright]
		black =   '${color8}'
		red =     '${color9}'
		green =   '${color10}'
		yellow =  '${color11}'
		blue =    '${color12}'
		magenta = '${color13}'
		cyan =    '${color14}'
		white =   '${color15}'
	_EOF_
}

# Geany -------------------------------------
apply_geany() {
	sed -i ${PATH_GEANY}/geany.conf \
		-e "s/color_scheme=.*/color_scheme=$geany_colors/g" \
		-e "s/editor_font=.*/editor_font=$geany_font/g"
		
	cat > ${PATH_GEANY}/colorschemes/wal.conf <<- EOF	
	# Colors
	#-------------------------------------------------------------------------------
	# BG = ${background}
	# BG-ALT = ${altbackground}
	# FG = ${foreground}
	# FG-ALT = ${altforeground}
	# RED = ${color1}
	# GREEN = ${color2}
	# YELLOW = ${color3}
	# BLUE = ${color4}
	# MAGENTA = ${color5}
	# CYAN = ${color6}

	# LIME = ${color11}
	# PINK = ${color9}
	# PARROT = ${color10}

	#-------------------------------------------------------------------------------

	# Theme Info
	#-------------------------------------------------------------------------------
	[theme_info]
	name=Wal
	description=A dark color-scheme, matching with pywal style.
	compat=1.22;1.23;1.23.1;1.24

	[named_styles]
	default=${foreground};${background};false;false
	error=${color1};${background};true;false

	# Editor styles
	#-------------------------------------------------------------------------------

	selection=${background};${color5};true;true
	current_line=${foreground};${altbackground};true;false
	brace_good=${background};${color2};true;false
	brace_bad=${background};${color1};true;false
	margin_line_number=${altforeground}
	margin_folding=${altforeground};${altbackground}
	fold_symbol_highlight=${foreground}
	indent_guide=${background}
	caret=${color4};${background};false
	marker_line=${altbackground};${color4};
	marker_search=${altbackground};${color4};
	marker_mark=${altbackground};${color4};
	call_tips=${background};${foreground}
	white_space=${altforeground};${background};true;false

	# Programming languages
	#-------------------------------------------------------------------------------

	# comments
	comment=${color6}
	comment_doc=${color4}
	comment_line=comment
	comment_line_doc=comment_doc
	comment_doc_keyword=comment_doc,bold
	comment_doc_keyword_error=comment_doc_keyword,italic

	# numbers
	number=${color5}
	number_1=number
	number_2=number_1

	# type
	type=${color2}
	class=type
	function=default
	# like, variable \${}
	parameter=${color11}

	# keywords
	keyword=${color4}
	keyword_1=keyword
	keyword_2=type
	keyword_3=keyword_1
	keyword_4=keyword_1

	# identifiers
	identifier=default
	identifier_1=identifier
	identifier_2=identifier_1
	identifier_3=identifier_1
	identifier_4=identifier_1

	# strings ""
	string=${color1}
	string_1=string
	string_2=string_1
	string_3=default
	string_4=default
	string_eol=${background};${foreground}
	# strings ''
	character=${color2}
	# command \`\` or \$()
	backticks=${color10}
	# heredoc
	here_doc=${color9}

	scalar=${color11}
	label=default,bold
	preprocessor=${color3}
	regex=${color9}
	operator=${color3}
	decorator=preprocessor
	other=default
	extra=${color4}

	# Markup-type languages
	#-------------------------------------------------------------------------------

	tag=type
	tag_unknown=tag,italic
	tag_end=tag
	attribute=keyword
	attribute_unknown=attribute,italic
	value=string_1
	entity=preprocessor

	# Diff
	#-------------------------------------------------------------------------------

	line_added=${color2}
	line_removed=${color1}
	line_changed=${color5}

	EOF

}

# Appearance --------------------------------
apply_appearance() {
	XFILE="$PATH_BSPWM/xsettingsd"
	GTK2FILE="$HOME/.gtkrc-2.0"
	GTK3FILE="$PATH_CONF/gtk-3.0/settings.ini"

	# apply gtk theme, icons, cursor & fonts
	if [[ `pidof xsettingsd` ]]; then
		sed -i -e "s|Net/ThemeName .*|Net/ThemeName \"$gtk_theme\"|g" ${XFILE}
		sed -i -e "s|Net/IconThemeName .*|Net/IconThemeName \"$icon_theme\"|g" ${XFILE}
		sed -i -e "s|Gtk/CursorThemeName .*|Gtk/CursorThemeName \"$cursor_theme\"|g" ${XFILE}
	else
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=\"$gtk_font\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=\"$gtk_theme\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=\"$icon_theme\"/g" ${GTK2FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"$cursor_theme\"/g" ${GTK2FILE}
		
		sed -i -e "s/gtk-font-name=.*/gtk-font-name=$gtk_font/g" ${GTK3FILE}
		sed -i -e "s/gtk-theme-name=.*/gtk-theme-name=$gtk_theme/g" ${GTK3FILE}
		sed -i -e "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=$icon_theme/g" ${GTK3FILE}
		sed -i -e "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$cursor_theme/g" ${GTK3FILE}
	fi
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=$cursor_theme/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Dunst -------------------------------------
apply_dunst() {
	# modify dunst config
	sed -i ${PATH_BSPWM}/dunstrc \
		-e "s/width = .*/width = $dunst_width/g" \
		-e "s/height = .*/height = $dunst_height/g" \
		-e "s/offset = .*/offset = $dunst_offset/g" \
		-e "s/origin = .*/origin = $dunst_origin/g" \
		-e "s/font = .*/font = $dunst_font/g" \
		-e "s/frame_width = .*/frame_width = $dunst_border/g" \
		-e "s/separator_height = .*/separator_height = $dunst_separator/g" \
		-e "s/line_height = .*/line_height = $dunst_separator/g"

	# modify colors
	sed -i '/urgency_low/Q' ${PATH_BSPWM}/dunstrc
	cat >> ${PATH_BSPWM}/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 2
		background = "${background}"
		foreground = "${foreground}"
		frame_color = "${accent}"

		[urgency_normal]
		timeout = 5
		background = "${background}"
		foreground = "${foreground}"
		frame_color = "${accent}"

		[urgency_critical]
		timeout = 0
		background = "${background}"
		foreground = "${color1}"
		frame_color = "${color1}"
	_EOF_
}

## Get colors
getcolors () {
	FOREGROUND="$foreground"
	BACKGROUND="$background"
	CURSOR="$cursor"
	BLACK="$color0"
	RED="$color1"
	GREEN="$color2"
	YELLOW="$color3"
	BLUE="$color4"
	MAGENTA="$color5"
	CYAN="$color6"
	WHITE="$color7"
	ALTBLACK="$color8"
	ALTRED="$color9"
	ALTGREEN="$color10"
	ALTYELLOW="$color11"
	ALTBLUE="$color12"
	ALTMAGENTA="$color13"
	ALTCYAN="$color14"
	ALTWHITE="$color15"
}

## Write zathurarc file with current theme colors
apply_zathura () {
	bg_r=$(printf "%d\n" 0x${BACKGROUND:1:2})
	bg_g=$(printf "%d\n" 0x${BACKGROUND:3:2})
	bg_b=$(printf "%d\n" 0x${BACKGROUND:5:2})
	cat > "$PATH_CONF"/zathura/zathurarc <<- EOF		
	# Zathura configuration file
	set adjust-open                 "best-fit"
	set recolor                     "true"
	set recolor-keephue             "true"
	
	# semi transparent background
	set default-bg                  rgba(${bg_r},${bg_g},${bg_b},0.95)
	set default-fg                  "${WHITE}"

	set statusbar-bg                "${BACKGROUND}"
	set statusbar-fg                "${FOREGROUND}"
	set inputbar-bg                 "${BACKGROUND}"
	set inputbar-fg                 "${BLUE}"
	
	set highlight-color             "${ALTCYAN}"
	set highlight-active-color      "${CYAN}"

	set index-bg                    "${BACKGROUND}"
	set index-fg                    "${GREEN}" 
	set index-active-bg             "${YELLOW}"
	set index-active-fg             "${BLACK}" 
	
	set notification-error-bg       "${RED}" 
	set notification-error-fg       "${BACKGROUND}" 
	set notification-warning-bg     "${YELLOW}" 
	set notification-warning-fg     "${BACKGROUND}" 
	set notification-bg             "${BLUE}" 
	set notification-fg             "${BACKGROUND}" 

	set completion-bg               "${BACKGROUND}" 
	set completion-fg               "${GREEN}" 
	set completion-group-bg         "${BACKGROUND}" 
	set completion-group-fg         "${YELLOW}" 
	set completion-highlight-bg     "${CYAN}" 
	set completion-highlight-fg     "${BLACK}" 

	set render-loading              true
	set render-loading-fg           "${FOREGROUND}"
	set render-loading-bg           "${BACKGROUND}"
	
	# Recolor mode settings, fully transparent light background
	set recolor-lightcolor          rgba(${bg_r},${bg_g},${bg_b},0)
	set recolor-darkcolor           "${WHITE}"
	EOF
}

## Write CAVA colors file with current theme colors
apply_cava () {
	cat > "$PATH_CONF"/cava/config <<- EOF	
	[color]

	background = default
	foreground = default

	gradient = 1
	gradient_count = 6
	gradient_color_1 = '${BLUE}'
	gradient_color_2 = '${ALTBLUE}'
	gradient_color_3 = '${CYAN}'
	gradient_color_4 = '${ALTCYAN}'
	gradient_color_5 = '${GREEN}'
	gradient_color_6 = '${ALTGREEN}'
	EOF
}

## Write bashtop colors file with current theme colors
apply_bashtop () {
	cat > "$PATH_CONF"/bashtop/user_themes/pywal.theme <<- EOF	
	theme[main_bg]="none"
	theme[main_fg]="${FOREGROUND}"
	theme[title]="${FOREGROUND}"
	theme[hi_fg]="${BLUE}"
	theme[selected_bg]="${BLACK}"
	theme[selected_fg]="${BLUE}"
	theme[inactive_fg]="${ALTBLACK}"
	theme[graph_text]="${WHITE}"
	theme[meter_bg]="${BLACK}"
	theme[proc_misc]="${WHITE}"
	theme[cpu_box]="${CYAN}"
	theme[mem_box]="${GREEN}"
	theme[net_box]="${MAGENTA}"
	theme[proc_box]="${ALTWHITE}"
	theme[div_line]="${ALTBLACK}"
	theme[temp_start]="${GREEN}"
	theme[temp_mid]="${YELLOW}"
	theme[temp_end]="${RED}"
	theme[cpu_start]="${BLUE}"
	theme[cpu_mid]="${ALTBLUE}"
	theme[cpu_end]="${CYAN}"
	theme[free_start]="${CYAN}"
	theme[free_mid]="${CYAN}"
	theme[free_end]="${GREEN}"
	theme[cached_start]="${MAGENTA}"
	theme[cached_mid]="${MAGENTA}"
	theme[cached_end]="${ALTMAGENTA}"
	theme[available_start]="${WHITE}"
	theme[available_mid]="${ALTWHITE}"
	theme[available_end]="${ALTWHITE}"
	theme[used_start]="${YELLOW}"
	theme[used_mid]="${YELLOW}"
	theme[used_end]="${RED}"
	theme[download_start]="${BLUE}"
	theme[download_mid]="${BLUE}"
	theme[download_end]="${MAGENTA}"
	theme[upload_start]="${BLUE}"
	theme[upload_mid]="${BLUE}"
	theme[upload_end]="${MAGENTA}"
	theme[process_start]="${BLUE}"
	theme[process_mid]="${ALTBLUE}"
	theme[process_end]="${CYAN}"
	EOF
}

## Write Brave colors with current theme colors
apply_brave () {
	# Bento start page
	. $HOME/BentoPywal/generate-theme.sh
	# Brave theme
	. $HOME/ChromiumPywal/generate-theme.sh
}

apply_nvim () {
	cat > "$PATH_CONF"/nvim/lua/colors/pywal.lua <<- EOF	
    return {
      base00 = "$color0",
      base01 = "$color16",
      base02 = "$color17",
      base03 = "$color18",
      base04 = "$color19",
      base05 = "$color20",
      base06 = "$color7",
      base07 = "$color15",
      base08 = "$color1",
      base09 = "$color3",
      base0A = "$color11",
      base0B = "$color2",
      base0C = "$color6",
      base0D = "$color4",
      base0E = "$color5",
      base0F = "$color9",
    }
	EOF
}


# Compositor --------------------------------
apply_compositor() {
	picom_cfg="$PATH_BSPWM/picom.conf"

	# modify picom config
	sed -i "$picom_cfg" \
		-e "s/backend = .*/backend = \"$picom_backend\";/g" \
		-e "s/corner-radius = .*/corner-radius = $picom_corner;/g" \
		-e "s/shadow-radius = .*/shadow-radius = $picom_shadow_r;/g" \
		-e "s/shadow-opacity = .*/shadow-opacity = $picom_shadow_o;/g" \
		-e "s/shadow-offset-x = .*/shadow-offset-x = $picom_shadow_x;/g" \
		-e "s/shadow-offset-y = .*/shadow-offset-y = $picom_shadow_y;/g" \
		-e "s/method = .*/method = \"$picom_blur_method\";/g" \
		-e "s/strength = .*/strength = $picom_blur_strength;/g"
}

# BSPWM -------------------------------------
apply_bspwm() {
	# modify bspwmrc
	sed -i ${PATH_BSPWM}/bspwmrc \
		-e "s/BSPWM_FBC=.*/BSPWM_FBC='$bspwm_fbc'/g" \
		-e "s/BSPWM_NBC=.*/BSPWM_NBC='$bspwm_nbc'/g" \
		-e "s/BSPWM_ABC=.*/BSPWM_ABC='$bspwm_abc'/g" \
		-e "s/BSPWM_PFC=.*/BSPWM_PFC='$bspwm_pfc'/g" \
		-e "s/BSPWM_BORDER=.*/BSPWM_BORDER='$bspwm_border'/g" \
		-e "s/BSPWM_GAP=.*/BSPWM_GAP='$bspwm_gap'/g" \
		-e "s/BSPWM_SRATIO=.*/BSPWM_SRATIO='$bspwm_sratio'/g"
	
	# reload bspwm
	bspc wm -r
}

# Create Theme File -------------------------
create_file() {
	theme_file="$PATH_BSPWM/themes/.current"
	if [[ ! -f "$theme_file" ]]; then
		touch ${theme_file}
	fi
	echo "$THEME" > ${theme_file}
}

# Notify User -------------------------------
notify_user() {
	dunstify -u normal -h string:x-dunst-stack-tag:applytheme -i /usr/share/archcraft/icons/dunst/themes.png "Applying Style : $THEME"
}

## Execute Script ---------------------------
notify_user
create_file
apply_wallpaper
apply_polybar
apply_rofi
apply_netmenu
apply_terminal
apply_geany
apply_appearance
apply_dunst
getcolors
apply_zathura
apply_cava
apply_bashtop
apply_brave
apply_nvim
apply_compositor
apply_bspwm

#!/usr/bin/env bash
source $HOME/.cache/wal/colors.sh

light_value='0.05'
dark_value='0.30'
# color8="`pastel color $color0 | pastel lighten $light_value | pastel format hex`"
color9="`pastel color $color1 | pastel lighten $light_value | pastel format hex`"
color10="`pastel color $color2 | pastel lighten $light_value | pastel format hex`"
color11="`pastel color $color3 | pastel lighten $light_value | pastel format hex`"
color12="`pastel color $color4 | pastel lighten $light_value | pastel format hex`"
color13="`pastel color $color5 | pastel lighten $light_value | pastel format hex`"
color14="`pastel color $color6 | pastel lighten $light_value | pastel format hex`"
color15="`pastel color $color7 | pastel lighten $light_value | pastel format hex`"
color16="`pastel color $color0 | pastel lighten 0.05 | pastel format hex`"
color17="`pastel color $color0 | pastel lighten 0.1 | pastel format hex`"
color18="`pastel color $color8 | pastel darken 0.15 | pastel format hex`"
color19="`pastel color $color8 | pastel lighten 0.15 | pastel format hex`"
color20="`pastel color $color15 | pastel darken 0.1 | pastel format hex`"
# color21="`pastel color $color15 | pastel darken 0.03 | pastel format hex`"

cat > $HOME/.config/nvim/lua/colors/pywal.lua <<- EOF
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

cat > $HOME/.config/qutebrowser/config.py <<- EOF
config.load_autoconfig()

base00 = "$color0"
base01 = "$color16"
base02 = "$color17"
base03 = "$color18"
base04 = "$color19"
base05 = "$color20"
base06 = "$color7"
base07 = "$color15"
base08 = "$color1"
base09 = "$color3"
base0A = "$color11"
base0B = "$color2"
base0C = "$color6"
base0D = "$color4"
base0E = "$color5"
base0F = "$color9"

EOF

cat $HOME/.config/qutebrowser/apply-colors.py >> $HOME/.config/qutebrowser/config.py  

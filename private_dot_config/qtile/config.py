# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

colors = []
cache = '/home/zlin/.cache/wal/colors'
def load_colors(cache):  
    with open(cache, 'r') as file:
        for i in range(9):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()
load_colors(cache)

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink. ONLY WORKS in COLUMNS layout
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # for monadtall
    Key([mod, "mod1"], "l", lazy.layout.grow_main(), desc="Grow main window"),
    Key([mod, "mod1"], "h", lazy.layout.shrink_main(), desc="Shrink main window"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "w", lazy.spawn("qutebrowser"), desc="Launch browser"),
    Key([mod], "f", lazy.spawn("pcmanfm"), desc="Launch file manager"),
    Key([mod], "e", lazy.spawn("geany"), desc="Launch editor"),
    Key([mod], "k", lazy.spawn("kitty"), desc="Launch kitty"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "x", lazy.spawn("/home/zlin/PyBye/pybye.py"), desc="Power menu"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Key([mod], "r", lazy.spawn("dmenu_run -b -fn 'CaskaydiaCove Nerd Font-7.5' -nb '" + colors[0] +"' -nf '" + colors[7] + "' -sf '" + colors[7] + "' -sb '" + colors[1] + "'"), desc="dmenu"),
    Key([mod], "r", lazy.spawn("/home/zlin/.config/rofi/launchers/type-1/launcher.sh"), desc="rofi"),
    Key(['mod1'], "p", lazy.spawn("pamixer -i 2"), desc='Volume Up'),
    Key(['mod1'], "o", lazy.spawn("pamixer -d 2"), desc='Volume down'),
    Key(['mod1'], "m", lazy.spawn("pamixer -m"), desc='Volume Mute'),
    # Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='playerctl'),
    # Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='playerctl'),
    # Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='playerctl'),
    # Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc='brightness UP'),
    # Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc='brightness Down'),

]


grouplabel = ["壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"]
groups = [Group(f"{i+1}", label=grouplabel[i]) for i in range(9)]
# groups = [Group(i) for i in  '123456789']

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


layouts = [
        layout.MonadTall(border_focus=colors[1], border_normal=colors[0], border_width=2, margin=10 ),
        layout.Columns(border_focus=colors[1],border_focus_stack=[colors[1], colors[5]], border_normal=colors[0], border_width=2, margin=6 ),
        layout.Floating(border_focus=colors[1], border_normal=colors[0], border_width=2 ),
        layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    background=colors[0],
                    foreground=colors[8],
                    padding=0,
                    scale=0.5,
                    font='CaskaydiaCove Nerd Font'
                ),
                widget.CurrentLayout(
                    background=colors[0],
                    foreground=colors[7],
                    font='CaskaydiaCove Nerd Font'
                    ),
                widget.GroupBox(
                    font='Noto Sans CJK SC',
                    active=colors[6],
                    this_current_screen_border=colors[6],
                    this_current_border=colors[6],
                    background=colors[0],
                    foreground=colors[7]
                    ),
                widget.Prompt(
                    background=colors[0],
                    foreground=colors[7]
                   ),
                widget.WindowName(
                    background=colors[0],
                    foreground=colors[7],
                    font='CaskaydiaCove Nerd Font',
                    ),
                widget.Chord(
                    chords_colors={
                        "launch": (colors[8], colors[7])
                    },
                    name_transform=lambda name: name.upper(),
                    background=colors[6],
                    foreground=colors[7]
                ),
                # widget.TextBox("default config", 
                               # name="default",
                               # background="#232042",
                               # foreground="#acb7ed"
                               # ),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground=colors[1], background=colors[0]),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(
                    background=colors[0],
                    icon_size=15,
                    padding=15
                    ),
                widget.CPU(
                        font='CaskaydiaCove Nerd Font',
                        foreground=colors[5],
                        background=colors[0],
                        format=' {load_percent}%',
                        padding=0
                        ),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                widget.Memory(
                    format='﬙{MemUsed: .0f}{mm}',
                    font="CaskaydiaCove Nerd Font",
                    fontsize=12,
                    padding=0,
                    background=colors[0],
                    foreground=colors[2]
                    ),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                widget.TextBox(
                    text="",
                    font="CaskaydiaCove Nerd Font",
                    fontsize=12,
                    padding=0,
                    foreground=colors[3],
                    background=colors[0],
                    ),
                widget.Volume(
                        font='CaskaydiaCove Nerd Font',
                        foreground=colors[3],
                        background=colors[0],
                        ),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                # widget.PulseVolume(
                #     font='CaskaydiaCove Nerd Font',
                #     fontsize=12,
                #     padding=5,
                #     foreground=colors[3],
                #     background=colors[0],
                #     ),
                widget.Wttr(
                        font='CaskaydiaCove Nerd Font',
                        foreground=colors[4],
                        background=colors[0],
                        padding=0,
                        location={
                            '43.6529206,-79.3849007': 'Toronto',
                            },
                        format='%c%t'
                        ),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                widget.Net(
                        font='CaskaydiaCove Nerd Font',
                        foreground=colors[5],
                        background=colors[0],
                        format='↓{down} ↑{up}',
                        ),
                # widget.Wlan(),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                widget.Clock(
                        format="  %Y-%m-%d %a %I:%M %p",
                        foreground=colors[6],
                        background=colors[0],
                        font="CaskaydiaCove Nerd Font"
                        ),
                widget.Sep(padding=15,foreground=colors[7],background=colors[0],size_percent=10),
                widget.QuickExit(
                        foreground=colors[2],
                        background=colors[0],
                        default_text='⏻ ',
                        padding=0,
                        font="CaskaydiaCove Nerd Font"
                        ),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

from libqtile import hook
import os, subprocess
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

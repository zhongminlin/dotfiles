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

import os, subprocess
from libqtile import bar, layout, qtile, widget, extension, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from pathlib import Path

import colors

colors = colors.pywal

mod = "mod4"
terminal = guess_terminal()
browser = 'qutebrowser'
fm = 'thunar'

dmenu_theme = {
    "background" : colors[0],
    "foreground" : colors[7],
    "selected_background" : colors[13],
    "selected_foreground" : colors[0],
}

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
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
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
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # run launcher
    Key([mod], 'd', lazy.run_extension(extension.DmenuRun(
        **dmenu_theme,
        # dmenu_prompt=">",
        # dmenu_font="Andika-8",
        # dmenu_height=24,  # Only supported by some dmenu forks
    ))),
    # Key([mod], "d", lazy.spawn('dmenu_run'), desc='Dmenu run launcher'),
    Key([mod, "shift"], "r", lazy.spawn("/home/zlin/.config/rofi/launchers/type-1/launcher.sh"), desc="rofi"),
    # applications
    Key([mod, "shift"], "w", lazy.spawn(browser), desc='Launch browser'),
    Key([mod, "shift"], "f", lazy.spawn(fm), desc='Launch file manager'),
    # audio and brightness
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-")),
    # power menu as commandset
    Key([mod], 'x', lazy.run_extension(extension.CommandSet(
        commands={
            'shutdown': 'systemctl poweroff',
            'reboot': 'systemctl reboot',
            'suspend': 'systemctl suspend',
            # 'Lock Screen': 'pfetch',
            'logout': 'qtile cmd-obj -f shutdown',
            # 'Hibernate': 'systemctl hibernate',
            },
        # dmenu_bottom = True,
        **dmenu_theme,
        ))), 
    # theme menu as commandset
    Key([mod, "shift"], 't', lazy.run_extension(extension.CommandSet(
        commands={
                dir_.name: f"{dir_}/apply.sh"
                for dir_ in sorted(Path("~/.config/themes").expanduser().glob("*"))
                if (dir_ / "apply.sh").exists()
        },
        dmenu_prompt="Select a theme:",
        **dmenu_theme,
        ))), 
    # launch script to save color theme in terminal
    Key([mod, "shift"], "p", lazy.spawn("alacritty -e /home/zlin/.config/themes/pywal/save.sh"), desc="Save color theme"),
    # save a desktop screenshot
    Key([mod, "shift"], "s", lazy.spawn("bash -c 'maim /home/zlin/Pictures/Screenshots/$(date +%s).png'"), desc="Save desktop screenshot"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

grouplabel = ["壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"]
groups = [Group(f"{i+1}", label=grouplabel[i]) for i in range(9)]
# groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


layout_theme = {
    "border_width": 2,
    "margin": 5,
    "border_focus": colors[11],
    "border_normal": colors[0]
}
    
layouts = [
    layout.Bsp(**layout_theme,fair=False),
    layout.MonadTall(**layout_theme),
    # layout.Tile(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    # font="NotoSansM Nerd Font Mono",
    fontsize=12,
    padding=3,
    foreground=colors[7],
    background=colors[0],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox("", name="archlinux", padding=5, foreground=colors[13]),
                widget.Sep(padding=15, size_percent=10),
                widget.CurrentLayoutIcon(scale=0.5),
                widget.CurrentLayout(),
                widget.Sep(padding=15, size_percent=10),
                widget.GroupBox(
                    active=colors[7],
                    inactive=colors[3],
                    this_current_screen_border=colors[3],
                    # this_current_border=colors[15],
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.CPU(fmt='  {}', format='{load_percent}%', foreground=colors[15]),
                widget.Sep(padding=15, size_percent=10),
                widget.Memory(fmt='  {}',  format='{MemUsed: .1f}{mm}',measure_mem='G',foreground=colors[11]),
                widget.Sep(padding=15, size_percent=10),
                widget.DF(visible_on_warn=False,fmt='󰋊  {}',foreground=colors[14]),
                widget.Sep(padding=15, size_percent=10),
                widget.Battery(fmt='󰁹  {}',format='{char} {percent:2.0%}',foreground=colors[10]),
                # widget.Battery(fmt='󰁹  {}',format='{char} {percent:2.0%} {hour:d}:{min:02d}',foreground=colors[10]),
                widget.Sep(padding=15, size_percent=10),
                widget.WidgetBox(widgets=[
                    widget.Backlight(fmt='󰃟  {}',backlight_name='intel_backlight'),
                    widget.Sep(padding=15, size_percent=10),
                    widget.PulseVolume(fmt='󰕾  {}'),
                    widget.Sep(padding=15, size_percent=10),
                    widget.Bluetooth(fmt='󰂯  {}'),
                ]),
                widget.Sep(padding=15, size_percent=10),
                widget.Systray(),
                widget.Sep(padding=15, size_percent=10),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p",foreground=colors[13]),
                # widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
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
floats_kept_above = True
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
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# programs to start with qtile
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

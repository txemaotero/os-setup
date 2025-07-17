from libqtile import bar, layout, qtile, widget, extension, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from qtile_extras.widget.decorations import BorderDecoration

import colors
from pathlib import Path
import subprocess
import os

os.system("xrandr --output HDMI-0 --left-of DP-0")
os.system("xrandr --output HDMI-0 --mode 1920x1080 --rate 74.99")
os.system("xrandr --output DP-0 --mode 1920x1080 --rate 239.76")

mod = "mod4"
my_term = "wezterm"
my_browser = "google-chrome"
repo_dir = Path(__file__).parent / "../../../"


# A function for hide/show all the windows in a group
@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()


# A function for toggling between MAX and MONADTALL layouts
@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == "monadtall":
        qtile.current_group.layout = "max"
    elif current_layout_name == "max":
        qtile.current_group.layout = "monadtall"

@hook.subscribe.startup_once
def autostart():
    processes = [
        ['megasync'],
        ['emacs', "--fg-daemon"],
    ]

    for p in processes:
        subprocess.Popen(p)

HOME = Path()
keys = [
    Key([mod], "Return", lazy.spawn(my_term), desc="Terminal"),
    Key([mod], "b", lazy.spawn(my_browser), desc="Browser"),
    Key([mod], "e", lazy.spawn("emacsclient -c"), desc="Emacs"),
    Key([mod], "d", lazy.spawn(str(Path.home() / ".config/rofi/launchers/type-1/launcher.sh")), desc="Run launcher"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    # Move focus
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        lazy.layout.move_left().when(layout=["treetab"]),
        desc="Move window to the left/move tab left in treetab",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        lazy.layout.move_right().when(layout=["treetab"]),
        desc="Move window to the right/move tab right in treetab",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down().when(layout=["treetab"]),
        desc="Move window down/move down a section in treetab",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up().when(layout=["treetab"]),
        desc="Move window downup/move up a section in treetab",
    ),
    # Grow windows up, down, left, right.  Only works in certain layouts.
    # Works in 'bsp' and 'columns' layout.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "m", lazy.layout.maximize(), desc="Toggle between min and max sizes"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="toggle floating"),
    Key(
        [mod],
        "f",
        maximize_by_switching_layout(),
        lazy.window.toggle_fullscreen(),
        desc="toggle fullscreen",
    ),
    Key(
        [mod, "shift"],
        "m",
        minimize_all(),
        desc="Toggle hide/show all windows on current group",
    ),
    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen(), desc="Move focus to next monitor"),
    Key([mod], "comma", lazy.prev_screen(), desc="Move focus to prev monitor"),
    Key([mod], 's', lazy.run_extension(extension.CommandSet(
        commands={
            'reboot': 'reboot',
            'shutdown': 'shutdown now',
            'suspend': 'systemctl suspend',
            'restart qtile': 'qtile cmd-obj -o cmd -f restart',
            'logout': 'qtile cmd-obj -o cmd -f shutdown',
        },
        dmenu_lines=6))),
    Key([mod, "shift"], "s", lazy.spawn(str(Path.home() / ".config/rofi/applets/bin/screenshot.sh")), desc="Run launcher"),
]

groups = [Group(i) for i in "123456789"]

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
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )

chosen_colors = colors.DoomOne

layout_theme = {
    "border_width": 2,
    "margin": 8,
    "border_focus": chosen_colors[8],
    "border_normal": chosen_colors[0],
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Tile(
        shift_windows=True,
        border_width=0,
        margin=0,
        ratio=0.335,
    ),
    layout.Max(
        border_width=0,
        margin=0,
    ),
]

widget_defaults = dict(font="Hack Bold", fontsize=12, padding=0, background=chosen_colors[0][0])

extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Prompt(font="Hack Mono", fontsize=14, foreground=chosen_colors[1]),
        widget.GroupBox(
            fontsize=11,
            margin_y=5,
            margin_x=5,
            padding_y=0,
            padding_x=1,
            borderwidth=3,
            active=chosen_colors[8],
            inactive=chosen_colors[1],
            rounded=False,
            highlight_color=chosen_colors[2],
            highlight_method="line",
            this_current_screen_border=chosen_colors[7],
            this_screen_border=chosen_colors[4],
            other_current_screen_border=chosen_colors[7],
            other_screen_border=chosen_colors[4],
        ),
        widget.TextBox(
            text="|", font="Hack Mono", foreground=chosen_colors[1], padding=2, fontsize=14
        ),
        widget.CurrentLayoutIcon(foreground=chosen_colors[1], padding=4, scale=0.6),
        widget.CurrentLayout(foreground=chosen_colors[1], padding=5),
        widget.TextBox(
            text="|", font="Hack Mono", foreground=chosen_colors[1], padding=2, fontsize=14
        ),
        widget.WindowName(foreground=chosen_colors[6], max_chars=40, markup=False),
        widget.Systray(
            padding = 10
            ),
        widget.Spacer(length=8),
        widget.CPU(
            format="󰍛 {load_percent}%",
            foreground=chosen_colors[4],
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[4],
                    border_width=[0, 0, 2, 0],
                )
            ],
        ),
        widget.Spacer(length=8),
        widget.Net(interface='enp5s0', format='{down:.0f}{down_suffix} ↓↑ {up:.0f}{up_suffix} ',
            foreground=chosen_colors[5],
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[4],
                    border_width=[0, 0, 2, 0],
                )
            ],
                   ),
        widget.Spacer(length=8),
        widget.Memory(
            foreground=chosen_colors[8],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(my_term + " -e htop")},
            format="{MemUsed: .0f}{mm}",
            fmt="RAM {}",
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[8],
                    border_width=[0, 0, 2, 0],
                )
            ],
        ),
        widget.Spacer(length=8),
        widget.DF(
            update_interval=60,
            foreground=chosen_colors[5],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(my_term + " -e df")},
            partition="/",
            format="{uf}{m} free",
            fmt="󰋊  {}",
            visible_on_warn=False,
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[5],
                    border_width=[0, 0, 2, 0],
                )
            ],
        ),
        widget.Spacer(length=8),
        widget.PulseVolume(
            foreground=chosen_colors[7],
            fmt="   {}",
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[7],
                    border_width=[0, 0, 2, 0],
                )
            ],
        ),
        widget.Spacer(length=8),
        widget.Clock(
            foreground=chosen_colors[8],
            format="  %d/%m/%y - %H:%M",
            decorations=[
                BorderDecoration(
                    colour=chosen_colors[8],
                    border_width=[0, 0, 2, 0],
                )
            ],
        ),
        widget.Spacer(length=8),
    ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # Delete systray, only 1 allowed
    del widgets_screen1[7:9]
    return widgets_screen1


# All other monitors' bars will display everything but widgets 22 (systray) and 23 (spacer).
def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


def init_screens():
    return [
        Screen(
            top=bar.Bar(widgets=init_widgets_screen1(), size=26),
            wallpaper=str(repo_dir / "wallpapers/space_game.png"),
        ),
        Screen(
            top=bar.Bar(widgets=init_widgets_screen2(), size=26),
            wallpaper=str(repo_dir / "wallpapers/space_game.png"),
        ),
    ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


@lazy.function
def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.currentWindow.togroup(group)


@lazy.function
def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.currentWindow.togroup(group)


@lazy.function
def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=chosen_colors[8],
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="dialog"),  # dialog boxes
        Match(wm_class="download"),  # downloads
        Match(wm_class="error"),  # error msgs
        Match(wm_class="file_progress"),  # file progress boxes
        Match(wm_class="kdenlive"),  # kdenlive
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="notification"),  # notifications
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="toolbar"),  # toolbars
        Match(wm_class="Yad"),  # yad boxes
        Match(wm_class="megasync"),  # yad boxes
        Match(title="branchdialog"),  # gitk
        Match(title="Confirmation"),  # tastyworks exit box
        Match(title="Qalculate!"),  # qalculate-gtk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="tastycharts"),  # tastytrade pop-out charts
        Match(title="tastytrade"),  # tastytrade pop-out side gutter
        Match(title="tastytrade - Portfolio Report"),  # tastytrade pop-out allocation
        Match(wm_class="tasty.javafx.launcher.LauncherFxApp"),  # tastytrade settings
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

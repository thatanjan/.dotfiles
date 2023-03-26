from libqtile.config import Key
from libqtile.lazy import lazy

terminal = 'kitty'
ctrl = "control"
shift = "shift"


def init_keymaps_with_mod(mod):
    initial_keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(),
            desc="Move window focus to other window"),

        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
            desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
            desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
            desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([mod, "control"], "h", lazy.layout.grow_left(),
            desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(),
            desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(),
            desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key([mod], "f",
            lazy.window.toggle_fullscreen(),
            desc="Toggle fullscreen",
            ),

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
        Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
        Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "r", lazy.spawncmd(),
            desc="Spawn a command using a prompt widget"),
        Key([mod], 'd', lazy.spawn('rofi -show drun')),
        Key([mod, shift], "b", lazy.spawn(
            'brave-browser-nightly'), desc="Open brave browser"),

        # Switch focus to specific monitor (out of second)
        Key([mod], "w",
            lazy.to_screen(0),
            desc='Keyboard focus to monitor 1'
            ),
        Key([mod], "e",
            lazy.to_screen(1),
            desc='Keyboard focus to monitor 2'
            ),
    ]

    return initial_keys


def init_keymaps_without_mod():
    initial_keys = [
        # For volume
        Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer -q set Master 5%+')),
        Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer -q set Master 5%-')),
        Key([], 'XF86AudioMute', lazy.spawn('amixer -q set Master toggle')),

        Key([], 'F7', lazy.spawn('amixer -q set Master 5%+')),
        Key([], 'F6', lazy.spawn('amixer -q set Master 5%-')),
        Key([], 'F8', lazy.spawn('amixer -q set Master toggle')),

        # For Brightness
        Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
        Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    ]

    return initial_keys


keys = []

for keymap in init_keymaps_with_mod('mod1'):
    keys.append(keymap)

for keymap in init_keymaps_with_mod('mod4'):
    keys.append(keymap)


for keymap in init_keymaps_without_mod():
    keys.append(keymap)

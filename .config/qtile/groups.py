from libqtile.config import Group, Key
from libqtile.lazy import lazy

from keymaps import keys

mod = "mod4"
terminal = 'kitty'
ctrl = "control"
shift = "shift"
alt = 'alt'

# Define the list of group names
groups = [Group(str(i)) for i in range(1, 11)]

for i, group in enumerate(groups):
    group_key = '0' if i == len(groups) - 1 else group.name

    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                group_key,
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key([mod, "shift"], group_key, lazy.window.togroup(group.name),
                desc="move focused window to group {}".format(group.name)),
        ]
    )

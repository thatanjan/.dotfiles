import os
# from libqtile.widget import Battery, CPU, Backlight
# from libqtile import widget
# from libqtile.lazy import lazy
# from qtile_extras.widget import decorations

# for decorations
from qtile_extras.widget.decorations import PowerLineDecoration
from qtile_extras import widget

from colors import theme
# from battery_widget import Battery

from battery_widget import CustomBattery
from my_widget import MyWidget

decoration_defaults = dict(
    # colour = colors["white"],
    radius=10,
    filled=True,
    group=True,
    padding=2,
    fontsize=20
)

powerline = {
    "decorations": [
        PowerLineDecoration(path='rounded_right')
    ]
}


def is_laptop():
    battery_path = '/sys/class/power_supply/BAT0'
    return os.path.exists(battery_path)


def widgets_init():
    backlight_widget = widget.Backlight(
        backlight_name='amdgpu_bl0',
        step=5,
        update_interval=0.2,
        background=theme['magenta'],
        fmt='󰃠   {}',
        **powerline
    )

    distro_icon = widget.TextBox(
        text='  ',
        foreground='34BE5B',
        padding=20,
        fontsize=30
    )

    battery_widget = widget.Battery(
        battery_name="BAT0",
        discharge_char='',
        charge_char='',
        format=' {char}    {percent:2.0%}  ',
        background=theme['cyan'],
        foreground=theme['bg'],
        **powerline,
    )

    distro_icon = widget.TextBox(
        text=' ',
        foreground='34BE5B',
        padding=20,
        fontsize=20
    )

    cpu_widget = widget.CPU(
        format='   {freq_current}GHz  {load_percent}%',
        update_interval=1.0,
        background=theme['red'],
        padding=10,
        **powerline
    )

    net_widget = widget.Net(
        interface='wlp2s0' if is_laptop() else 'enp42s0',
        format=' ↓ {down} ↑ {up} ',
        background=theme['fg'],
        foreground=theme['bg'],
        padding=10,
        **powerline
    )

    layout_widget = widget.CurrentLayout()

    widget_list = [
        distro_icon,
        layout_widget,
        widget.Sep(
            linewidth=2,
            padding=15,
            foreground=theme['fg'],
        ),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=15,
            padding=5,  # Padding inside the box and determines the width
            margin=5,  # margin between group number boxes
            borderwidth=3,  # hightlight underline

            active=theme['white'],  # Active font color
            this_current_screen_border=theme['white'],  # Active border color
            highlight_color=theme['orange'],  # Active group background color

            inactive=theme['fg_gutter'],  # Inactive font color

            # Inactive monitor's active group border
            this_screen_border=theme['yellow'],

            rounded=False,
            highlight_method="line",
            # foreground=theme['white'],
            margin_y=3
        ),
        widget.Prompt(),
        widget.WindowName(
            fontsize=15,
            padding=10,
        ),
        widget.Spacer(
            **powerline,
        ),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
        # widget.StatusNotifier(),



        widget.Volume(step=5,
                      background=theme['blue'],
                      fmt='   {}',
                      ** powerline
                      ),
        cpu_widget,
        net_widget,
        widget.Clock(format="  %A, %d %b %H:%M",
                     background=theme['yellow'],
                     foreground=theme['bg']),
        # widget.Systray(background=theme['yellow']),


        # Custom battery widget need to take care later
        # CustomBattery(
        #     padding=10,
        #     foreground=theme["yellow"],
        #     mouse_callbacks={
        #         # "Button1": notification("battery"),
        #         # "Button3": lazy.widget["custombattery"].toggle_text(),
        #     },
        # ),
    ]

    if is_laptop():
        widget_list.insert(-2, battery_widget)
        widget_list.insert(-3, backlight_widget)

    print(widget_list)

    return widget_list

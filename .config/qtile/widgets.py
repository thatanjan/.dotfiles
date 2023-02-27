import os
from libqtile.widget import Battery, CPU
from libqtile import widget


def is_laptop():
    battery_path = '/sys/class/power_supply/BAT0'
    return os.path.exists(battery_path)


battery_widget = Battery(
    battery_name="BAT0",
    discharge_char='↓',
    charge_char='↑',
    format='{char} {percent:2.0%}',
)


cpu_widget = CPU(
    format='CPU: {freq_current}GHz {load_percent}%',
    update_interval=1.0,
    foreground=['#FFFFFF', '#FFFF00'],
)


def widgets_init():
    widget_list = [
        widget.CurrentLayout(),
        widget.GroupBox(),
        widget.Prompt(),
        widget.WindowName(),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
        # widget.StatusNotifier(),
        widget.Systray(),
        widget.Volume(step=5),
        cpu_widget,
        widget.Net(
            interface='enp42s0',
            format='{down} ↓↑ {up}',
        ),
        widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
        widget.QuickExit(),
    ]

    if is_laptop():
        widget_list.insert(-4, battery_widget)

    return widget_list

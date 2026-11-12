local mainMod = "SUPER"

-- Switch focus between monitors
hl.bind(mainMod .. " + Q", hl.dsp.focus({ monitor = "HDMI-A-1" }))
hl.bind(mainMod .. " + W", hl.dsp.focus({ monitor = "eDP-1" }))

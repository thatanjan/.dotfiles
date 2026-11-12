-- See https://wiki.hyprland.org/Configuring/Keywords/ for more
-- Setting variables
local HOME = os.getenv("HOME")

local mainMod = "SUPER"
local scriptsDir = HOME .. "/.config/hypr/scripts"

-- create function to float and then pin the window
local pin_window = function()
	local options = {
		action = "toggle",
	}

	hl.dispatch(hl.dsp.window.float(options))
	hl.dispatch(hl.dsp.window.pin(options))
end

hl.bind(mainMod .. " + P", pin_window, {
	description = "Float and pin the window",
})

-- Toggle bluetooh speaker
local bluetooth_speaker_script = scriptsDir .. "/bluetooth-speaker"
hl.bind("ALT + SHIFT + b", hl.dsp.exec_cmd(bluetooth_speaker_script))

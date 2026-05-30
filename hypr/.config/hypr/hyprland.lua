-- Hyprland Lua Configuration
-- Modularized version

-- Load Environment Variables
require("modules.env")

-- Load Monitors
require("modules.monitors")

-- Load Programs
local programs = require("modules.programs")

-- Load Autostart
require("modules.autostart")

-- Load Look and Feel (Appearance, Animations, Layouts, Misc)
require("modules.appearance")

-- Load Input and Devices
require("modules.input")

-- Load Keybindings
require("modules.keybindings")

-- Load Window and Workspace Rules
require("modules.rules")

require("colors")

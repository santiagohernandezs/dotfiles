hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})

local init_apps = { { name = "com.mitchellh.ghostty", wk = 1 }, { name = "zen-twilight", wk = 2 }, { name = "vesktop", wk = 3 } }

for i, app in pairs(init_apps) do
  hl.window_rule({
    match = {
      class = "^(" .. app.name .. ")$",
    },
    workspace = app.wk,
    no_initial_focus = true
  })
end

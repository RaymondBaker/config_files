local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--config.set_environment_variables = {
--    WAYLAND_DISPLAY = "wayland",
--}

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.automatically_reload_config = true
config.window_decorations = "RESIZE"

-- Required because gnome wayland requires apps to draw their title bar and default is really ugly
config.enable_wayland = false

config.font_size = 13

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '\\',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.tab_bar_at_bottom = true

return config

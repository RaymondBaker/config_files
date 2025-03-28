local wezterm = require 'wezterm'
local config = wezterm.config_builder()


-- Declaring globals no longer allowed without being explicit
-- https://www.lua.org/pil/14.2.html
-- This breaks plugins sadly
--setmetatable(_G, {
--  __newindex = function (_, n)
--    error("attempt to write to undeclared variable "..n, 2)
--  end,
--  __index = function (_, n)
--    error("attempt to read undeclared variable "..n, 2)
--  end,
--})


--config.set_environment_variables = {
--    WAYLAND_DISPLAY = "wayland",
--}

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.automatically_reload_config = true
config.window_decorations = 'RESIZE'

config.audible_bell = 'Disabled'

config.default_cursor_style = 'SteadyBlock'

-- config.default_cursor_style = 'BlinkingBlock'
-- Higher numbers look nice but slam gpu
-- config.animation_fps = 2

-- Required because gnome wayland requires apps to draw their title bar and default is really ugly
config.enable_wayland = false


config.font_size = 13

config.keys = {
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

-- This is how you append in the future
-- table.insert(config.keys,  {})

-- Must happen after keys is set
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config, {
  direction_keys = {
    move = { 'h', 'j', 'k', 'l' },
    resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
  },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = 'META', -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'META', -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
  -- log level to use: info, warn, error
  log_level = 'info',
})

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.tab_bar_at_bottom = true

return config

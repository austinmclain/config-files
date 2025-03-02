-- Pull in the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action

-- Set initial window size
wezterm.on("gui-startup", function(cmd)
  local screen            = wezterm.gui.screens().active
  local ratio             = 0.6
  local width, height     = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen' }
  }
  -- window:gui_window():maximize()
  window:gui_window():set_inner_size(width, height)
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.keys = {
    -- Navigation: Command+Left/Right to move to start/end of line
    { key = 'LeftArrow', mods = 'CMD', action = act.SendKey { key = 'Home' } },
    { key = 'RightArrow', mods = 'CMD', action = act.SendKey { key = 'End' } },
    
    -- Word navigation: Option+Left/Right to move between words
    { key = 'LeftArrow', mods = 'OPT', action = act.SendKey { key = 'LeftArrow', mods = 'CTRL' } },
    { key = 'RightArrow', mods = 'OPT', action = act.SendKey { key = 'RightArrow', mods = 'CTRL' } },
    
    -- Delete command: Command+Delete to clear current line
    { key = 'Delete', mods = 'CMD', action = act.SendKey { key = 'u', mods = 'CTRL' } },
    -- Alternative for Command+Backspace as well
    { key = 'Backspace', mods = 'CMD', action = act.SendKey { key = 'u', mods = 'CTRL' } },

    -- Switch tabs
    { key = '[', mods = 'CMD', action = act.ActivateTabRelative(-1) },
    { key = ']', mods = 'CMD', action = act.ActivateTabRelative(1) },
}

-- Enable selection with mouse
config.selection_word_boundary = " \t\n{}[]()\"'`,;:"

-- Make selection visible with custom colors
config.colors = {
  selection_fg = "black",
  selection_bg = "#fabd2f", -- Bright yellow for visibility
}

-- Fix mouse selection issue
config.mouse_bindings = {
  -- Select text with left mouse button
  {
    event = { Down = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.SelectTextAtMouseCursor "Cell",
  },
  {
    event = { Drag = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.ExtendSelectionToMouseCursor "Cell",
  },
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.CompleteSelection "Clipboard",
  },
}

-- For example, changing the color scheme:
config.color_scheme = 'Hacktober'

config.font_size = 15.0;

-- and finally, return the configuration to wezterm
return config

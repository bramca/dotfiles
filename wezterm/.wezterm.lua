-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Start fullscreen
local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:maximize()
end)

-- This is where you actually apply your config choices

config.term = "wezterm"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.macos_window_background_blur = 10

config.colors = {
  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#f1f1f1',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#f1f1f1'
}

-- and finally, return the configuration to wezterm
return config

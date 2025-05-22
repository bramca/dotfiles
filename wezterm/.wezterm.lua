-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Start fullscreen
local mux = wezterm.mux

wezterm.on('gui-startup', function(_)
  local _, _, window = mux.spawn_window({})
  local gui_window = window:gui_window();
  gui_window:maximize()
end)

-- This is where you actually apply your config choices

config.term = "wezterm"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- enable window transparency
config.window_background_opacity = 0.92

-- enable for blurring background when transparency is enabled
-- config.macos_window_background_blur = 10

config.colors = {
  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#659eda',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#659eda',
  foreground = "#cdcecf",
  background = "#0c1116",
  compose_cursor = '#f4a261',
  selection_bg = "#2b3b51",
  selection_fg = "#cdcecf",
  scrollbar_thumb = "#71839b",
  split = "#131a24",
  visual_bell = "#cdcecf",
}

-- and finally, return the configuration to wezterm
return config

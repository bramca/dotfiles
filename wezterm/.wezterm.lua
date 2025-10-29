-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tabline config
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = true,
		theme = "nightfox",
		tabs_enabled = true,
		theme_overrides = {
			tab = {
				active = { bg = "#cdcecf", fg = "black" },
			},
		},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			left = "",
			right = "",
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { "workspace" },
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "process", padding = { left = 0, right = 1 } },
		},
		tab_inactive = {
			"index",
			{ "cwd", max_length = 10, padding = { left = 0, right = 1 } },
		},
		tabline_x = { "ram", "cpu" },
		tabline_y = { "datetime", "battery" },
		tabline_z = { "domain" },
	},
	extensions = {},
})

-- Start fullscreen
-- local mux = wezterm.mux

-- wezterm.on('gui-startup', function(_)
--   local _, _, window = mux.spawn_window({})
--   local gui_window = window:gui_window();
--   gui_window:maximize()
-- end)

-- This is where you actually apply your config choices

config.term = "wezterm"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

config.enable_tab_bar = true
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"

-- enable window transparency
config.window_background_opacity = 0.85

-- enable for blurring background when transparency is enabled
-- config.macos_window_background_blur = 10

config.colors = {
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	foreground = "#cdcecf",
	background = "#0c1116",
	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#659eda",
	cursor_border = "#659eda",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "#0c1116",
	compose_cursor = "#f4a261",
	selection_bg = "#2b3b51",
	selection_fg = "#cdcecf",
	scrollbar_thumb = "#71839b",
	split = "#131a24",
	visual_bell = "#cdcecf",
	ansi = { "#393b44", "#c94f6d", "#81b29a", "#dbc074", "#719cd6", "#9d79d6", "#63cdcf", "#dfdfe0" },
	brights = { "#575860", "#d16983", "#8ebaa4", "#e0c989", "#86abdc", "#baa1e2", "#7ad5d6", "#e4e4e5" },
	tab_bar = {
		background = "#0c1116",
	},
}

local act = wezterm.action

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	-- Workspace keybindings
	{
		key = "y",
		mods = "CTRL|SHIFT",
		action = act.SwitchToWorkspace({
			name = "default",
		}),
	},
	{
		key = "s",
		mods = "CTRL|SHIFT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{ key = "i", mods = "CTRL|SHIFT", action = act.SwitchToWorkspace },
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	-- Tmux like keybindings
	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "/",
		mods = "LEADER",
		action = act.Search("CurrentSelectionOrEmptyString"),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config

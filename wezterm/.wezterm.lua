-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For ease of use
local act = wezterm.action

-- Colorscheme
config.color_scheme = "Material Darker (base16)"
config.colors = {
	background = "black",
	cursor_bg = "#659eda",
	cursor_border = "#659eda",
	tab_bar = {
		background = "black",
	},
}

-- History
config.scrollback_lines = 10000

-- Window and font configurations
config.term = "wezterm"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.window_decorations = "RESIZE"

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- enable window transparency
config.window_background_opacity = 0.85

-- enable for blurring background when transparency is enabled
-- config.macos_window_background_blur = 10

-- Tabline config
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup({
	options = {
		icons_enabled = false,
		theme = "Material Darker (base16)",
		tabs_enabled = true,
		theme_overrides = {
			tab = {
				active = { bg = "#cdcecf", fg = "black" },
			},
		},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "|",
			right = "|",
		},
		tab_separators = {
			left = "",
			right = "",
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

-- Sessionizer
local sessionizer = function(window, pane)
	local projects = {}

	local success, stdout, stderr = wezterm.run_child_process({
		"find",
		wezterm.home_dir .. "/dev",
		wezterm.home_dir .. "/temp",
		"-type",
		"d",
		"-mindepth",
		"1",
		"-maxdepth",
		"1",
	})

	if not success then
		wezterm.log_error("Failed to run find: " .. stderr)
		return
	end

	for line in stdout:gmatch("([^\n]*)\n?") do
		local project = line:gsub("/.git.*$", "")
		local label = project
		local id = project:gsub(".*/", "")
		table.insert(projects, { label = tostring(label), id = tostring(id) })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

-- Start fullscreen
-- local mux = wezterm.mux

-- wezterm.on('gui-startup', function(_)
--   local _, _, window = mux.spawn_window({})
--   local gui_window = window:gui_window();
--   gui_window:maximize()
-- end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

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
	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},
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
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action_callback(sessionizer),
	},
	{
		key = "u",
		mods = "LEADER",
		action = wezterm.action_callback(function(window, pane)
			local firsttab = window:mux_window():tabs()[1]
			local firstpane = firsttab:panes()[1]:pane_id()
			local checkcmds = { "/usr/bin/wezterm", "/opt/homebrew/bin/wezterm" }
			local weztermcmd = ""
			for _, cmd in pairs(checkcmds) do
				if io.open(cmd) ~= nil then
					weztermcmd = cmd
					break
				end
			end

			if weztermcmd == "" then
				wezterm.log_error("Cannot find wezterm command")
				return
			end
			local success, _, stderr = wezterm.run_child_process({
				weztermcmd,
				"cli",
				"split-pane",
				"--right",
				"--pane-id",
				firstpane,
				"--move-pane-id",
				pane:pane_id(),
			})

			if not success then
				wezterm.log_error("Failed to run wezterm cli: " .. stderr)
				return
			end

			firsttab:activate()
		end),
	},
	{
		key = "o",
		mods = "LEADER",
		action = wezterm.action_callback(function(_, pane)
			pane:move_to_new_tab()
			pane:activate()
		end),
	},
	{
		key = "a",
		mods = "LEADER",
		action = act.SendKey({ mods = "CTRL", key = "a" }),
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

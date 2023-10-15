local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"MesloLGS NF",
	}),
	font_size = 13,

	-- color_scheme = "Batman",
	line_height = 1.0,
	harfbuzz_features = { "ss13" },

	-- Wayland
	enable_wayland = true,

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,

	-- Padding
	window_padding = {
		left = 2,
		right = 0,
		top = 0,
		bottom = -10,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = false,

	-- General
	automatically_reload_config = true,
	-- inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 1.0,
	window_close_confirmation = "NeverPrompt",

	-- some custom styled
	allow_square_glyphs_to_overflow_width = "Always",
	-- font_antialias = "Subpixel",
	color_scheme = "Gruvbox Dark Hard",
	color_schemes = {
		["Gruvbox Dark Hard"] = {
			-- The default text color
			foreground = "#d4be98",
			-- The default background color
			background = "#1d2021",
			-- Overrides the cell background color when the current cell is occupied by the
			-- cursor and the cursor style is set to Block
			cursor_bg = "#d4be98",
			-- Overrides the text color when the current cell is occupied by the cursor
			cursor_fg = "#333333",
			-- Specifies the border color of the cursor when the cursor style is set to Block,
			-- of the color of the vertical or horizontal bar when the cursor style is set to
			-- Bar or Underline.
			cursor_border = "#d4be98",
			-- the foreground color of selected text
			-- selection_fg = "#333333",
			-- the background color of selected text
			selection_bg = "#45403d",
			-- The color of the scrollbar "thumb"; the portion that represents the current viewport
			scrollbar_thumb = "#333333",
			-- The color of the split lines between panes
			split = "#333333",
			ansi = {
				"#282828",
				"#ea6962",
				"#a9b665",
				"#d8a657",
				"#6f8faf",
				"#d3869b",
				"#89b482",
				"#d4be98",
			},
			brights = {
				"#928374",
				"#ef938e",
				"#bbc585",
				"#e1bb7e",
				"#8aaaaa",
				"#e1acbb",
				"#a7c7a2",
				"#e2d3ba",
			},
		},
	},

	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		-- font = wezterm.font({ family = "MesloLGS NF" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 13.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#333333",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#333333",

		-- The color of the inactive tab bar edge/divider
		-- inactive_tab_edge = "#575757",
	},

	-- colors = {
	-- 	tab_bar = {
	-- 		-- The color of the strip that goes along the top of the window
	-- 		-- (does not apply when fancy tab bar is in use)
	-- 		background = "#0b0022",
	--
	-- 		-- The active tab is the one that has focus in the window
	-- 		active_tab = {
	-- 			-- The color of the background area for the tab
	-- 			bg_color = "#2b2042",
	-- 			-- The color of the text for the tab
	-- 			fg_color = "#c0c0c0",
	--
	-- 			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
	-- 			-- label shown for this tab.
	-- 			-- The default is "Normal"
	-- 			intensity = "Normal",
	--
	-- 			-- Specify whether you want "None", "Single" or "Double" underline for
	-- 			-- label shown for this tab.
	-- 			-- The default is "None"
	-- 			underline = "None",
	--
	-- 			-- Specify whether you want the text to be italic (true) or not (false)
	-- 			-- for this tab.  The default is false.
	-- 			italic = false,
	--
	-- 			-- Specify whether you want the text to be rendered with strikethrough (true)
	-- 			-- or not for this tab.  The default is false.
	-- 			strikethrough = false,
	-- 		},
	--
	-- 		-- Inactive tabs are the tabs that do not have focus
	-- 		inactive_tab = {
	-- 			bg_color = "#1b1032",
	-- 			fg_color = "#808080",
	--
	-- 			-- The same options that were listed under the `active_tab` section above
	-- 			-- can also be used for `inactive_tab`.
	-- 		},
	--
	-- 		-- You can configure some alternate styling when the mouse pointer
	-- 		-- moves over inactive tabs
	-- 		inactive_tab_hover = {
	-- 			bg_color = "#3b3052",
	-- 			fg_color = "#909090",
	-- 			italic = true,
	--
	-- 			-- The same options that were listed under the `active_tab` section above
	-- 			-- can also be used for `inactive_tab_hover`.
	-- 		},
	--
	-- 		-- The new tab button that let you create new tabs
	-- 		new_tab = {
	-- 			bg_color = "#1b1032",
	-- 			fg_color = "#808080",
	--
	-- 			-- The same options that were listed under the `active_tab` section above
	-- 			-- can also be used for `new_tab`.
	-- 		},
	--
	-- 		-- You can configure some alternate styling when the mouse pointer
	-- 		-- moves over the new tab button
	-- 		new_tab_hover = {
	-- 			bg_color = "#3b3052",
	-- 			fg_color = "#909090",
	-- 			italic = true,
	--
	-- 			-- The same options that were listed under the `active_tab` section above
	-- 			-- can also be used for `new_tab_hover`.
	-- 		},
	-- 	},
	-- },

	initial_cols = 150,
	initial_rows = 50,

	keys = {
		-- This will create a new split and run your default program inside it
		{
			key = "s",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "e",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "z", mods = "CTRL|SHIFT", action = "TogglePaneZoomState" },
		{ key = "q", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

		-- Pane Sections
		-- Pane Navigates
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		-- Pane Cycles
		{ key = "<", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Next" }) },
		-- { key = "<", mods = "CTRL", action = wezterm.action({ ActivatePaneDirection = "Prev" }) },
		-- Pane Resize
		{ key = "H", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Left", 2 } }) },
		{ key = "J", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Down", 2 } }) },
		{ key = "K", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Up", 2 } }) },
		{ key = "L", mods = "CTRL|ALT", action = wezterm.action({ AdjustPaneSize = { "Right", 2 } }) },

		-- TAB section
		{ key = ",", mods = "CTRL", action = wezterm.action({ ActivateTabRelativeNoWrap = 1 }) },
		{ key = "m", mods = "CTRL", action = wezterm.action({ ActivateTabRelativeNoWrap = -1 }) },

		-- search for the string "hash" matching regardless of case
		{ key = "F", mods = "CTRL|SHIFT", action = wezterm.action({ Search = { CaseInSensitiveString = "hash" } }) },

		-- { key = "L", mods = "CTRL|SHIFT", action = "ShowLauncher" },
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		-- {
		-- 	key = "v",
		-- 	mods = "CTRL|SHIFT",
		-- 	action = wezterm.action({ PasteFrom = "Clipboard" }),
		-- },
		-- {
		-- 	key = "c",
		-- 	mods = "CTRL|SHIFT",
		-- 	action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		-- },
	},
}

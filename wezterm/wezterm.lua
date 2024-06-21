local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

-- Start in full screen
wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- Check for OS
local is_linux = function()
  return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
  return wezterm.target_triple:find("darwin") ~= nil
end

config.default_prog = { '/bin/zsh', '-l' }

config.color_scheme = "Hardcore"

config.window_padding = {
  left = 40,
  right = 20,
  top = 10,
  bottom = 10,
}

if is_darwin() then
  config.window_decorations = 'RESIZE'
  config.font_size = 14
  config.native_macos_fullscreen_mode = false
end

if is_linux() then
  config.window_decorations = 'TITLE|RESIZE'
  config.font_size = 11
end

config.window_close_confirmation = "NeverPrompt"

config.font = wezterm.font("JetBrainsMono Nerd Font")

config.hide_tab_bar_if_only_one_tab = true

config.adjust_window_size_when_changing_font_size = false


config.window_background_opacity = 0.95

config.inactive_pane_hsb = {
  saturation = 0.4,
  brightness = 0.4
}

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 2000
}

config.keys = {
  { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '_', mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'LEADER',       action = act.ActivatePaneDirection 'Left', },
  { key = 'j', mods = 'LEADER',       action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'LEADER',       action = act.ActivatePaneDirection 'Up', },
  { key = 'l', mods = 'LEADER',       action = act.ActivatePaneDirection 'Right', },
  { key = 'h', mods = 'LEADER|SHIFT', action = act({ AdjustPaneSize = { 'Left', 5 } }) },
  { key = 'j', mods = 'LEADER|SHIFT', action = act({ AdjustPaneSize = { 'Down', 5 } }) },
  { key = 'k', mods = 'LEADER|SHIFT', action = act({ AdjustPaneSize = { 'Up', 5 } }) },
  { key = 'l', mods = 'LEADER|SHIFT', action = act({ AdjustPaneSize = { 'Right', 5 } }) },
  { key = 'c', mods = 'CTRL|SHIFT',   action = act({ CopyTo = "Clipboard" }) },
  { key = 'v', mods = 'CTRL|SHIFT',   action = act({ PasteFrom = "Clipboard" }) },
  { key = 'f', mods = 'LEADER',       action = act.ToggleFullScreen },

}

return config

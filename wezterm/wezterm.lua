local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)


return {
  default_prog = { '/bin/zsh', '-l' },
  -- window_decorations = 'RESIZE',

  color_scheme = 'Hardcore',
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 11,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,

  window_background_opacity = 0.8,

  inactive_pane_hsb = {
    saturation = 0.4,
    brightness = 0.4
  },

  leader = {
    key = 'a',
    mods = 'CTRL',
    timeout_milliseconds = 1000
  },

  keys = {
    { key = '|', mods = 'LEADER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = 'LEADER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER',       action = act.ActivatePaneDirection 'Left', },
    { key = 'j', mods = 'LEADER',       action = act.ActivatePaneDirection 'Down', },
    { key = 'k', mods = 'LEADER',       action = act.ActivatePaneDirection 'Up', },
    { key = 'l', mods = 'LEADER',       action = act.ActivatePaneDirection 'Right', },
    { key = 'h', mods = 'LEADER|SHIFT', action = act({AdjustPaneSize ={'Left',5}}) },
    { key = 'j', mods = 'LEADER|SHIFT', action = act({AdjustPaneSize ={'Down',5}}) },
    { key = 'k', mods = 'LEADER|SHIFT', action = act({AdjustPaneSize ={'Up',5}}) },
    { key = 'l', mods = 'LEADER|SHIFT', action = act({AdjustPaneSize ={'Right',5}}) },
    {key = 'c', mods='CTRL|SHIFT', action = act({CopyTo = "Clipboard"})},
    {key = 'v', mods = 'CTRL|SHIFT', action = act ({PasteFrom = "Clipboard"})},

  },
}

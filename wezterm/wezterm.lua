local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)


return {
  default_prog = { '/bin/zsh', '-l' },
  window_decorations = 'RESIZE',

  -- color_scheme = 'tokyonight_storm',
  color_scheme = 'Hardcore',
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 14,
  -- line_height = 1.2
  --
  hide_tab_bar_if_only_one_tab = true,

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

  },
}

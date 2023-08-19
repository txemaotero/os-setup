local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Dracula'

config.default_prog = {
    '/usr/local/bin/fish',
}


config.colors = {
    cursor_bg = '#ad49e3',
    cursor_border = '#ad49e3',

    tab_bar = {
        active_tab = {
            bg_color = 'rgba(40, 28, 54, 100)',
            fg_color = '#c0c0c0',
        }
    }
}

config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.font = wezterm.font_with_fallback {
    'Liga Hack',
}
config.font_size = 14

config.window_decorations = 'RESIZE'

config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

local act = wezterm.action
config.keys = {
    {
        key = 'v',
        mods = 'LEADER',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 's',
        mods = 'LEADER',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'h',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = act.ActivateTabRelative(1),
    },
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = act.ActivateTabRelative(-1),
    },
}

return config

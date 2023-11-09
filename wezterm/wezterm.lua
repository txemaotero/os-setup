local wezterm = require 'wezterm'
local config = {}

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'Dracula'

config.default_prog = {
    '/usr/local/bin/fish',
}

config.animation_fps = 1
config.cursor_blink_rate = 0


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

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.font = wezterm.font_with_fallback {
    'Liga Hack',
    'Hack Nerd Font Mono',
    'Apple Symbols',
}
config.font_size = 14

config.window_decorations = 'RESIZE'

config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

local act = wezterm.action

local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows,
    -- the process can be queried to determine this path. Other operating systems
    -- (notably, FreeBSD and other unix systems) are not currently supported
    return pane:get_foreground_process_name():find('n?vim') ~= nil
    -- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
        -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

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
    -- {
    --     key = 'h',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection 'Left',
    -- },
    -- {
    --     key = 'l',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection 'Right',
    -- },
    -- {
    --     key = 'k',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection 'Up',
    -- },
    -- {
    --     key = 'j',
    --     mods = 'LEADER',
    --     action = act.ActivatePaneDirection 'Down',
    -- },
        { key = 'h', mods = 'LEADER', action = act.EmitEvent('ActivatePaneDirection-left') },
        { key = 'j', mods = 'LEADER', action = act.EmitEvent('ActivatePaneDirection-down') },
        { key = 'k', mods = 'LEADER', action = act.EmitEvent('ActivatePaneDirection-up') },
        { key = 'l', mods = 'LEADER', action = act.EmitEvent('ActivatePaneDirection-right') },
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

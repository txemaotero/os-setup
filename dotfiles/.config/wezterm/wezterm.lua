local wezterm = require 'wezterm'
local config = {}

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'Dracula'

config.animation_fps = 1
config.cursor_blink_rate = 0


config.colors = {
    cursor_bg = '#ad49e3',
    cursor_border = '#ad49e3',
}

config.enable_tab_bar = false

config.font = wezterm.font_with_fallback {
    'Hack Nerd Font Mono',
    'Symbols Nerd Font Mono',
}
config.font_size = 14

config.window_decorations = 'RESIZE'

config.default_prog = {"/usr/bin/tmux"}

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

config.keys = {
}


return config

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false

config.default_prog = { '/bin/zsh' }
config.window_background_opacity = 0.3

config.font_size = 16.0
config.dpi = 96

config.font = wezterm.font {
    --family = 'VCR OSD Mono',
    family = 'JetBrains Mono',
    harfbuzz_features = {
        'calt=1',
        'clig=1',
        'liga=1'
    }
}

config.window_close_confirmation = "NeverPrompt"

config.cursor_blink_rate = 0

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = false

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

-->   Dark mode   <--
-- config.color_scheme = 'Bamboo'
-- config.color_scheme = 'Blazer'
-- config.color_scheme = 'Brush Trees Dark (base16)'
-- config.color_scheme = 'Catppuccin Frappé'
-- config.color_scheme = 'Catppuccin Macchiato'
--config.color_scheme = 'Catppuccin Mocha'

-->   Light mode   <--
-- config.color_scheme = 'Catppuccin Latte'

config.colors = {
    -- The default text color
    foreground = '#e6d5c3',
    -- The default background color
    background = '#2a2422',

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = '#b35a42',
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = '#1a120b',
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = '#b35a42',

    -- the foreground color of selected text
    selection_fg = '#fff1e0',
    -- the background color of selected text
    selection_bg = '#613a2b',

    ansi = {       -- ANSI Colors in this order
        '#2a2422', -- Black
        '#c74f5a', -- Red
        '#8b6b55', -- Green
        '#e09e6b', -- Yellow
        '#a56545', -- Blue
        '#c96b4a', -- Magenta
        '#b5876e', -- Cyan
        '#e6cfba', -- White
    },
    brights = {
        '#4d3f3a',
        '#d66b5a',
        '#c69a7c',
        '#ffbc7c',
        '#d48c63',
        '#ff946b',
        '#e0bc9f',
        '#fff1e0',
    }
}

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = 'Right' } },
        mods = 'NONE',
        action = wezterm.action.PasteFrom 'Clipboard',
    },
}

return config

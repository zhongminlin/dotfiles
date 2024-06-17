return {
    {
        'echasnovski/mini.base16',
        version = false,
        config = function()
            require('mini.base16').setup({
                   palette = require('colors.' .. theme),
                   cterm = true,
               })
        end,
    },
    -- {
    --     'folke/tokyonight.nvim',
    --     opts = {
    --         style = 'night',
    --         transparent = true,
    --         styles = {
    --             sidebars = "transparent",
    --             floats = "transparent",
    --         },
    --     },
    -- },
}

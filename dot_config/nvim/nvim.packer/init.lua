fn = vim.fn
api = vim.api
cmd = vim.cmd
opt = vim.opt
g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

cmd [[ source $HOME/.cache/wal/colors-wal.vim ]]

_G.theme = "pywal"

require('options')
require('mappings')
require('colors')
require('plugins')

-- require('pywal').setup()
-- require('lualine').setup {
--   options = {
--     theme = 'base16',
--   },
-- }

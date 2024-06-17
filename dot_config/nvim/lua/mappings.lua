local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "hs", ":split<CR>", opts)
map("n", "vs", ":vs<CR>", opts)

-- yank, cut, and paste to system clipboard
map('v', '<leader>y', '"+y', opts) -- yank motion
map('n', '<leader>Y', '"+Y', opts) -- yank line
map('v', '<leader>d', '"+d', opts) -- delete/cut motion
map('n', '<leader>D', '"+D', opts) -- cut line
map('n', '<leader>p', '"+p', opts) -- paste after cursor
map('n', '<leader>P', '"+P', opts) -- paste before cursor
map('v', '<leader>p', '"0p', opts) -- paste to selection

-- Lazy
map('n', '<leader>l', ':Lazy<CR>', opts)

-- Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>", opts)
map("n", "<leader>h", ":split +terminal | startinsert<CR>", opts)

-- Buffer
map("n", "<A-n>", ":enew<CR>", opts)

-- nvim-tree
map('n', '<C-f>', ':NvimTreeFocus<CR>', opts)
map('n', '<C-g>', ':NvimTreeToggle<CR>', opts)

-- barbar.nvim
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

local function map(mode, keys, command)
  api.nvim_set_keymap(mode, keys, command, { noremap = true, silent = true })
end

-- Normal Map
map("n", "<A-.>", ":bnext<CR>")
map("n", "<A-,>", ":bprev<CR>")
map("n", "hs", ":split<CR>")
map("n", "vs", ":vs<CR>")

-- Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>")
map("n", "<leader>h", ":split +terminal | startinsert<CR>")

-- Save
-- map("i", "<C-S>", "<ESC>:w<CR><Insert>")
-- map("n", "<C-S>", ":w<CR>")

-- Buffer
map("n", "<A-c>", ":bd<CR>")
map("n", "<leader>s", ":w<CR>")
map("n", "<A-t>", ":enew<CR>")
map("n", "<ESC>", ":nohlsearch<CR>")

-- -- Minimal toggle
-- map("n", "<leader>m", ":lua Minimal()<CR>")
-- map("n", "<leader>n", ":set relativenumber!<CR>")

-- Telescope
map("n", "<leader><space>", ":Telescope<CR>")
map("n", "ff", ":Telescope find_files<CR>")

-- NvimTree
map("n", "<C-g>", ":NvimTreeToggle<CR>")
map("n", "<C-f>", ":NvimTreeFocus<CR>")

-- Comment
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- Insert Map
-- map("i", "<C-E>", "<End>")
-- map("i", "<C-A>", "<Home>")

-- Shift tab
--[[ map("i", "<S-TAB>", "<ESC><<<Ins>") ]]

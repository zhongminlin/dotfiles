set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" if doesn't work, use this:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin()

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status Bar
" Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Tokyo Night Color Scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Catpuccin Color Scheme
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' } " Nightfly Color Scheme
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'nvim-tree/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
" Plug 'glepnir/dashboard-nvim' " Dashboard
Plug 'deviantfero/wpgtk.vim' " Theme Generator
Plug 'mhinz/vim-startify' " Start screen
" Plug 'dylanaraps/wal.vim'

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Color themes

colorscheme wpgtkAlt " wpgtkAlt
" colorscheme tokyonight-night 
" colorscheme catppuccin catppuccin-latte catppuccin-frappe catppuccin-macchiato catppuccin-mocha 
" colorscheme nightfly

" let g:lightline = {'colorscheme': 'wal'}
" " let g:lightline = {'colorscheme': 'tokyonight'}
" " let g:lightline = { 'colorscheme': 'nightfly' }
" " let g:lightline = {'colorscheme': 'catppuccin'}
" let g:lightline.separator = { 'left': '', 'right': ''}
" let g:lightline.subseparator = { 'left': '', 'right': ''}


let g:airline_theme='wpgtk_alternate' " wpgtk, wpgtk_alternate
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" startify
let g:startify_custom_header = 
		  \ startify#pad( [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\] )

let g:startify_custom_footer =
          \ startify#pad( ["Don't be sorry, be better"] )

" navigating through buffers/tabs
nnoremap <silent>    <A-,> <Cmd>bprevious<CR>
nnoremap <silent>    <A-.> <Cmd>bnext<CR>
nnoremap <silent>    <A-c> <Cmd>bdelete<CR>

" barbar keymapping for tabs

" " Move to previous/next
" nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" " Re-order to previous/next
" nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
" nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" " Goto buffer in position...
" nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
" nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
" nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
" nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
" nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
" nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
" nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
" nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
" nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
" nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" " Pin/unpin buffer
" nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" " Close buffer
" nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

" " Wipeout buffer
" "                          :BufferWipeout
" " Close commands
" "                          :BufferCloseAllButCurrent
" "                          :BufferCloseAllButVisible
" "                          :BufferCloseAllButPinned
" "                          :BufferCloseAllButCurrentOrPinned
" "                          :BufferCloseBuffersLeft
" "                          :BufferCloseBuffersRight

" " Magic buffer-picking mode
" nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" " Sort automatically by...
" nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" " Other:
" " :BarbarEnable - enables barbar (enabled by default)
" " :BarbarDisable - very bad command, should never be used

""""""""""""""""""""""""""""""""""
"   Usability
""""""""""""""""""""""""""""""""""


" syntax highlighting
syntax on
" number of spaces in tab
set smarttab
set tabstop=4
set softtabstop=4
" use spaces instead of tabs
set expandtab
" enable autoindents
set smartindent
" number of spaces used for autoindents
set shiftwidth=4
" Line number settings
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
    autocmd BufEnter,FocusLost,InsertEnter      * set norelativenumber
augroup end
" colums used for the line number
set numberwidth=4
"higlight the matched text pattern when searching
set incsearch
set nohlsearch
" open splits intuitively
set splitbelow
set splitright
" navigate buffers without losing unsaved work
set hidden
" start scrolling when 8 lines from top or bottom
set scrolloff=8
" Save undo history
set undofile
" Enable mouse support
"set mouse=a
" case insensitive search unless capital letters are used
set ignorecase
set smartcase
"Make comments italic
highlight comment cterm=italic gui=italic



""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""


" Copy From Keyboard
vnoremap <leader>y "+y
" Paste From Keyboard
vnoremap <leader>p "+p
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" enter and exit zen mode
inoremap <c-a> <Esc>:ZenMode<cr>
nnoremap <c-a> <Esc>:ZenMode<cr>

" --------- key binds for auto completion ----------
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


""""""""""""""""""""""""""""""""""
"   Plugins
""""""""""""""""""""""""""""""""""


call plug#begin('~/.config.nvim/plugged')
    Plug 'ayu-theme/ayu-vim' " colorscheme
    Plug 'bling/vim-airline' " bottom status bar
    Plug 'Yggdroot/indentLine' " line indentation visualization
    Plug 'scrooloose/nerdtree' " side directory viewer
    Plug 'vimwiki/vimwiki' " vimwiki
    Plug 'folke/zen-mode.nvim' " zen mode
    Plug 'https://github.com/jiangmiao/auto-pairs.git' " auto pairs
    Plug 'SirVer/ultisnips' " vim snippets engine
    Plug 'honza/vim-snippets' " vim snippets
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'arjunmahishi/run-code.nvim' " run code snippets in vim
    Plug 'https://github.com/prettier/vim-prettier.git' " make code prettier
    Plug 'neovim/nvim-lspconfig' " native language server
    Plug 'nvim-telescope/telescope.nvim' " file search inside nvim
    Plug 'nvim-lua/plenary.nvim' " dependency for telescope
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' } " additional plugin for telescope recommended by telescope doc
    Plug 'kyazdani42/nvim-web-devicons' " icons for files
call plug#end()


" requesting plugin configs through namespace
lua require('mrjengo')

" vimwiki syntax : vimwiki ; markdown ; 
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


""""""""""""""""""""""""""""""""""
"  Interface 
""""""""""""""""""""""""""""""""""


" colorscheme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" --------- bling/vim-airline settings -------------
" always show statusbar
set laststatus=2
" show paste if in paste mode
let g:airline_detect_paste=1
" use powerline font extras (arrows)
let g:airline_powerline_fonts=1
" show airline for tabs
let g:airline#extension#tabline#enabled=1

" --------- indentLine settings -------------------
let g:indentLine_showFirstLevelIndent=1
let g:indentLine_setColors=0



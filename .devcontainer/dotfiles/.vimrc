" =====================================================
" .vimrc - Gruvbox (Official Colors, Suckless Style)
" Extracted from ellisonleao/gruvbox.nvim
" Zero dependencies - all colors embedded
" =====================================================

" =====================================================
" Basic Settings
" =====================================================
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set incsearch
set hlsearch
set mouse=a
set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set termguicolors
set background=dark
syntax enable
filetype plugin indent on

" =====================================================
" Gruvbox Official Color Palette (Complete)
" Source: ellisonleao/gruvbox.nvim
" =====================================================

" Dark backgrounds
let s:dark0_hard    = '#1d2021'
let s:dark0         = '#282828'
let s:dark0_soft    = '#32302f'
let s:dark1         = '#3c3836'
let s:dark2         = '#504945'
let s:dark3         = '#665c54'
let s:dark4         = '#7c6f64'

" Light foregrounds
let s:light0_hard   = '#f9f5d7'
let s:light0        = '#fbf1c7'
let s:light0_soft   = '#f2e5bc'
let s:light1        = '#ebdbb2'
let s:light2        = '#d5c4a1'
let s:light3        = '#bdae93'
let s:light4        = '#a89984'

" Bright colors
let s:bright_red    = '#fb4934'
let s:bright_green  = '#b8bb26'
let s:bright_yellow = '#fabd2f'
let s:bright_blue   = '#83a598'
let s:bright_purple = '#d3869b'
let s:bright_aqua   = '#8ec07c'
let s:bright_orange = '#fe8019'

" Neutral colors
let s:neutral_red    = '#cc241d'
let s:neutral_green  = '#98971a'
let s:neutral_yellow = '#d79921'
let s:neutral_blue   = '#458588'
let s:neutral_purple = '#b16286'
let s:neutral_aqua   = '#689d6a'
let s:neutral_orange = '#d65d0e'

" Faded colors
let s:faded_red     = '#9d0006'
let s:faded_green   = '#79740e'
let s:faded_yellow  = '#b57614'
let s:faded_blue    = '#076678'
let s:faded_purple  = '#8f3f71'
let s:faded_aqua    = '#427b58'
let s:faded_orange  = '#af3a03'

" Gray
let s:gray          = '#928374'

" Active color scheme (hard contrast, dark mode)
let s:bg0 = s:dark0_hard
let s:bg1 = s:dark1
let s:bg2 = s:dark2
let s:bg3 = s:dark3
let s:bg4 = s:dark4
let s:fg0 = s:light0
let s:fg1 = s:light1
let s:fg2 = s:light2
let s:fg3 = s:light3
let s:fg4 = s:light4
let s:red = s:bright_red
let s:green = s:bright_green
let s:yellow = s:bright_yellow
let s:blue = s:bright_blue
let s:purple = s:bright_purple
let s:aqua = s:bright_aqua
let s:orange = s:bright_orange

" =====================================================
" Clear Existing Highlights
" =====================================================
highlight clear
if exists("syntax_on")
  syntax reset
endif

" =====================================================
" Terminal Colors (Official Gruvbox)
" =====================================================
let g:terminal_ansi_colors = [
  \ s:bg0,
  \ s:neutral_red,
  \ s:neutral_green,
  \ s:neutral_yellow,
  \ s:neutral_blue,
  \ s:neutral_purple,
  \ s:neutral_aqua,
  \ s:fg4,
  \ s:gray,
  \ s:red,
  \ s:green,
  \ s:yellow,
  \ s:blue,
  \ s:purple,
  \ s:aqua,
  \ s:fg1
\ ]

" =====================================================
" Highlight Groups (Official Gruvbox)
" =====================================================

" Editor UI
execute 'highlight Normal guifg=' . s:fg1 . ' guibg=' . s:bg0
execute 'highlight NormalFloat guifg=' . s:fg1 . ' guibg=' . s:bg1
execute 'highlight CursorLine guibg=' . s:bg1
execute 'highlight CursorColumn guibg=' . s:bg1
execute 'highlight ColorColumn guibg=' . s:bg1
execute 'highlight LineNr guifg=' . s:bg4 . ' guibg=' . s:bg0
execute 'highlight CursorLineNr guifg=' . s:yellow . ' guibg=' . s:bg1 . ' gui=bold'
execute 'highlight SignColumn guibg=' . s:bg1
execute 'highlight VertSplit guifg=' . s:bg3 . ' guibg=' . s:bg0

" Cursor and selection
execute 'highlight Cursor gui=reverse'
execute 'highlight Visual guibg=' . s:bg3
execute 'highlight VisualNOS guibg=' . s:bg3

" Search
execute 'highlight Search guifg=' . s:yellow . ' guibg=' . s:bg0 . ' gui=reverse'
execute 'highlight IncSearch guifg=' . s:orange . ' guibg=' . s:bg0 . ' gui=reverse'

" Status line
execute 'highlight StatusLine guifg=' . s:fg1 . ' guibg=' . s:bg2
execute 'highlight StatusLineNC guifg=' . s:fg4 . ' guibg=' . s:bg1

" Tabs
execute 'highlight TabLine guifg=' . s:bg4 . ' guibg=' . s:bg1
execute 'highlight TabLineFill guifg=' . s:bg4 . ' guibg=' . s:bg1
execute 'highlight TabLineSel guifg=' . s:green . ' guibg=' . s:bg1

" Popup menu
execute 'highlight Pmenu guifg=' . s:fg1 . ' guibg=' . s:bg2
execute 'highlight PmenuSel guifg=' . s:bg2 . ' guibg=' . s:blue . ' gui=bold'
execute 'highlight PmenuSbar guibg=' . s:bg2
execute 'highlight PmenuThumb guibg=' . s:bg4

" Messages
execute 'highlight ErrorMsg guifg=' . s:bg0 . ' guibg=' . s:red . ' gui=bold'
execute 'highlight WarningMsg guifg=' . s:red . ' gui=bold'
execute 'highlight MoreMsg guifg=' . s:yellow . ' gui=bold'
execute 'highlight Question guifg=' . s:orange . ' gui=bold'
execute 'highlight ModeMsg guifg=' . s:yellow . ' gui=bold'

" Folding
execute 'highlight Folded guifg=' . s:gray . ' guibg=' . s:bg1 . ' gui=italic'
execute 'highlight FoldColumn guifg=' . s:gray . ' guibg=' . s:bg1

" Matching
execute 'highlight MatchParen guibg=' . s:bg3 . ' gui=bold'

" Special
execute 'highlight NonText guifg=' . s:bg2
execute 'highlight SpecialKey guifg=' . s:fg4
execute 'highlight Conceal guifg=' . s:blue
execute 'highlight Whitespace guifg=' . s:bg2

" Syntax highlighting
execute 'highlight Comment guifg=' . s:gray . ' gui=italic'
execute 'highlight Constant guifg=' . s:purple
execute 'highlight String guifg=' . s:green
execute 'highlight Character guifg=' . s:purple
execute 'highlight Number guifg=' . s:purple
execute 'highlight Boolean guifg=' . s:purple
execute 'highlight Float guifg=' . s:purple

execute 'highlight Identifier guifg=' . s:blue
execute 'highlight Function guifg=' . s:aqua . ' gui=bold'

execute 'highlight Statement guifg=' . s:red . ' gui=bold'
execute 'highlight Conditional guifg=' . s:red . ' gui=bold'
execute 'highlight Repeat guifg=' . s:red . ' gui=bold'
execute 'highlight Label guifg=' . s:red . ' gui=bold'
execute 'highlight Operator guifg=' . s:orange
execute 'highlight Keyword guifg=' . s:red . ' gui=bold'
execute 'highlight Exception guifg=' . s:red . ' gui=bold'

execute 'highlight PreProc guifg=' . s:aqua
execute 'highlight Include guifg=' . s:aqua
execute 'highlight Define guifg=' . s:aqua
execute 'highlight Macro guifg=' . s:aqua
execute 'highlight PreCondit guifg=' . s:aqua

execute 'highlight Type guifg=' . s:yellow . ' gui=bold'
execute 'highlight StorageClass guifg=' . s:orange . ' gui=bold'
execute 'highlight Structure guifg=' . s:aqua . ' gui=bold'
execute 'highlight Typedef guifg=' . s:yellow . ' gui=bold'

execute 'highlight Special guifg=' . s:orange
execute 'highlight SpecialChar guifg=' . s:red
execute 'highlight Tag guifg=' . s:aqua . ' gui=bold'
execute 'highlight Delimiter guifg=' . s:orange
execute 'highlight SpecialComment guifg=' . s:gray . ' gui=bold,italic'
execute 'highlight Debug guifg=' . s:red

execute 'highlight Underlined guifg=' . s:blue . ' gui=underline'
execute 'highlight Error guifg=' . s:red . ' guibg=' . s:bg0 . ' gui=bold'
execute 'highlight Todo guifg=' . s:bg0 . ' guibg=' . s:yellow . ' gui=bold'

" Diff
execute 'highlight DiffAdd guifg=' . s:green . ' guibg=' . s:bg0
execute 'highlight DiffChange guifg=' . s:aqua . ' guibg=' . s:bg0
execute 'highlight DiffDelete guifg=' . s:red . ' guibg=' . s:bg0
execute 'highlight DiffText guifg=' . s:yellow . ' guibg=' . s:bg0

" Spelling
execute 'highlight SpellBad gui=undercurl guisp=' . s:red
execute 'highlight SpellCap gui=undercurl guisp=' . s:blue
execute 'highlight SpellLocal gui=undercurl guisp=' . s:aqua
execute 'highlight SpellRare gui=undercurl guisp=' . s:purple

" Git
execute 'highlight gitcommitOverflow guifg=' . s:red
execute 'highlight gitcommitSummary guifg=' . s:green
execute 'highlight gitcommitComment guifg=' . s:gray . ' gui=italic'
execute 'highlight gitcommitUntracked guifg=' . s:gray . ' gui=italic'
execute 'highlight gitcommitDiscarded guifg=' . s:gray . ' gui=italic'
execute 'highlight gitcommitSelected guifg=' . s:gray . ' gui=italic'
execute 'highlight gitcommitBranch guifg=' . s:orange . ' gui=bold'
execute 'highlight gitcommitSelectedFile guifg=' . s:green . ' gui=bold'
execute 'highlight gitcommitDiscardedFile guifg=' . s:red . ' gui=bold'
execute 'highlight gitcommitUnmergedFile guifg=' . s:red . ' gui=bold'

" =====================================================
" Key Mappings
" =====================================================
let mapleader = " "

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :wq<CR>
nnoremap <leader>q :q<CR>

" Buffers
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>d :bdelete<CR>

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" =====================================================
" Auto Commands
" =====================================================
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

autocmd BufWritePre * :%s/\s\+$//e


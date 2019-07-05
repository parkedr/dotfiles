
" Set up Vundle to manage plugins
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" custom plugins here
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/calendar-vim'
Plugin 'Rigellute/shades-of-purple.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set hlsearch
set termguicolors
syntax enable
colorscheme shades_of_purple

" I was having lag going from insert to normal mode (hitting ESC)
" Setting the timeoutlen seems to have helped
set timeoutlen=1000 ttimeoutlen=10

" get backspace working as expected
set backspace=indent,eol,start

" show line numbers
set nu

" tab settings 
set ts=4 sts=4 sw=4 noexpandtab

" Change the characters that show up when you use the :list command.
set listchars=tab:▸\ ,eol:¬

" nmap <Leader>sl :set list!<CR>

" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " insert mode
    let &t_SR = "\<Esc>]50;CursorShape=2\x7" " replace mode
	let &t_EI = "\<Esc>]50;CursorShape=0\x7" " else mode
else
	" this should be good for VTE terminals (gnome-terminal,
	" xterm,st,urxvt,etc)
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
endif

" vim wiki settings
:map <Leader>tt <Plug>VimwikiToggleListItem

" Set word  wrap in .wiki files
" you can then use the command 'gq' to wrap the lines
au BufRead, BufNewFile *.wikie setlocal textwidth=80

" vim motion plugin settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


set guifont=Hack-Regular:h11

" vim airline theme
let g:airline_powerline_font = 1
" let g:airline_theme='base16_atelierdune'
let g:shades_of_purple_airline = 1
let g:airline_theme='shades_of_purple'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''


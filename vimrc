"==========================================
" MY VIMRC
"==========================================

"------------------------------
" § SET's
"------------------------------

set nocompatible   " Disable vi-compatibility
"set t_Co=256
syntax enable
set noswapfile
set background=dark
set lazyredraw
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=20
set laststatus=2
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set relativenumber
set number                      " always show line numbers
set incsearch
set hlsearch
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set ttimeout
set ttimeoutlen=0
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set eol
set clipboard=unnamed
set fillchars+=vert:│ " split windows should have this chars displayed as dividers
set showcmd "Show (partial) command in the status line
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set re=1
filetype on

"------------------------------
" COLORSCHEME & ADJUSTMENTS
"------------------------------

colorscheme neodark
set background=dark

hi LineNr       guibg=00 guifg=#928374
hi VertSplit    guibg=236 guifg=#505050
hi Search guibg=#282828 guifg=#d3869b gui=underline
hi IncSearch guibg=#282828 guifg=#d3869b gui=underline
hi CursorLineNr guibg=00 guifg=05
hi SignColumn guibg=00
" GIT GUTTER
highlight GitGutterAdd guibg=00 guifg=green
highlight GitGutterChange guibg=00 guifg=yellow
highlight GitGutterDelete guibg=00 guifg=red
highlight GitGutterChangeDelete guibg=00 guifg=yellow


"------------------------------
" MAPPINGS
"------------------------------

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>
nmap ,nt :NERDTree<cr>
nmap <leader>f :NERDTreeFind<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal mode
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
"nmap <C-c> :vertical resize -5<cr>

nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>


" Create split below
nmap :sp :rightbelow sp<cr>

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" Disable arrow keys
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

"map space to :
nmap <space> :
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" Mappings for custom functions
nmap ,ep :call PodsGoTo()<cr>
nmap ,etm :call EmberTestModule('s')<cr>
nmap ,etf :call EmberRunNearest()<cr>
nmap ,et :call EmberTestGlobal()<cr>
nmap ,rtc :call RunCurrentRspecVimux()<cr>
nmap ,rt :call RunAllRspecVimux()<cr>

" quick semicolon insertion at the end of line
nmap <leader>; A;<esc>

" Copy current file path
nmap :cr :let @+ = expand("%")<cr>

"Powerline (Fancy thingy at bottom stuff)
"let g:Powerline_symbols = 'fancy'
"set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set fillchars+=stl:\ ,stlnc:\





"------------------------------
" § AUTOCMD
"------------------------------

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Auto-remove trailing spaces
"autocmd BufWritePre *.php :%s/\s\+$//e
au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.exs set filetype=elixir
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.jsx set filetype=javascript.jsx

autocmd! BufWritePost * Neomake

autocmd VimResized * :wincmd =






"------------------------------
" § CUSTOM FUNCTIONS
"------------------------------

function! RunCurrentRspecVimux()
  let currentFile = expand("%")
  execute ':call VimuxRunCommand("rspec '. currentFile . '")'
endfunction

function! RunAllRspecVimux()
  execute ':call VimuxRunCommand("rspec")'
endfunction



"------------------------------
" § PLUGIN CONFIGURATION
"------------------------------
let g:rust_recommended_style = 1

let ruby_no_expensive=1

let g:UltiSnipsJumpForwardTrigger="<tab>"

"
" NERDTree
"
let NERDTreeShowHidden=1

"
" CtrlP
"
let g:ctrlp_max_files=0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|libraries|svn|tmp|bower_components|node_modules|vendor)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/application/libraries/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/dist/**

"
" EasyMotion
"
let g:EasyMotion_leader_key = '<Leader>'

"
" Airline
"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'REPLACE',
      \ 'v' : 'VISUAL',
      \ 'V' : 'V-LINE',
      \ 'c' : 'CMD   ',
      \ '': 'V-BLCK',
      \ }

"
" Numbertoggle
"

let g:NumberToggleTrigger="<C-l>"

"
" MarkdownPreview
"

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

"
" NeoMake
"

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

"
" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_quiet_messages = { "level": [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let b:syntastic_javascript_eslint_exec = '/node-modules/.bin/eslint'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']



"------------------------------
" § PATHOGEN
"------------------------------
"execute pathogen#infect()

"------------------------------
" § VUNDLE
"------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"
" LOOK & FEEL
"
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

"
" PRODUCTIVITY
"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benekastah/neomake'
"Plugin 'vim-syntastic/syntastic'
Plugin 'duggiefresh/vim-easydir'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vitalk/vim-simple-todo'
Plugin 'tpope/vim-endwise'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'benmills/vimux'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jbandura/ember-pack.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-rails'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'Yggdroot/indentLine'
Plugin 'iamcco/markdown-preview.vim'

"
" SYNTAX
"
"
Plugin 'rust-lang/rust.vim'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'sheerun/vim-polyglot'
Plugin 'godlygeek/tabular'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/AfterColors.vim'


call vundle#end()            " required
filetype plugin indent on    " required





augroup vimrc
    autocmd!
augroup END

call plug#begin()

"vim-go plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/neocomplete.vim' "Using what David Wu uses instead (see above)
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim'
Plug 'vim-syntastic/syntastic'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-pseudocl'
call plug#end()


" Inject bundles
"execute pathogen#infect()

" Disable vi-compatibility
set nocompatible

" Set augroup
augroup auglobal
  autocmd!
augroup END

" Turn on automatic indentation
filetype plugin indent on

" Enable syntax
syntax enable

"===============================================================================
" General Settings
"===============================================================================

" Set default shell
set shell=/bin/sh

" Disable splash screen
set shortmess+=I

" Theme
" colorscheme Tomorrow-Night
" colorscheme base16-tomorrow-night
"  colorscheme base16-monokai
"   colorscheme monokai
" colorscheme PaperColor
  colorscheme Ironman
" colorscheme base16-summerfruit-dark

" Turn on line number
set number

" Always splits to the right and below
set splitbelow
set splitright

" Turn off sound
set vb
set t_vb=

" Explicitly set encoding to utf-8
set encoding=utf-8

" Show current mode
set showmode

" Lower the delay of escaping out of other modes
set timeout timeoutlen=200 ttimeoutlen=1

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Highlight current line cursor is on
"set cursorline

" Show the current command being inputted
set showcmd

" Sets how many lines of history vim has to remember
set history=10000

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall
set autowrite

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent   	        " fold by indent level
set nofoldenable        	        " dont fold by default

" Set level of folding
set foldlevel=1        	          " start folding for level

" Allow changing buffer without saving it first
set hidden

" Set backspace config
set backspace=eol,start,indent

" Move vertically by visual line (for when lines wrap)
nnoremap j gj
nnoremap k gk

" Supress warnings that appear from old vim version
let g:go_version_warning = 0

" Case insensitive search
set ignorecase
set smartcase

" Incremental search
set incsearch

" Highlight search
set hlsearch

" Make regex a little easier to type
set magic

" Set grep to use The Silver Searcher
set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ tmp\ --ignore\ log

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Tab settings
set tabstop=8                     " width of tab (measured in spaces max width of tab character)
set shiftwidth=4                  " shifting >>, <<, == (Size of an indent)
set softtabstop=0                 " tab key <TAB>, <BS>   (Non zero value has tab key in insert mode insert combination of space and tabs)
set expandtab	                    " always use softtabstop for <TAB>

" Show tabs
set list
set listchars=tab:>-

" Text display settings
set autoindent
"set linebreak
set textwidth=0
set wrap

" Auto complete setting
set completeopt=longest,menuone

" Wild menu settings
set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

"===============================================================================
" Leader Key Mappings
"===============================================================================

" Map leader to space
let mapleader = " "
let g:mapleader = " "
let maplocalleader = " "
let g:maplocalleader = " "

" <Leader>tb: Toggle tagbar
nnoremap <Leader>tb :TagbarToggle<cr>

" <Leader>nt: Toggle NERDTree
nnoremap <Leader>nt :NERDTreeToggle<cr>

" <Leader>gs: Open Fugitive git status
nnoremap <Leader>gs :Gstatus<cr>

" <Leader>ga: Open Fugitive git add
nnoremap <Leader>ga :Gwrite<cr>

" <Leader>gc: Open Fugitive git commit
nnoremap <Leader>gc :Gcommit<cr>

" <Leader>gp: Open Fugitive git push
nnoremap <Leader>gp :Git push<cr>

" <Leader>gb: Open Fugitive git blame
nnoremap <Leader>gb :Gblame<cr>

" <Leader>gd: Open Fugitive git diff
nnoremap <Leader>gd :Gdiff<cr>

" <Leader>r: Find and Replace
nmap <Leader>r <Plug>(FNR%)
xmap <Leader>r <Plug>(FNR)

" <Leader>ct: Open CtrlP Ctags
nnoremap <leader>ct :CtrlPTag<cr>

" <Leader>so: Open Session
nnoremap <Leader>so :OpenSession

" <Leader>sc: Close Session
nnoremap <Leader>sc :CloseSession

" <Leader>ss: Save Session
nnoremap <Leader>ss :SaveSession

" <Leader>sd: Delete Session
nnoremap <Leader>sd :DeleteSession

" <Leader>yr: Open Yankring
nnoremap <Leader>yr :YRShow<cr>

" <Leader>ut: Toggle Gundo
nnoremap <Leader>ut :GundoToggle<cr>

" <Leader>ct: Index Ctags
nnoremap <Leader>ct :!ctags -R .<CR>

" <Leader>y: Copy to system clipboard
map <leader>y "*y

" <Leader>/: Clear highlighted searches
nnoremap <Leader>/ :nohlsearch<CR>

" <Leader>n: Rename current file
map <leader>n :call RenameFile()<cr>

" <Leader>bs: Open BufExplorer horizontal split

" <Leader>bv: Open BufExplorer vertical split

"===============================================================================
" Non-leader Key Mappings
"===============================================================================

" <C-p>: Opens CtrlP
nnoremap <C-p> :CtrlP<cr>

" <C-t>: Tabularize
nnoremap <C-t> :Tabularize
vmap <C-t> :Tabularize

" <C-c>: <ESC>
inoremap <C-c> <esc>

" Tab completion
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" bind K to grep word under cursor
nnoremap K :grep! "<C-R><C-W>"<CR>:cw<CR>
nnoremap KK :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Mapping for easy align
 xmap ga <Plug>(EasyAlign)
 nmap ga <Plug>(EasyAlign)


" gc: Comment toggle

"===============================================================================
" Functions
"===============================================================================

"function! InsertTabWrapper()
"  let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return \<tab> Need to add double quotes
"    else
"        return \<c-p>  NEED to add double quotes
"    endif
"endfunction

" From Gary B.
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

"===============================================================================
" Autocommands
"===============================================================================

augroup auglobal
  " Wrap lines in QuickFix buffer so that characters will not get lost
  autocmd bufenter * if &buftype == 'quickfix' | setlocal wrap | endif
  autocmd BufWinEnter * if &buftype == 'quickfix' | setlocal wrap | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Automatically open quickfix window after grepping
  autocmd QuickFixCmdPost *grep* cwindow

  " Close vim if the only window open is NERDTree
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  "Enable spell checking for everything
  "set spell

  " Use tabs for Jenkinsfiles
  "autocmd BufRead, BufNewFile Jenksinfile* set autoindent noexpandtab tabstop=4 shiftwidth=4

  " Initialize Airline sections
  autocmd VimEnter * call AirlineInit()
augroup END

"===============================================================================
" Plugin Settings
"===============================================================================

" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g "" -p ~/'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_use_caching = 0

" Session
let g:session_directory = '~/.vim/session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1

" Rails
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%%*

let g:syntastic_check_on_open=1
let g:syntastic_alway_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checker = ['pylint']

" YankRing
let g:yankring_replace_n_pkey = ''

" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
hi link EasyMotionShade  Comment

" Tmuxline
let g:tmuxline_preset = {
  \'a'       : '#S',
  \'win'     : '#I #W',
  \'cwin'    : '#I #W',
  \'y'       : ['%R', '%a', '%Y'],
  \'z'       : '#H'
  \ }

"vim-go
" add imports when go formatting
let g:go_fmt_command = "goimports"
" Match the linters in dtr
let g:go_fmt_command = "gofmt"
let g:go_fmt_options = "-s -w"

" debugging temporarily
"let g:go_debug = ['shell-commands']

" Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

function! StripTrailingWhitespace()
let l:_s=@/
let l:l = line('.')
let l:c = line('.')
%s/\s\+$//e
let @/=l:_s
call cursor(l:l, l:c)
endfunction
" Deletes trailing whitespace
" nnoremap <Leader>sw :call StripTrailingWhitespace()<CR>
autocmd vimrc FileType c,cpp,java,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql,groovy,sh autocmd BufWritePre <buffer> :call StripTrailingWhitespace()

function! AirlineInit()
  let g:airline_section_b = airline#section#create_left(['%t'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_x = airline#section#create_right([''])
  let g:airline_section_y = airline#section#create_right(['%c'])
  let g:airline_section_z = airline#section#create_right(['branch'])
endfunction

let g:airline_theme_patch_func = 'AirLineTheme'
function! AirLineTheme(palette)
  if g:airline_theme == 'Tomorrow-Night'

    let green = ['', '', 255, 64, '']
    let magenta = ['', '', 255, 125, '']
    let orange = ['', '', 255, 166, '']

    let modes = {
      \ 'insert': green,
      \ 'replace': magenta,
      \ 'visual': orange
      \}

    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]
    endfor
  endif
endfunction

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V-L',
  \ '' : 'V-B',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Highlight problematic whitespace

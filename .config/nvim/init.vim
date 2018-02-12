scriptencoding utf-8


set encoding=utf-8

colorscheme sweylaPy

syntax on
filetype indent on
set hidden
set noshowmode
set expandtab
set belloff=all
set noea
set ff=unix

autocmd Filetype qf setlocal colorcolumn=0

set backspace=indent,eol,start
set novb
set guifont=Ubuntu\ Mono\ 13
set wrap linebreak
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set number
set mouse=a
set confirm
set wildmenu
set wildmode=longest:list,full
set ruler
set showmatch
set showcmd
set smartcase
set undolevels=1000
set list
set autowrite
set showbreak=\ \ 
set lcs=tab:\|\ ,nbsp:~,extends:>,precedes:<
set timeoutlen=500
set splitbelow
set splitright
set errorformat=%f:%l:\ %m
set shortmess+=ca
set fillchars+=vert:│
set cursorline

" Neovim options
set icm=nosplit

"################
" BINDINGS
"################

let mapleader = " "
let tm=200
    
" clear highlights
nnoremap <C-u> :noh<CR>

" e from system clipboard easy. First change the killring to ctrlp
" Copy/Past
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>y "+y
noremap <leader>Y "+Y

" remap ; to : because fuck shift
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Remap home/pagedown.
noremap H g<HOME>
noremap L g<END>
noremap J 10gj
noremap K 10gk
inoremap <HOME> <C-o>g<HOME>
inoremap <END> <C-o>g<END>

"Arrow keys navigate wrapped lines
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

"nvim term bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"Split abbreviations
cabbrev o only
cabbrev vres vertical<space>resize

"Split resize
noremap <silent> <M-Left>  :vertical<space>resize<space>-5<cr>
noremap <silent> <M-Right> :vertical<space>resize<space>+5<cr>
noremap <silent> <M-Up>    :res<space>+5<cr>
noremap <silent> <M-Down>  :res<space>-5<cr>

inoremap <silent> <M-Left>  <esc>:vertical<space>resize<space>-5<cr>a
inoremap <silent> <M-Right> <esc>:vertical<space>resize<space>+5<cr>a
inoremap <silent> <M-Up>    <esc>:res<space>+5<cr>a
inoremap <silent> <M-Down>  <esc>:res<space>-5<cr>a

tnoremap <silent> <M-Left>  <C-\><C-n>:vertical<space>resize<space>-5<cr>a
tnoremap <silent> <M-Right> <C-\><C-n>:vertical<space>resize<space>+5<cr>a
tnoremap <silent> <M-Up>    <C-\><C-n>:res<space>+5<cr>a
tnoremap <silent> <M-Down>  <C-\><C-n>:res<space>-5<cr>a

nnoremap <F9> :vertical resize 88<cr>
nnoremap <F10> :vertical resize 120<cr>
nnoremap <F12> <C-w>=

" Split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Redo last macro
nnoremap \ @@

" Numerical increments/decrements
autocmd VimEnter * nnoremap + <C-a>
autocmd VimEnter * nnoremap _ <C-x>

" Insert enter from normal nmode
nnoremap <expr> <Enter> &ma?"i\<cr>\<esc>`^":"\<cr>"

" Insert enter and adjust text to match the original cursor column
nnoremap <silent> g<Enter> :<C-U> 
  \let currentColumn=col(".")<CR>
  \i<cr><esc>`^
  \:exec 'norm '.(g:currentColumn-col(".")).'i '<CR>l

" Insert newline and add spaces to match the original cursor columns
nnoremap <silent> go :<C-U> 
  \let currentColumn=col(".")<CR>
  \o<esc>`^
  \:exec 'norm '.(g:currentColumn-col(".")).'i '<CR>a

" Search visual selection
vnoremap <silent> * :<C-U> 
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Only highlight, no search (does not affect jump and search history"
nnoremap <silent> <Leader>8 :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
vnoremap <silent> <Leader>8 :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:let @/=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>:set hls<CR>

" relative line toggle
function! g:ToggleNuMode()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

command! RelToggle call g:ToggleNuMode()
noremap <F6> :RelToggle<cr>

" Location list/quickfix bindings. Can only have loclist or quickfix open at a
" time, never both. Broken when switching windows and attempting to open a
" new loclist there
" The bindings switch depending wether the loclist or the quickfix was last
" opened
let g:loclist_is_open = 0
let g:quickfix_is_open = 0

function! LocListToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
    elseif g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        let g:loclist_return_to_window = winnr()
        lopen 8
        execute g:loclist_return_to_window . "wincmd w"
        let g:loclist_is_open = 1

        nnoremap <silent> <leader><Space> :ll<cr>
        nnoremap <silent> <leader>n :lnext<cr>
        nnoremap <silent> <leader>N :lprev<cr>
    endif
endfunction

function! QuickfixToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
    elseif g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        let g:quickfix_return_to_window = winnr()
        botright copen 7
        " Global bottom window for quickfix
        execute g:quickfix_return_to_window . "wincmd w"
        let g:quickfix_is_open = 1

        nnoremap <silent> <leader><Space> :cc<cr>
        nnoremap <silent> <leader>n :cnext<cr>
        nnoremap <silent> <leader>N :cprev<cr>
    endif
endfunction

nnoremap <silent> <leader>a :call LocListToggle()<cr>
nnoremap <silent> <leader>A :call QuickfixToggle()<cr>

" Default to loclist bindings
nnoremap <silent> <leader><Space> :ll<cr>
nnoremap <silent> <leader>n :lnext<cr>
nnoremap <silent> <leader>N :lprev<cr>


"################
" PLUGINS
"################

set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " let Vundle manage Vundle, required
Plugin 'Yggdroot/indentLine'
Plugin 'luochen1990/rainbow'
Plugin 'Konfekt/FastFold'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'majutsushi/tagbar'

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

"Plugin 'zchee/deoplete-jedi'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-completion-manager'

Plugin 'kassio/neoterm'
Plugin 'neomake/neomake'
Plugin 'sbdchd/neoformat'

Plugin 'vim-scripts/vim-indent-object'
Plugin 'lervag/vimtex'

Plugin 'djoshea/vim-autoread'

Plugin 'mhinz/vim-signify'
Plugin 'juneedahamed/vc.vim'

call vundle#end()

" -------------------
" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_left = 1
nnoremap <silent> <F5> :TagbarToggle<CR>

" -------------------
" Airline theme
let g:airline_theme='jellybeans'
let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['tagbar']
let g:airline#extensions#default#layout = [
      \ [ 'a', 'c' ],
      \ [ 'x', 'z'],
      \ ]
let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 80,
      \ 'z': 45,
      \ }


let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

function! AirlineInit()
	let g:airline_section_x = airline#section#create_right(['tagbar'])
	let g:airline_section_z = "%l/%L:%v"
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" -------------------
" indentLine
let g:indentLine_faster = 1

" -------------------
" NerdTree setup
noremap <F8> :NERDTreeToggle<CR>
noremap <F7> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeMapJumpLastChild=''
let NERDTreeMapJumpFirstChild=''
let NERDTreeMapActivateNode='<Tab>'

" -------------------
" Raibbow paren
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \     'ctermfgs': [ 'white', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \     'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
    \}

" -------------------
" supertab
"cycle backward
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabConontextDefaultCompletionType = "<c-x><c-o>"

" -------------------
" deoplete
"let g:deoplete#sources#jedi#show_docstring = 1
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#tag#cache_limit_size = 5000000
"
" -------------------
" nvim-completion-manager
let g:cm_complete_popup_delay = 100

" -------------------
" neomake

autocmd! BufWritePost * Neomake
let g:neomake_highlight_columns=3


let g:neomake_python_pylint_maker = {
        \ 'exe':'python2',
        \ 'args': [
            \ '-m', 'pylint',
            \ '--output-format=text',
            \ '--msg-template="{path}:{line}:{column}: [{msg_id} {symbol}] {msg} "',
            \ '--rcfile=~/Documents/trunk/SvtPython/pylintrc.txt',
            \ '--reports=no',
        \ ],
        \ 'errorformat':
            \ '%A%f:%l:%c: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ }
let g:neomake_python_enabled_makers = ['pylint']


hi NeomakeError     cterm=underline ctermfg=15 ctermbg=124
hi NeomakeWarning   cterm=underline ctermfg=15 ctermbg=124
hi NeomakeInfo      cterm=underline ctermfg=15 ctermbg=124
hi NeomakeMessage   cterm=underline ctermfg=15 ctermbg=124

" -------------------
" Jedi stuff
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
autocmd BufLeave '__doc__' q
autocmd FileType python setlocal completeopt-=preview
let g:jedi#force_py_version = 2
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#show_call_signatures = 0
let g:jedi#show_call_signatures_delay = 0
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
let g:jedi#max_doc_height = 15

"augroup jedi_call_signatures
"autocmd! * <buffer>
"
"autocmd InsertEnter <buffer> let s:show_call_signatures_last = [0, 0, '']
"autocmd InsertLeave <buffer> call g:jedi#clear_call_signatures()
"inoremap <C-space> <C-o>:call g:jedi#show_call_signatures()<cr>


" -------------------
" vim-signify
let g:signify_vcs_list = [ 'svn' ]

" -------------------
" neoformat
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-a', '-a', '-'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_python = ['autopep8']
vnoremap <silent> gf :Neoformat<cr>

" -------------------
" vc.vim
noremap <silent> gd :tab split<cr>:VCDiff<cr>

"---------------------
" neoterm
let g:neoterm_position="vertical"

" Neoterm mappings
nnoremap <F1> <ESC>:wa!<cr>
inoremap <F1> <ESC>:wa!<cr>
let g:neoterm_automap_keys = "<F2>"
nnoremap <expr> <F3> ":Tmap " . input("Command? "). "\<Enter>"
nnoremap <F4> :T <up>

" Auto-enter insert mode when entering a terminal window
autocmd BufWinEnter,WinEnter term://* startinsert

"---------------------
" fzf-vim
let $FZF_DEFAULT_COMMAND = 'find * -type f | grep -v "\.dll\|\.pyc"'

" fzf program maps
autocmd FileType fzf noremap <buffer> <esc> a<c-c> 
autocmd FileType fzf tnoremap <buffer> <C-j> <down>
autocmd FileType fzf tnoremap <buffer> <C-k> <up>
autocmd FileType fzf tnoremap <buffer> <C-space> <enter>

command! -bang FLines call fzf#vim#grep(
    \'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude-dir="env" --exclude=tags --exclude=*\.js --exclude=*\.pyc --exclude=*\.npy  --exclude=*\.pickle --exclude=*\.exe --exclude=*\.dll --exclude=*\.gitignore --exclude=generateSvtDocs_log.txt --exclude=*\.zip --exclude=*\.gz "^$"',
    \ 0, 
    \ {'options': '--reverse --prompt "FLines> "'})

" fzf windows maps
nnoremap <silent> <leader>q :Buffers<cr>
nnoremap <silent> <leader>w :Files<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>\ :Lines<cr>
nnoremap <silent> <leader>t :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>e :FLines<cr>

" status line options
"function! s:fzf_statusline()
"  highlight fzf1 ctermfg=46  ctermbg=234
"  highlight fzf2 ctermfg=46  ctermbg=234
"  highlight fzf3 ctermfg=46  ctermbg=234
"  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
"endfunction
"autocmd! User FzfStatusLine call <SID>fzf_statusline()

"################
" MISC
"################

" Remove line ending whitespace on save
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e

" Better foldtext 
fu! CustomFoldText()
	"get first non-blank line
	let fs = v:foldstart
	while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
	    let line = getline(v:foldstart)
    else
	    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif
	
	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = " " . foldSize . " lines "
	let foldLevelStr = repeat("+--", v:foldlevel)
	let lineCount = line("$")
	let foldPercentage = printf("[%4.1f", (foldSize*1.0)/lineCount*100) . "%] "
	let expansionString = repeat("—", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
	return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()

set foldmethod=indent foldlevel=1 foldnestmax=2
"autocmd BufRead * :if line('$') > 1000 | set foldmethod=indent foldlevel=1 foldnestmax=2 | endif
"autocmd BufEnter * :if line('$') > 1000 | set foldmethod=indent | endif
"autocmd BufWinEnter * set nofoldenable


" Latex things
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" always show the sign columns
autocmd BufRead, BufNewFile *.py setlocal signcolumn=yes


" 1 main block, one terminal, one small window above the terminal
function! g:SetLayout00()
  set colorcolumn=80
  execute "normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 70\<cr>:split\<cr>\<C-w>\<C-k>\<Esc>:resize 25\<cr>\<Esc>:b1\<cr>\<C-w>\<C-h>"
endfunc
command! SL0 call g:SetLayout00()

" nice "ide" layouy. Same as 00, but without the small window
function! g:SetLayout01()
  set colorcolumn=80
  execute "silent normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 70\<cr>\<C-w>\<C-h>\<Esc>"
endfunc
command! SL1 call g:SetLayout01()

" Same as 01, but the main window has 2 splits
function! g:SetLayout02()
  set colorcolumn=80
  execute "silent normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 70\<cr>\<C-w>\<C-h>\<Esc>:vs\<cr>"
endfunc
command! SL2 call g:SetLayout02()

" latexlayout
function! g:SetLayoutTex()
  let g:neoterm_position="horizontal"
  let @m="latexmk -pdf -pvc -interaction=nonstopmode -view=none\<cr>"
  set cole=0
  execute "normal! :autocmd! BufWinEnter,WinEnter term://*\<cr>:Tnew\<cr>\<C-w>\<C-j>:resize 15\<cr>\"mp\<C-w>\<C-k>"
endfunc
command! SetLayoutTex call g:SetLayoutTex()

" Set the layouts based on filetypes
" autocmd VimEnter *.py SetLayout02
"autocmd VimEnter *.tex SetLayoutTex
"

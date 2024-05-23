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
set errorformat+=%f:%l
set shortmess+=ca
set fillchars+=vert:│
set cursorline
set scrolloff=8

" Neovim options
set icm=nosplit
let g:vim_json_conceal=0 " show the quotes in json files
"
"################
" INDENTING
"################

set autoindent
let g:python_indent = {}
let g:python_indent.disable_parentheses_indenting = 1



"################
" BINDINGS
"################

let mapleader = " "
let tm=200

" open vimrc
command! Vimrc e ~/.config/nvim/init.vim

" clear highlights
nnoremap <C-u> :noh<CR>

" Tab to indent in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Search always center the buffer
nnoremap n nzz
nnoremap N Nzz

" e from system clipboard easy.
" Copy/Past
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>y "+y
noremap <leader>Y "+Y

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

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
map gm :call SynStack()<CR>

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
    else
        let g:loclist_is_open = 1
        let g:loclist_return_to_window = winnr()
        lopen 8
        execute g:loclist_return_to_window . "wincmd w"

    endif
endfunction

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0

    else
        let g:quickfix_is_open = 1
        let g:quickfix_return_to_window = winnr()

        botright copen 7
        " Global bottom window for quickfix
        execute g:quickfix_return_to_window . "wincmd w"
    endif
endfunction

autocmd BufWinEnter quickfix let g:quickfix_is_open = 1

nnoremap <silent> <leader>a :call LocListToggle()<cr>
nnoremap <silent> <leader><Tab> :call QuickfixToggle()<cr>

nnoremap <silent> <Tab> :cnext<cr>
nnoremap <silent> <S-Tab> :cprev<cr>

nnoremap <silent> <leader><leader> :ll<cr>
nnoremap <silent> <C-n> :lnext<cr>
nnoremap <silent> <M-n> :lprev<cr>


" File type assignement
autocmd BufRead,BufNewFile *.pyx setl ft=cython 



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

Plugin 'scrooloose/nerdtree'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

"Plugin 'zchee/deoplete-jedi'
"Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'

Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-bufword'
Plugin 'ncm2/ncm2-path'
""Plugin 'ncm2/ncm2-tagprefix'
Plugin 'ncm2/ncm2-syntax' | Plugin 'Shougo/neco-syntax'
Plugin 'ncm2/ncm2-neoinclude' | Plugin 'Shougo/neoinclude.vim'
Plugin 'ncm2/ncm2-jedi'
Plugin 'ncm2/ncm2-pyclang'
Plugin 'ncm2/ncm2-vim' | Plugin 'Shougo/neco-vim'

"Plugin 'wookayin/semshi'
Plugin 'nvim-treesitter/nvim-treesitter'

Plugin 'kassio/neoterm'
Plugin 'neomake/neomake'
Plugin 'sbdchd/neoformat'

Plugin 'vim-scripts/vim-indent-object'
Plugin 'lervag/vimtex'

Plugin 'djoshea/vim-autoread'

Plugin 'mhinz/vim-signify'
Plugin 'juneedahamed/vc.vim'

Plugin 'lambdalisue/vim-cython-syntax'
Plugin 'machakann/vim-highlightedyank'

call vundle#end()


" -------------------
" Airline theme
let g:airline_theme='deus'
"let g:airline_theme='jellybeans'
let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['tagbar']
let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'z', 'warning'],
    \ ]
let g:airline#extensions#default#section_truncate_width = {
    \ 'x': 80,
    \ 'z': 45,
    \ }


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tagbar#flags = 'f' 
let g:airline#extensions#neomake#enabled = 1

function! AirlineInit()
    let g:airline_section_x = airline#section#create_right(['tagbar'])
    let g:airline_section_z = "%l/%L:%v"
    let g:airline_section_warning = "%{neomake#statusline#LoclistStatus('')}"

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
    \     'operators': '_,\|+\|-\|*\|===\|!==_',
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
"call deoplete#custom#option('auto_complete_delay', 100)

" -------------------
" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()

let g:ncm2#popup_delay = 100
let g:ncm2#popup_limit = 15
set completeopt=noinsert,menuone,noselect

" -------------------
" tresitter

"lua require('config/treesitter')

" -------------------
" neomake
function! SaveAllAndRunNeomake()
    wa!
    silent Neomake
endfunc

nnoremap <silent> <F1> <ESC>:call SaveAllAndRunNeomake()<cr>
inoremap <silent> <F1> <ESC>:call SaveAllAndRunNeomake()<cr>


"nnoremap <F1> <ESC>:wa!<cr>
"inoremap <F1> <ESC>:wa!<cr>
autocmd! CursorHold * Neomake
autocmd! CursorHoldI * Neomake
let g:neomake_highlight_columns=3
let g:neomake_error_sign = {'text': '🢂', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '🡲','texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '🡲','texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': '🡲','texthl': 'NeomakeInfoSign'}

"let g:neomake_error_sign = {'text': '->', 'texthl': 'NeomakeErrorSign'}
"let g:neomake_warning_sign = {'text': '->','texthl': 'NeomakeWarningSign'}
"let g:neomake_message_sign = {'text': '->','texthl': 'NeomakeMessageSign'}

let g:neomake_python_pylint_maker = {
        \ 'exe':'python3.7',
        \ 'args': [
            \ '-m', 'pylint',
            \ '--output-format=text',
            \ '--msg-template="{path}:{line}:{column}:{C}: [{msg_id} {symbol}] {msg}"',
            \ '--rcfile=~/Documents/trunk/SvtPython/pylintrc.txt',
            \ '--reports=no'
        \ ],
        \ 'errorformat':
            \ '%A%f:%l:%c:%t: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ 'output_stream': 'stdout',
        \ 'postprocess': [
        \   function('neomake#postprocess#generic_length'),
        \   function('neomake#makers#ft#python#PylintEntryProcess'),
\ ]}
function! g:neomake_python_pylint_maker.filter_output(lines, context) abort
    if a:context.source ==# 'stderr'
        call filter(a:lines, "v:val !=# 'No config file found, using default configuration' && v:val !~# '^Using config file '")
    endif
    call neomake#makers#ft#python#FilterPythonWarnings(a:lines, a:context)
endfunction

let g:neomake_python_enabled_makers = ['pylint']

hi NeomakeMessageSign  ctermfg=255  ctermbg=None   cterm=bold
hi NeomakeInfoSign  ctermfg=255  ctermbg=None   cterm=bold
hi NeomakeWarningSign  ctermfg=11  ctermbg=None   cterm=bold
hi NeomakeErrorSign    ctermfg=9  ctermbg=None   cterm=bold

hi NeomakeError     cterm=underline ctermfg=15 ctermbg=124
hi NeomakeWarning   cterm=underline ctermfg=15 ctermbg=124
hi NeomakeInfo      cterm=underline ctermfg=15 ctermbg=124
hi NeomakeMessage   cterm=underline ctermfg=15 ctermbg=124

" -------------------
" Jedi stuff
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
autocmd BufLeave '__doc__' q
autocmd FileType python setlocal completeopt-=preview
let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#show_call_signatures = 0
let g:jedi#show_call_signatures_delay = 0
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
let g:jedi#max_doc_height = 15

augroup jedi_call_signatures
autocmd! * <buffer>

autocmd InsertEnter <buffer> let s:show_call_signatures_last = [0, 0, '']
autocmd InsertLeave <buffer> call g:jedi#clear_call_signatures()
inoremap <C-space> <C-o>:call g:jedi#show_call_signatures()<cr>


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
let g:neoterm_default_mod = 'vertical'

" Neoterm mappings
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
    \'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude-dir="env" --exclude=tags --exclude=*\.js --exclude=*\.pyc --exclude=*\.npy  --exclude=*\.pickle --exclude=*\.exe --exclude=*\.dll --exclude=*\.o --exclude=*\.gitignore --exclude=generateSvtDocs_log.txt --exclude=*\.zip --exclude=*\.gz "^$"',
   \ 0, 
   \ {'options': '--reverse --prompt "FLines> " --color hl:45,hl+:51 '})

command! -bang FPyLines call fzf#vim#grep(
    \'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude-dir="env" --include=*\.py --include=*\.pyx --include=*\.csv "^$"',
   \ 0, 
   \ {'options': '--reverse --prompt "FPyLines> " --color hl:45,hl+:51 '})

" fzf windows maps
nnoremap <silent> <leader>q :Buffers<cr>
nnoremap <silent> <leader>w :Files<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>\ :Lines<cr>
nnoremap <silent> <leader>t :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>e :FPyLines<cr>
nnoremap <silent> <leader>E :FLines<cr>

function! Fzf_build_quickfix_list(lines)
    let! g:tempVal = copy(a:lines)
    call setqflist(a:lines)
    "call setqflist(map(copy(a:lines), '{ "filename": v:val.path, "lnum":20 }'))
    cc
    "
    " Have to wait for fzf to close for botright copen to work properly
    timer_start(50, QuickfixToggle) 
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-q': function('Fzf_build_quickfix_list'),
  \ 'ctrl-v': 'vsplit' }


" status line options
"function! s:fzf_statusline()
"  highlight fzf1 ctermfg=46  ctermbg=234
"  highlight fzf2 ctermfg=46  ctermbg=234
"  highlight fzf3 ctermfg=46  ctermbg=234
"  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
"endfunction
"autocmd! User FzfStatusLine call <SID>fzf_statusline()

"---------------------
"vim-highlightedyank


let g:highlightedyank_highlight_duration = 250

hi HighlightedyankRegion ctermfg=none ctermbg=243 gui=reverse

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

set foldmethod=indent foldlevel=1 foldnestmax=3
"autocmd BufRead * :if line('$') > 1000 | set foldmethod=indent foldlevel=1 foldnestmax=2 | endif
"autocmd BufEnter * :if line('$') > 1000 | set foldmethod=indent | endif
"autocmd BufWinEnter * set nofoldenable


" Latex things
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" always show the sign columns
autocmd BufRead, BufNewFile *.py setlocal signcolumn=yes


"################
" LAYOUTS
"################

" 1 main block, one terminal, one small window above the terminal
function! g:SetLayout00()
  set colorcolumn=80
  execute "normal! :vertical Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 70\<cr>:split\<cr>\<C-w>\<C-k>\<Esc>:resize 25\<cr>\<Esc>:b1\<cr>\<C-w>\<C-h>"
endfunc
command! SL0 call g:SetLayout00()

" nice "ide" layouy. Same as 00, but without the small window
function! g:SetLayout01()
  set colorcolumn=80
  execute "silent normal! :vertical Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 80\<cr>\<C-w>\<C-h>\<Esc>"
endfunc
command! SL1 call g:SetLayout01()

" Same as 01, but the main window has 2 splits
function! g:SetLayout02()
  set colorcolumn=80
  execute "silent normal! :vertical Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 70\<cr>\<C-w>\<C-h>\<Esc>:vs\<cr>"
endfunc
command! SL2 call g:SetLayout02()

" latexlayout
function! g:SetLayoutTex()
  let @m="latexmk -pdf -pvc -interaction=nonstopmode -view=none\<cr>"
  set cole=0
  execute "normal! :autocmd! BufWinEnter,WinEnter term://*\<cr>:bel Tnew\<cr>\<C-w>\<C-j>:resize 15\<cr>\"mp\<C-w>\<C-k>"
endfunc
command! SetLayoutTex call g:SetLayoutTex()

" Set the layouts based on filetypes
" autocmd VimEnter *.py SetLayout02
autocmd VimEnter *.tex SetLayoutTex
"

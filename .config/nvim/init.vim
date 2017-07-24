scriptencoding utf-8

set encoding=utf-8



if has('nvim')
		let s:editor_root=expand("~/.config/nvim")
	else
		let s:editor_root=expand("~/.vim")
	endif

set hidden
set noshowmode
set expandtab
set background=dark
set belloff=all
set ff=unix
colorscheme sweylaPy
autocmd Filetype qf setlocal colorcolumn=0


filetype on  " required
filetype off " required

let mapleader = " "
let tm=200
set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#rc(s:editor_root . '/bundle')
call vundle#begin()

" Vundle plugins
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
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/deoplete.nvim'

Plugin 'kassio/neoterm'
Plugin 'neomake/neomake'
Plugin 'sbdchd/neoformat'

Plugin 'vim-scripts/vim-indent-object'
Plugin 'lervag/vimtex'

Plugin 'mhinz/vim-signify'
Plugin 'juneedahamed/vc.vim'

call vundle#end()            " required

" Bunch of basic options
syntax on
filetype indent plugin on
set backspace=indent,eol,start
set novb
set guifont=Ubuntu\ Mono\ 13
set wrap linebreak nolist
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
set lcs=tab:>-,nbsp:_
set timeoutlen=500

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

let g:airline_left_sep = ''
let g:airline_right_sep = ''

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
" doeplete
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000
set shortmess+=c

" -------------------
" Jedi stuff
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
autocmd BufLeave '__doc__' q
autocmd FileType python setlocal completeopt-=preview
set splitbelow
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#show_call_signatures = 0
"let g:jedi#show_call_signatures_delay = 0
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
let g:jedi#max_doc_height = 15
"

" -------------------
" Vimtex stuff
"let g:vimtex_view_enabled = 0

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

" -------------------
" Splits
"Split abbreviations
cabbrev o only
cabbrev vres vertical<space>resize

"Split resize
noremap <silent> <C-Left>  :vertical<space>resize<space>-5<cr>
noremap <silent> <C-Right> :vertical<space>resize<space>+5<cr>
noremap <silent> <C-Up>    :res<space>+5<cr>
noremap <silent> <C-Down>  :res<space>-5<cr>

inoremap <silent> <C-Left>  <esc>:vertical<space>resize<space>-5<cr>a
inoremap <silent> <C-Right> <esc>:vertical<space>resize<space>+5<cr>a
inoremap <silent> <C-Up>    <esc>:res<space>+5<cr>a
inoremap <silent> <C-Down>  <esc>:res<space>-5<cr>a

tnoremap <silent> <C-Left>  <C-\><C-n>:vertical<space>resize<space>-5<cr>a
tnoremap <silent> <C-Right> <C-\><C-n>:vertical<space>resize<space>+5<cr>a
tnoremap <silent> <C-Up>    <C-\><C-n>:res<space>+5<cr>a
tnoremap <silent> <C-Down>  <C-\><C-n>:res<space>-5<cr>a

"split related options
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <F9> :vertical resize 88<cr>
nnoremap <F10> :vertical resize 120<cr>
nnoremap <F12> <C-w>=
set noea

" -----------------
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

" -------------------
" misc
" Redo last macro
nnoremap \ @@

" Numerical increments/decrements
nnoremap + <C-a>
nnoremap _ <C-x>

" Autowrite on make
set autowrite

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

" clear highlights
nnoremap <C-_> :noh<CR>

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

" Latex things
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

"Arrow keys navigate wrapped lines
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk


" Break current line in two
nnoremap <expr> <Enter> &ma?"i\<cr>\<esc>":"\<cr>"

" Remove whitespace on save
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e

" always show the sign columns
autocmd BufEnter *.py sign define dummy
autocmd BufEnter *.py execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


" neomake stuff
let g:loclist_is_open = 0
function! LocListToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
    else
        let g:loclist_return_to_window = winnr()
        lopen 8
        execute g:loclist_return_to_window . "wincmd w"
        let g:loclist_is_open = 1
    endif
endfunction

autocmd! BufWritePost * Neomake
nnoremap <silent> <leader>a :call LocListToggle()<cr>
"nnoremap <silent> <leader>s :lclose<cr>
nnoremap <silent> <leader><Space> :ll<cr>
nnoremap <silent> <leader>n :lnext<cr>
nnoremap <silent> <leader>N :lprev<cr>
let g:neomake_highlight_columns=3


function PostprocessPylintMaker(entry)
endfunction

let g:neomake_python_pylint_maker = {
        \ 'args': [
            \ '--output-format=text',
            \ '--msg-template="{path}:{line}:{column}: [{msg_id} {symbol}] {msg} "',
            \ '--rcfile=~/.config/nvim/pylintrc_introspect',
            \ '--reports=no'
        \ ],
        \ 'errorformat':
            \ '%A%f:%l:%c: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ 'output_stream': 'stdout',
        \ 'postprocess': [
        \   function('neomake#postprocess#GenericLengthPostprocess'),
        \   function('neomake#makers#ft#python#PylintEntryProcess'),
        \   function('PostprocessPylintMaker'),
        \ ]}
let g:neomake_python_enabled_makers = ['pylint']


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


" --------------------------
" --------------------------
" FUzzy stuff
" use the .agingore file
let $FZF_DEFAULT_COMMAND = 'find * -type f | grep -v "\.dll\|\.pyc"'
" fzf remaps
autocmd FileType fzf noremap <buffer> <esc> a<c-c> 
autocmd FileType fzf tnoremap <buffer> <C-j> <down>
autocmd FileType fzf tnoremap <buffer> <C-k> <up>
autocmd FileType fzf tnoremap <buffer> <C-space> <enter>

command! -bang FLines call fzf#vim#grep(
    \'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude=tags --exclude=*\.js --exclude=*\.pyc --exclude=*\.npy  --exclude=*\.pickle --exclude=*\.exe --exclude=*\.dll --exclude=*\.gitignore --exclude=*\.zip --exclude=*\.gz "^$"',
    \ 0, 
    \ {'options': '--reverse --prompt "FLines> "'})

nnoremap <silent> <leader>q :Buffers<cr>
nnoremap <silent> <leader>w :Files<cr>
nnoremap <silent> <leader>/ :BLines<cr>
nnoremap <silent> <leader>\ :Lines<cr>
nnoremap <silent> <leader>t :BTags<cr>
nnoremap <silent> <leader>T :Tags<cr>
nnoremap <silent> <leader>e :FLines<cr>

function! s:fzf_statusline()
  highlight fzf1 ctermfg=46  ctermbg=234
  highlight fzf2 ctermfg=46  ctermbg=234
  highlight fzf3 ctermfg=46  ctermbg=234
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()


"---------------------
"- TERM RELATED
"nvim term bindings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

let g:neoterm_position="vertical"

" Neoterm mappings
"nnoremap <F1> :wa!<cr>
nnoremap <F1> <ESC>:wa!<cr>
inoremap <F1> <ESC>:wa!<cr>
let g:neoterm_automap_keys = "<F2>"
nnoremap <expr> <F3> ":Tmap " . input("Command? "). "\<Enter>"

" Auto-enter insert mode when entering a terminal window
autocmd BufWinEnter,WinEnter term://* startinsert


" nice "ide" layout : 1 main block, one terminal, one small window above
" terminal
function! g:SetLayout00()
  let &colorcolumn=join(range(81,999),",")
  execute "normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 55\<cr>:split\<cr>\<C-w>\<C-k>\<Esc>:resize 25\<cr>\<Esc>:b1\<cr>\<C-w>\<C-h>"
endfunc
command! SetLayout00 call g:SetLayout00()

" nice "ide" layouy. Same as 00, but without the small window
function! g:SetLayout01()
  let &colorcolumn=join(range(81,999),",")
  execute "normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 55\<cr>\<C-w>\<C-h>"
endfunc
command! SetLayout01 call g:SetLayout01()

" latexlayout
function! g:SetLayoutTex()
  let g:neoterm_position="horizontal"
  let @m="latexmk -pdf -pvc -interaction=nonstopmode -view=none\<cr>"
  set cole=0
  execute "normal! :autocmd! BufWinEnter,WinEnter term://*\<cr>:Tnew\<cr>\<C-w>\<C-j>:resize 15\<cr>\"mp\<C-w>\<C-k>"
endfunc
command! SetLayoutTex call g:SetLayoutTex()

autocmd VimEnter *.py SetLayout01
autocmd VimEnter *.tex SetLayoutTex


" Extra stuff
"source ~/.config/nvim/neomake_python_backup.vim

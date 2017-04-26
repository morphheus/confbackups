scriptencoding utf-8

set encoding=utf-8



if has('nvim')
		let s:editor_root=expand("~/.config/nvim")
	else
		let s:editor_root=expand("~/.vim")
	endif

set hidden
set background=dark
set belloff=all
set ff=unix
colorscheme sweylaPy
let &colorcolumn=join(range(81,999),",")
autocmd Filetype qf setlocal colorcolumn=0


"if has('nvim')
"	set rtp^=/usr/share/vim/vimfiles/
"endif

if has('vim')
	set nocompatible              " be iMproved, required
endif

filetype on                  " required
filetype off                  " required

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

Plugin 'vim-scripts/vim-indent-object'



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
set smartcase
set undolevels=1000
set list
set lcs=tab:>-,nbsp:_
set timeoutlen=500


" Tagbar
let g:tagbar_autofocus = 1

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


let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" NerdTree setup
noremap <F8> :NERDTreeToggle<CR>
noremap <F7> :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeMapJumpLastChild=''
let NERDTreeMapJumpFirstChild=''
let NERDTreeMapActivateNode='<Tab>'


" Raibbow paren
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

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


" Redo last macro
nnoremap \ @@

"split related options
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
nnoremap <F9> :vertical resize 88<cr>
nnoremap <F10> :vertical resize 120<cr>
nnoremap <F12> <C-w>=
set noea

" Vimux run commands
"nnoremap <F1> <ESC>:wa!<cr>:VimuxRunLastCommand<cr>
"nnoremap <F2> <ESC>:wa!<cr>:VimuxPromptCommand<cr>
"inoremap <F1> <ESC>:wa!<cr>:VimuxRunLastCommand<cr>a
"inoremap <F2> <ESC>:wa!<cr>:VimuxPromptCommand<cr>


" Numerical increments/decrements
nnoremap + <C-a>
nnoremap _ <C-x>

" Autowrite on make
set autowrite

" supertab cycles backwards
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabConontextDefaultCompletionType = "<c-x><c-o>"



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


" Remove whitespace
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e


"Jedi stuff
autocmd BufWinEnter '__doc__' setlocal bufhidden=delete
let g:jedi#completions_enabled = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#show_call_signatures = "2"
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
"""let g:jedi#completions_command = "<leader>c"
""let g:jedi#completions_command = "<C-space>"
""let g:jedi#rename_command = "<leader>r"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 1
"

" neomake stuff
autocmd! BufWritePost * Neomake
nnoremap <silent> <leader>a :lopen 8<cr><C-W><C-K>
nnoremap <silent> <leader>s :lclose<cr>
nnoremap <silent> <leader><Space> :ll<cr>
nnoremap <silent> <leader>n :lnext<cr>
nnoremap <silent> <leader>N :lprev<cr>
let g:neomake_highlight_columns=3


" doeplete stuff
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000

" Tagbar
nnoremap <F5> :TagbarToggle<CR>

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



" FUzzy stuff
" use the .agingore file
let $FZF_DEFAULT_COMMAND = 'find * -type f | grep -v "\.dll\|\.pyc"'
" fzf remaps
autocmd FileType fzf noremap <buffer> <esc> a<c-c> 
autocmd FileType fzf tnoremap <buffer> <C-j> <down>
autocmd FileType fzf tnoremap <buffer> <C-k> <up>
autocmd FileType fzf tnoremap <buffer> <C-space> <enter>

command! -bang FLines call fzf#vim#grep(
    \'grep -vnITr --color=always --exclude-dir=".svn" --exclude=tags --exclude=*\.js --exclude=*\.pyc --exclude=*\.exe --exclude=*\.dll --exclude=*\.zip --exclude=*\.gz "^$"',
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


"Guten tag status
"set statusline+=%{gutentags#statusline()}


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






" nice "ide" layout
function! g:SetLayout00()
  execute "normal! :Tnew\<cr>\<C-w>\<C-l>\<Esc>:vertical resize 55\<cr>:split\<cr>\<C-w>\<C-k>\<Esc>:resize 25\<cr>\<Esc>:b1\<cr>\<C-w>\<C-h>"
endfunc

command! SetLayout00 call g:SetLayout00()
autocmd VimEnter * SetLayout00


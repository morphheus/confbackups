-- ----------------
-- GENERAL SETTINGS
-- ----------------

-- Standard Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'

-- UI and Theme
vim.opt.termguicolors = false
vim.cmd('colorscheme sweylaPy')

-- General Behavior
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.belloff = 'all'
vim.opt.equalalways = false -- equivalent to noea
vim.opt.fileformat = 'unix'
vim.opt.confirm = true
vim.opt.inccommand = 'nosplit' -- icm=nosplit

-- Indentation and Tabs
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftround = true

-- Editing Experience
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.undolevels = 1000
vim.opt.autowrite = true

-- Search and Command Line
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.wildmode = { 'longest:list', 'full' }
vim.opt.timeoutlen = 500

-- Display and Lists
vim.opt.list = true
vim.opt.listchars = { tab = '| ', nbsp = '~', extends = '>', precedes = '<' }
vim.opt.showbreak = '  '
vim.opt.fillchars = { vert = '│' }
vim.opt.ruler = true

-- Windows and Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Error and Formatting
vim.opt.errorformat = { '%f:%l: %m', '%f:%l' }
vim.opt.shortmess:append('ca')

-- Disable colorcolumn for quickfix
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.colorcolumn = '0'
  end,
})

-- Python idnenting
vim.g.python_indent = {
  disable_parentheses_indenting = 1
}

-- Global Variables (Plugin Options)
vim.g.vim_json_conceal = 0    -- show the quotes in json files


-- ----------------
-- GENERAL BINDINGS
-- ----------------
vim.g.mapleader = " "
vim.opt.timeoutlen = 2000 -- tm=200

-- Custom Commands
vim.api.nvim_create_user_command('Vimrc', 'e ~/.config/nvim/init.lua', {})

-- Clear highlights
vim.keymap.set('n', '<C-u>', ':noh<CR>')

-- Tab to indent in visual mode
vim.keymap.set('v', '<Tab>', '>gv', { silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { silent = true })

-- Search always center the buffer
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Copy/Paste from system clipboard
vim.keymap.set('', '<leader>p', '"+p')
vim.keymap.set('', '<leader>P', '"+P')
vim.keymap.set('', '<leader>y', '"+y')
vim.keymap.set('', '<leader>Y', '"+Y')

-- Remap home/pagedown navigation
vim.keymap.set('', 'H', 'g<HOME>')
vim.keymap.set('', 'L', 'g<END>')
vim.keymap.set('', 'J', '10j')
vim.keymap.set('', 'K', '10k')

-- Alt navigate wrapped lines
vim.keymap.set('i', '<M-j>', '<C-o>gj', { silent = true })
vim.keymap.set('i', '<M-k>', '<C-o>gk', { silent = true })
vim.keymap.set('n', '<M-j>', 'gj', { silent = true })
vim.keymap.set('n', '<M-k>', 'gk', { silent = true })

-- Terminal bindings
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]])

-- Abbreviations
vim.cmd([[
  cabbrev o only
  cabbrev vres vertical resize
]])

-- Split resizing
local resize_opts = { silent = true }
vim.keymap.set('n', '<M-Left>', ':vertical resize -5<cr>', resize_opts)
vim.keymap.set('n', '<M-Right>', ':vertical resize +5<cr>', resize_opts)
vim.keymap.set('n', '<M-Up>', ':res +5<cr>', resize_opts)
vim.keymap.set('n', '<M-Down>', ':res -5<cr>', resize_opts)

vim.keymap.set('i', '<M-Left>', '<esc>:vertical resize -5<cr>a', resize_opts)
vim.keymap.set('i', '<M-Right>', '<esc>:vertical resize +5<cr>a', resize_opts)
vim.keymap.set('i', '<M-Up>', '<esc>:res +5<cr>a', resize_opts)
vim.keymap.set('i', '<M-Down>', '<esc>:res -5<cr>a', resize_opts)

vim.keymap.set('t', '<M-Left>', [[<C-\><C-n>:vertical resize -5<cr>a]], resize_opts)
vim.keymap.set('t', '<M-Right>', [[<C-\><C-n>:vertical resize +5<cr>a]], resize_opts)
vim.keymap.set('t', '<M-Up>', [[<C-\><C-n>:res +5<cr>a]], resize_opts)
vim.keymap.set('t', '<M-Down>', [[<C-\><C-n>:res -5<cr>a]], resize_opts)

vim.keymap.set('n', '<F9>', ':vertical resize 88<cr>')
vim.keymap.set('n', '<F10>', ':vertical resize 120<cr>')
vim.keymap.set('n', '<F12>', '<C-w>=')

-- Split navigation
vim.keymap.set('n', '<C-j>', '<C-W><C-J>')
vim.keymap.set('n', '<C-k>', '<C-W><C-K>')
vim.keymap.set('n', '<C-l>', '<C-W><C-L>')
vim.keymap.set('n', '<C-h>', '<C-W><C-H>')

-- Redo last macro
vim.keymap.set('n', '\\', '@@')

-- Insert enter from normal mode (Expression mapping)
vim.keymap.set('n', '<Enter>', function()
    if vim.opt.modifiable:get() then
        return "i<cr><esc>`^"
    else
        return "<cr>"
    end
end, { expr = true })

-- Insert enter and adjust text to match the original cursor column
vim.keymap.set('n', 'g<Enter>', function()
  local currentColumn = vim.fn.col(".")
  vim.cmd('normal! i\r\27`^')
  local diff = currentColumn - vim.fn.col(".")
  if diff > 0 then
    vim.cmd('normal! ' .. diff .. 'i ')
  end
  vim.cmd('normal! l')
end, { silent = true })

-- Insert newline and add spaces to match the original cursor columns
vim.keymap.set('n', 'go', function()
  local currentColumn = vim.fn.col(".")
  vim.cmd('normal! o\27`^')
  local diff = currentColumn - vim.fn.col(".")
  if diff > 0 then
    vim.cmd('normal! ' .. diff .. 'i ')
  end
  vim.cmd('normal! a')
end, { silent = true })

-- search highlight
vim.keymap.set('v', '*', 'y/<C-R>"<CR>')

-- Relative line toggle
function _G.ToggleNuMode()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

vim.api.nvim_create_user_command('RelToggle', _G.ToggleNuMode, {})
vim.keymap.set({ 'n', 'v', 'o' }, '<F6>', ':RelToggle<cr>', { silent = true })

-- Function to show syntax stack under cursor
function _G.SynStack()
  local stack = vim.fn.synstack(vim.fn.line('.'), vim.fn.col('.'))
  local names = vim.fn.map(stack, 'synIDattr(v:val, "name")')
  print(vim.inspect(names))
end
vim.keymap.set('n', 'gm', ':lua SynStack()<CR>', { silent = true })

-- Location list / Quickfix toggle logic
vim.g.loclist_is_open = 0
vim.g.quickfix_is_open = 0

function _G.LocListToggle()
  if vim.g.loclist_is_open == 1 then
    vim.cmd('lclose')
    vim.g.loclist_is_open = 0
  else
    vim.g.loclist_is_open = 1
    local return_win = vim.fn.winnr()
    vim.cmd('lopen 8')
    vim.cmd(return_win .. 'wincmd w')
  end
end

function _G.QuickfixToggle()
  if vim.g.quickfix_is_open == 1 then
    vim.cmd('cclose')
    vim.g.quickfix_is_open = 0
  else
    vim.g.quickfix_is_open = 1
    local return_win = vim.fn.winnr()
    vim.cmd('botright copen 7')
    vim.cmd(return_win .. 'wincmd w')
  end
end

-- Ensure state is tracked when quickfix opens
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "quickfix",
  callback = function()
    vim.g.quickfix_is_open = 1
  end,
})

-- Bindings for toggles
vim.keymap.set('n', '<leader>a', _G.LocListToggle, { silent = true })
vim.keymap.set('n', '<leader><Tab>', _G.QuickfixToggle, { silent = true })

-- Navigation for Quickfix
vim.keymap.set('n', '<Tab>', ':cnext<cr>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':cprev<cr>', { silent = true })

-- Navigation for Location List
vim.keymap.set('n', '<leader><leader>', ':ll<cr>', { silent = true })
vim.keymap.set('n', '<C-n>', ':lnext<cr>', { silent = true })
vim.keymap.set('n', '<M-n>', ':lprev<cr>', { silent = true })

-- File type assignment
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.pyx",
  callback = function()
    vim.opt_local.filetype = "cython"
  end,
})

-- ---------------
-- LAZY.VIM
-- ---------------



-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ---------------
-- PLUGINS
-- ---------------

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "luochen1990/rainbow",
    "Konfekt/FastFold",

    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",

    "scrooloose/nerdtree",

    "junegunn/fzf",
    "junegunn/fzf.vim",

    "davidhalter/jedi-vim",
    "ervandew/supertab",

    "roxma/nvim-yarp",

    "ncm2/ncm2",
    "ncm2/ncm2-bufword",
    "ncm2/ncm2-path",
    --"ncm2/ncm2-tagprefix",
    "ncm2/ncm2-syntax",
    "ncm2/ncm2-neoinclude",
    "ncm2/ncm2-jedi",
    "ncm2/ncm2-pyclang",
    "ncm2/ncm2-vim",

    "Shougo/neco-syntax",
    "Shougo/neco-vim",
    "Shougo/neoinclude.vim",

    "nvim-treesitter/nvim-treesitter",

    "kassio/neoterm",
    "neomake/neomake",

    "vim-scripts/vim-indent-object",
    "lervag/vimtex",

    "djoshea/vim-autoread",

    "lambdalisue/vim-cython-syntax",
    "machakann/vim-highlightedyank",
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})


-- indent-blankline.nvim
require("ibl").setup()

-- --------------
-- Plugin: vim-airline

vim.g.airline_theme = 'deus'
vim.g['airline#extensions#disable_rtp_load'] = 1
-- Layout configuration
vim.g['airline#extensions#default#layout'] = {
  { 'a', 'c' },
  { 'x', 'z', 'warning' },
}
-- Truncation width
vim.g['airline#extensions#default#section_truncate_width'] = {
  x = 80,
  z = 45,
}

local symbols = vim.g.airline_symbols or {}
symbols.branch = ''
symbols.readonly = ''
symbols.linenr = '☰'
symbols.maxlinenr = ''
vim.g.airline_symbols = symbols

vim.g['airline#extensions#tagbar#flags'] = 'f'
vim.g['airline#extensions#neomake#enabled'] = 1

function _G.AirlineInit()
  -- Using vim.fn to call airline's internal autoload functions
  vim.g.airline_section_x = vim.fn['airline#section#create_right']({'tagbar'})
  vim.g.airline_section_z = "%l/%L:%v"
  vim.g.airline_section_warning = "%{neomake#statusline#LoclistStatus('')}"
end

vim.api.nvim_create_autocmd("User", {
  pattern = "AirlineAfterInit",
  callback = function()
    _G.AirlineInit()
  end,
})


-- -------------------
-- plugin: nerdtree
vim.keymap.set('', '<F8>', ':NERDTreeToggle<CR>', { noremap = true })
vim.keymap.set('', '<F7>', ':NERDTreeFind<CR>', { noremap = true })
vim.g.NERDTreeIgnore = { '\\.pyc$' }
vim.g.NERDTreeShowBookmarks = 1
vim.g.NERDTreeMapJumpLastChild = ''
vim.g.NERDTreeMapJumpFirstChild = ''
vim.g.NERDTreeMapActivateNode = '<Tab>'

-- -------------------
-- Plugin: rainbow
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
  ctermfgs = { 'white', 'lightblue', 'lightyellow', 'lightcyan', 'lightmagenta' },
  operators = '_,\\|+\\|-\\|*\\|===\\|!==_'
}


-- -------------------
-- Plugin: supertab
vim.g.SuperTabDefaultCompletionType = "<c-x><c-o>"
vim.g.SuperTabConontextDefaultCompletionType = "<c-x><c-o>"

-- -------------------
-- Plugin: ncm2
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.fn["ncm2#enable_for_buffer"]()
  end,
})

vim.g["ncm2#popup_delay"] = 100
vim.g["ncm2#popup_limit"] = 15
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }

-- -------------------
-- Plugin: neomake
function SaveAllAndRunNeomake()
  vim.cmd("wa!")
  vim.cmd("silent Neomake")
end

vim.keymap.set("n", "<F1>", SaveAllAndRunNeomake, { silent = true })
vim.keymap.set("i", "<F1>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
  SaveAllAndRunNeomake()
end, { silent = true })

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  command = "Neomake",
})
vim.api.nvim_create_autocmd("CursorHoldI", {
  pattern = "*",
  command = "Neomake",
})

vim.g.neomake_highlight_columns = 3
vim.g.neomake_error_sign = { text = "🢂", texthl = "NeomakeErrorSign" }
vim.g.neomake_warning_sign = { text = "🡲", texthl = "NeomakeWarningSign" }
vim.g.neomake_message_sign = { text = "🡲", texthl = "NeomakeMessageSign" }
vim.g.neomake_info_sign = { text = "🡲", texthl = "NeomakeInfoSign" }

vim.g.neomake_python_pylint_maker = {
  exe = "python3.12",
  args = {
    "-m",
    "pylint",
    "--output-format=text",
    '--msg-template="{path}:{line}:{column}:{C}: [{msg_id} {symbol}] {msg}"',
    "--rcfile=~/Documents/source/SvtPython/pylintrc.txt",
    "--reports=no",
  },
  errorformat = "%A%f:%l:%c:%t: %m," .. "%A%f:%l: %m," .. "%A%f:(%l): %m," .. "%-Z%p^%.%#," .. "%-G%.%#",
  output_stream = "stdout",
}

vim.g.neomake_python_enabled_makers = { "pylint" }

-- Highlights
vim.api.nvim_set_hl(0, "NeomakeMessageSign", { fg = 255, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "NeomakeInfoSign",    { fg = 255, bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "NeomakeWarningSign", { fg = 11,  bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "NeomakeErrorSign",   { fg = 9,   bg = "NONE", bold = true })

vim.api.nvim_set_hl(0, "NeomakeError",       { fg = 15, bg = 124, underline = true })
vim.api.nvim_set_hl(0, "NeomakeWarning",     { fg = 15, bg = 124, underline = true })
vim.api.nvim_set_hl(0, "NeomakeInfo",        { fg = 15, bg = 124, underline = true })
vim.api.nvim_set_hl(0, "NeomakeMessage",     { fg = 15, bg = 124, underline = true })


-- -------------------
-- Plugin: jedi
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "__doc__",
  callback = function()
    vim.opt_local.bufhidden = "delete"
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "__doc__",
  command = "q",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.completeopt:remove("preview")
  end,
})

vim.g["jedi#force_py_version"] = 3
vim.g["jedi#completions_enabled"] = 0
vim.g["jedi#goto_assignments_command"] = "<leader>g"
vim.g["jedi#show_call_signatures"] = 0
vim.g["jedi#show_call_signatures_delay"] = 0
vim.g["jedi#documentation_command"] = "<leader>i"
vim.g["jedi#usages_command"] = "<leader>u"
vim.g["jedi#max_doc_height"] = 15

local jedi_group = vim.api.nvim_create_augroup("jedi_call_signatures", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = jedi_group,
  buffer = 0,
  callback = function()
    vim.b.show_call_signatures_last = { 0, 0, "" }
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = jedi_group,
  buffer = 0,
  callback = function()
    vim.fn["g:jedi#clear_call_signatures"]()
  end,
})

vim.keymap.set("i", "<C-space>", "<C-o>:call g:jedi#show_call_signatures()<cr>", { noremap = true })

-- -------------------
-- Plugin: vim-signify
vim.g.signify_vcs_list = { "svn" }


-- -------------------
-- Plugin: neoterm
vim.g.neoterm_default_mod = 'vertical'
vim.g.neoterm_automap_keys = "<F2>"
vim.keymap.set('n', '<F3>', function()
  local cmd = vim.fn.input("Command? ")
  vim.cmd("Tmap " .. cmd)
end, { expr = false })
vim.keymap.set('n', '<F4>', ':T <up>', { noremap = true })

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
  pattern = "term://*",
  command = "startinsert",
})

-- -------------------
-- fzf-vim
vim.env.FZF_DEFAULT_COMMAND = 'find * -type f | grep -v "\\.dll\\|\\.pyc"'

local fzf_group = vim.api.nvim_create_augroup("fzf_maps", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = fzf_group,
  pattern = "fzf",
  callback = function()
    local opts = { buffer = true, noremap = true }
    vim.keymap.set('n', '<esc>', 'a<c-c>', opts)
    vim.keymap.set('t', '<C-j>', '<down>', opts)
    vim.keymap.set('t', '<C-k>', '<up>', opts)
    vim.keymap.set('t', '<C-space>', '<enter>', opts)
  end,
})

vim.api.nvim_create_user_command('FLines', function()
  vim.fn['fzf#vim#grep'](
    'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude-dir="env" --exclude=tags --exclude=*.js --exclude=*.pyc --exclude=*.npy  --exclude=*.pickle --exclude=*.exe --exclude=*.dll --exclude=*.o --exclude=*.gitignore --exclude=generateSvtDocs_log.txt --exclude=*.zip --exclude=*.gz "^$"',
    0,
    { options = '--reverse --prompt "FLines> " --color hl:45,hl+:51 ' }
  )
end, { bang = true })

vim.api.nvim_create_user_command('FPyLines', function()
  vim.fn['fzf#vim#grep'](
    'grep -vnITr --color=always --exclude-dir=".git" --exclude-dir=".svn" --exclude-dir="env" --include=*.py --include=*.pyx --include=*.csv "^$"',
    0,
    { options = '--reverse --prompt "FPyLines> " --color hl:45,hl+:51 ' }
  )
end, { bang = true })

vim.keymap.set('n', '<leader>q',  ':Buffers<cr>',   { noremap = true })
vim.keymap.set('n', '<leader>w',  ':Files<cr>',     { noremap = true })
vim.keymap.set('n', '<leader>/',  ':BLines<cr>',    { noremap = true })
vim.keymap.set('n', '<leader>\\', ':Lines<cr>',     { noremap = true })
vim.keymap.set('n', '<leader>t',  ':BTags<cr>',     { noremap = true })
vim.keymap.set('n', '<leader>T',  ':Tags<cr>',      { noremap = true })
vim.keymap.set('n', '<leader>e',  ':FPyLines<cr>',  { noremap = true })
vim.keymap.set('n', '<leader>E',  ':FLines<cr>',    { noremap = true })

function Fzf_build_quickfix_list(lines)
    vim.fn.setqflist(lines)
    vim.cmd('cc')
    -- Have to wait for fzf to close for botright copen to work properly
    vim.fn.timer_start(50, 'QuickfixToggle') 
end

vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-q'] = Fzf_build_quickfix_list,
  ['ctrl-v'] = 'vsplit'
}

-- -------------------------
-- Plugin: vim-highlightedyank
vim.g.highlightedyank_highlight_duration = 250
vim.api.nvim_set_hl(0, "HighlightedyankRegion", {fg = "NONE", bg = 243,  reverse = true})



-- ----------------
-- MISC

-- Remove line ending whitespace on save
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      command = [[%s/\s\+$//e]],
    })
  end,
})

-- Better foldtext 
function _G.CustomFoldText()
  local fs = vim.v.foldstart
  while vim.fn.getline(fs):match("^%s*$") do
    local nnb = vim.fn.nextnonblank(fs + 1)
    if nnb == 0 or nnb > vim.v.foldend then break end
    fs = nnb
  end

  local line
  if fs > vim.v.foldend then
    line = vim.fn.getline(vim.v.foldstart)
  else
    line = vim.fn.getline(fs):gsub("\t", string.rep(" ", vim.bo.tabstop))
  end

  local w = vim.fn.winwidth(0) - vim.wo.foldcolumn - (vim.wo.number and 8 or 0)
  local foldSize = 1 + vim.v.foldend - vim.v.foldstart
  local foldSizeStr = " " .. foldSize .. " lines "
  local foldLevelStr = string.rep("+--", vim.v.foldlevel)
  local lineCount = vim.fn.line("$")
  local foldPercentage = string.format("[%4.1f", (foldSize * 1.0) / lineCount * 100) .. "%] "
  
  local currentWidth = vim.fn.strwidth(line .. foldSizeStr .. foldLevelStr .. foldPercentage)
  local expansionString = string.rep("—", math.max(0, w - currentWidth))
  
  return line .. expansionString .. foldSizeStr .. foldPercentage .. foldLevelStr
end

vim.opt.foldtext = "v:lua.CustomFoldText()"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
vim.opt.foldnestmax = 3

-- Latex things
vim.opt.grepprg = "grep -nH $*"
vim.g.tex_flavor = "latex"

-- always show the sign columns
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.py",
  callback = function()
    vim.opt_local.signcolumn = "yes"
  end,
})

-- ----------------
-- LAYOUTS
-- ----------------

-- nice "ide" layout
function _G.SetLayout01()
  vim.opt.colorcolumn = "80"
  vim.cmd([[silent normal! :vertical Tnew<cr>]])
  vim.cmd([[execute "normal! \<C-w>\<C-l>"]])
  vim.cmd([[vertical resize 80]])
  vim.cmd([[execute "normal! \<C-w>\<C-h>"]])
  vim.cmd([[vs]])
end
vim.api.nvim_create_user_command("SL1", _G.SetLayout01, {})

-- latexlayout
function _G.SetLayoutTex()
  vim.fn.setreg("m", "latexmk -pdf -pvc -interaction=nonstopmode -view=none\r")
  vim.opt.conceallevel = 0
  vim.cmd([[autocmd! BufWinEnter,WinEnter term://*]])
  vim.cmd([[bel Tnew]])
  vim.cmd([[execute "normal! \<C-w>\<C-j>"]])
  vim.cmd([[resize 15]])
  vim.cmd([[execute "normal! \"mp\<C-w>\<C-k>"]])
end
vim.api.nvim_create_user_command("SetLayoutTex", _G.SetLayoutTex, {})

-- Set the layouts based on filetypes
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*.tex",
  command = "SetLayoutTex",
})


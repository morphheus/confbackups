--
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


-------------------
-- GENERAL BINDINGS
-------------------
--
-- Settings
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
vim.keymap.set({ 'n', 'v', 's', 'o' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v', 's', 'o' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'v', 's', 'o' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v', 's', 'o' }, '<leader>Y', '"+Y')

-- Remap home/pagedown navigation
vim.keymap.set({ 'n', 'v', 's', 'o' }, 'H', 'g<HOME>')
vim.keymap.set({ 'n', 'v', 's', 'o' }, 'L', 'g<END>')
vim.keymap.set({ 'n', 'v', 's', 'o' }, 'J', '10j')
vim.keymap.set({ 'n', 'v', 's', 'o' }, 'K', '10k')

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


vim.cmd([[source ~/.config/nvim/oldinit.vim]])

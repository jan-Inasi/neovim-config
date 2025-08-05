local utils = require("utils.keymaps")

vim.g.mapleader = ' '

local lsp = vim.lsp.buf
local map = utils.map

local n = 'n'
local v = 'v'
local x = 'x'
local i = 'i'

map(n, '<leader>lf', lsp.format, 'format this file')

map(n, '<esc>', ':noh<CR>')

map(n, 'U', '<C-r>', 'undo undo')

map(n, 'K', lsp.hover, 'show hover info')
map(n, '<C-k>', lsp.signature_help, 'show signaure help')
map(n, '<leader>la', lsp.code_action, 'code actions')
map(n, '<leader>lr', lsp.rename, 'rename symbol')
map(n, '<leader>ld', vim.diagnostic.open_float, 'show diagnostics')
map(n, '<leader>ll', vim.diagnostic.setloclist, 'diagnostic locations')

-- g…
map(n, 'gk', '<C-w>k', 'go window up')
map(n, 'gj', '<C-w>j', 'go window down')
map(n, 'gh', '<C-w>h', 'go window left')
map(n, 'gl', '<C-w>l', 'go window right')
map('n', 'gH', utils.make_swap_with_direction('h'), 'Swap with left window')
map('n', 'gJ', utils.make_swap_with_direction('j'), 'Swap with bottom window')
map('n', 'gK', utils.make_swap_with_direction('k'), 'Swap with top window')
map('n', 'gL', utils.make_swap_with_direction('l'), 'Swap with right window')
map(n, 'gd', lsp.definition, 'go to definition')
map(n, 'gD', lsp.declaration, 'go to declaration')
map(n, 'gi', lsp.implementation, 'go to implementation')
map(n, 'gr', lsp.references, 'show references')
map(n, 'gt', lsp.type_definition, 'show references')
map(n, 'gw', utils.goto_next_warning, 'go to next warning')
map(n, 'gW', utils.goto_prev_warning, 'go to previous warning')
map(n, 'ge', utils.goto_next_error, 'go to next error')
map(n, 'gE', utils.goto_prev_error, 'go to previous error')

map(n, '<A-h>', ':bp<CR>', 'previous buffer')
map(n, '<A-l>', ':bn<CR>', 'pvevious buffer')

map(n, '<leader>v', '<C-v>', 'visual block mode')
map(n, '<leader>o', ':update<CR> :source<CR>', 'source this file')
-- map(n, '<leader>w', ':write<CR>', 'save this file')
map(n, '<leader>q', ':quit<CR>', 'quit')
map(n, '<leader>b', ':buffers<CR>', 'list buffers')

map(n, '<leader>w8', ':vertical resize 80<CR>', 'set width to 80 cols')
map(n, '<C-K>', utils.smart_resize_up)
map(n, '<C-J>', utils.smart_resize_down)
map(n, '<C-L>', utils.smart_resize_right)
map(n, '<C-H>', utils.smart_resize_left)



map(n, '<leader>c', 'i<C-r>=', 'insert from calculation')

map(i, '<A-c>', '<C-r>=', 'calculator')

map({ i, n, v, x }, '<A-z>', utils.toggle_wrap)

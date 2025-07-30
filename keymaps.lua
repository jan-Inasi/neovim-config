vim.g.mapleader = ' '

local function map(mode, keys, todo, desc)
	if desc == nil then
		vim.keymap.set(mode, keys, todo)
	else
		vim.keymap.set(mode, keys, todo, { desc = desc })
	end
end

local lsp = vim.lsp.buf

-- normal mode
local n = 'n'
local v = 'v'
local x = 'x'

local function goto_next_warning() vim.diagnostic.jump({ count = 1, severity = { max = 2 } }) end
local function goto_prev_warning() vim.diagnostic.jump({ count = -1, severity = { min = 2 } }) end
local function goto_next_error() vim.diagnostic.jump({ count = 1, severity = 1 }) end
local function goto_prev_error() vim.diagnostic.jump({ count = -1, severity = 1 }) end

map(n, '<leader>lf', lsp.format, 'format this file')

map(n, '<esc>', ':noh<CR>')

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
map(n, 'gd', lsp.definition, 'go to definition')
map(n, 'gD', lsp.declaration, 'go to declaration')
map(n, 'gi', lsp.implementation, 'go to implementation')
map(n, 'gr', lsp.references, 'show references')
map(n, 'gt', lsp.type_definition, 'show references')
map(n, 'gw', goto_next_warning, 'go to next warning')
map(n, 'gW', goto_prev_warning, 'go to previous warning')
map(n, 'ge', goto_next_error, 'go to next error')
map(n, 'gE', goto_prev_error, 'go to previous error')

map(n, '<A-h>', ':bp<CR>', 'previous buffer')
map(n, '<A-l>', ':bn<CR>', 'pvevious buffer')

map(n, '<leader>v', '<C-v>', 'visual block mode')
map(n, '<leader>o', ':update<CR> :source<CR>', 'source this file')
map(n, '<leader>w', ':write<CR>', 'save this file')
map(n, '<leader>q', ':quit<CR>', 'quit')
map(n, '<leader>b', ':buffers<CR>', 'list buffers')

-- map({'n', 'x', 'v'}, 'yy', 'y"+y')
-- map({'n', 'x', 'v'}, 'Y', '"+y')
-- map({'n', 'x', 'v'}, 'Y', '"+y')

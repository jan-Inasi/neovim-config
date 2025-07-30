vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.tabstop = 4
vim.o.swapfile = false

vim.o.winborder = "rounded"

require('keymaps')
require('lsp')

vim.pack.add({
	--		{src = "https://github.com/vague2k/vague.nvim"},
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
})
vim.cmd("colorscheme vim")
vim.cmd(":hi statusline guibg=NONE cterm=NONE")

require "mini.pick".setup()
require "oil".setup()


vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")


-- so > source he current file

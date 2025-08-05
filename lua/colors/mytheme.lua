local M = {}

local colors = {
	bg = "#FFFFFF",
	fg = "#2D0320",
}


function M.colorscheme()
	vim.cmd('highlight clear')
	vim.cmd('syntax reset')

	vim.o.background = 'dark'
	vim.g.colors_name = 'mytheme'

	local set = vim.api.nvim_set_hl

	set(0, "Normal", {bg = colors.bg, fg = colors.fg})
end

return M

local M = {}

M.map = function(mode, keys, todo, desc)
	if desc == nil then
		vim.keymap.set(mode, keys, todo)
	else
		vim.keymap.set(mode, keys, todo, { desc = desc })
	end
end

M.goto_next_warning = function()
	vim.diagnostic.jump({ count = 1, severity = { max = 2 } })
end

M.goto_prev_warning = function()
	vim.diagnostic.jump({ count = -1, severity = { min = 2 } })
end

M.goto_next_error = function()
	vim.diagnostic.jump({ count = 1, severity = 1 })
end

M.goto_prev_error = function()
	vim.diagnostic.jump({ count = -1, severity = 1 })
end

M.toggle_wrap = function()
	local wrap_or_no_wrap = not vim.o.wrap
	vim.o.wrap = wrap_or_no_wrap
	vim.o.linebreak = wrap_or_no_wrap
end

-- Check if current window is the rightmost
local function is_rightmost_window()
	local current_win = vim.api.nvim_get_current_win()
	local current_pos = vim.api.nvim_win_get_position(current_win)
	local current_width = vim.api.nvim_win_get_width(current_win)
	local current_right_edge = current_pos[2] + current_width

	-- Get all windows in current tabpage
	local windows = vim.api.nvim_tabpage_list_wins(0)

	for _, win in ipairs(windows) do
		if win ~= current_win then
			local pos = vim.api.nvim_win_get_position(win)
			local width = vim.api.nvim_win_get_width(win)
			local right_edge = pos[2] + width

			-- If any window extends further right, current is not rightmost
			if right_edge > current_right_edge then
				return false
			end
		end
	end
	return true
end

-- Check if current window is the bottommost
local function is_bottommost_window()
	local current_win = vim.api.nvim_get_current_win()
	local current_pos = vim.api.nvim_win_get_position(current_win)
	local current_height = vim.api.nvim_win_get_height(current_win)
	local current_bottom_edge = current_pos[1] + current_height

	-- Get all windows in current tabpage
	local windows = vim.api.nvim_tabpage_list_wins(0)

	for _, win in ipairs(windows) do
		if win ~= current_win then
			local pos = vim.api.nvim_win_get_position(win)
			local height = vim.api.nvim_win_get_height(win)
			local bottom_edge = pos[1] + height

			-- If any window extends further down, current is not bottommost
			if bottom_edge > current_bottom_edge then
				return false
			end
		end
	end
	return true
end

M.smart_resize_right = function()
	if is_rightmost_window() then
		vim.cmd('vertical resize -2')
	else
		vim.cmd('vertical resize +2')
	end
end

M.smart_resize_down = function()
	if is_bottommost_window() then
		vim.cmd('resize -2')
	else
		vim.cmd('resize +2')
	end
end


M.smart_resize_left = function()
	if is_rightmost_window() then
		vim.cmd('vertical resize +2')
	else
		vim.cmd('vertical resize -2')
	end
end

M.smart_resize_up = function()
	if is_bottommost_window() then
		vim.cmd('resize +2')
	else
		vim.cmd('resize -2')
	end
end

local function swap_with_direction(direction)
	local current_win = vim.api.nvim_get_current_win()
	local current_buf = vim.api.nvim_get_current_buf()

	-- Try to move in the specified direction
	vim.cmd('wincmd ' .. direction)
	local target_win = vim.api.nvim_get_current_win()

	-- If we actually moved to a different window
	if target_win ~= current_win then
		local target_buf = vim.api.nvim_get_current_buf()

		-- Swap the buffers
		vim.api.nvim_win_set_buf(current_win, target_buf)
		vim.api.nvim_win_set_buf(target_win, current_buf)

		-- Return to original window
		-- vim.api.nvim_set_current_win(current_win)
	else
		print("No window in that direction")
	end
end

M.make_swap_with_direction = function(direction)
	return function()
		swap_with_direction(direction)
	end
end

return M

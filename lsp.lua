vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})


if vim.fn.executable('lua-language-server') == 1 then
	require('lspconfig').lua_ls.setup {
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					version = 'LuaJIT'
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME
					}
				}
			})
		end,
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		}
	}
	vim.lsp.enable({ "lua_ls" })
else
	print("lua-language-server not found PATH")
end

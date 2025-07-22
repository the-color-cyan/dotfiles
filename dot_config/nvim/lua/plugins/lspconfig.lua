local function is_win()
	if vim.fn.has("win32") == 1 then
		return true
	else
		return false
	end
end

return {
	"neovim/nvim-lspconfig",
	require("lspconfig").nil_ls.setup({
		cmd = { "nil" },
	}),
	opts = {
		servers = {
			omnisharp = {
				mason = false,
				enabled = false,
			},
			nil_ls = {
				mason = false,
				enabled = not is_win(),
			},
		},
	},
}

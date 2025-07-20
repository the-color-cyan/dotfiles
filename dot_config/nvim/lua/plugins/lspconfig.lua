local function disable_if_win()
	if vim.fn.has("win32") == 1 then
		return false
	else
		return true
	end
end

return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			omnisharp = {
				mason = false,
				enabled = false,
			},
			nil_ls = {
				mason = disable_if_win(),
				enabled = disable_if_win(),
			},
		},
	},
}

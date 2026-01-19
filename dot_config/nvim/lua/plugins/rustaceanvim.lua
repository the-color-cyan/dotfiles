return {
	"mrcjkb/rustaceanvim",
	opts = function(_, opts)
		opts.server = vim.tbl_deep_extend("force", opts.server or {}, {
			on_attach = function(client, bufnr)
				-- Format on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})

				-- Enable inlay hints by default
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				-- Set up LSP keybindings
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
				vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto Definition" })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Goto References" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
			end,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy",
					},
					inlayHints = {
						enable = true,
					},
				},
			},
		})
		return opts
	end,
}

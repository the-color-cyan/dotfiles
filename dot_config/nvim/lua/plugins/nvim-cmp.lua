-- nvim-cmp config
-- https://github.com/hrsh7th/nvim-cmp
-- if true then
-- 	return {}
-- end

local cmp = require("cmp")

return {
	"hrsh7th/nvim-cmp",
	opts = function(_, opts)
		local mappings = vim.tbl_extend("force", opts.mapping or {}, {

			-- Shift+Enter closes menu and inserts new line
			["<S-CR>"] = function(fallback)
				if cmp.visible() then
					cmp.close()
				end
				fallback()
			end,

			-- Tab only handles snippet_forward and not ai_accept
			["<tab>"] = function(fallback)
				local luasnip = require("luasnip")
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end,

			-- Ctrl+Space for ai_accept
			["<C-Space>"] = function(fallback)
				return LazyVim.cmp.map({ "ai_accept" }, fallback)()
			end,

			-- Ctrl+; to open completions menu
			["<C-;>"] = cmp.mapping.complete(),
		})

		opts.mapping = mappings
		return opts
	end,
}

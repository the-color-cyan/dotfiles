-- nvim-cmp config
-- https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")

return {
	"hrsh7th/nvim-cmp",
	opts = function(_, opts)
		mapping = cmp.mapping.preset.insert({
			-- Shift+Enter closes menu and inserts new line
			["<S-CR>"] = function(fallback)
				if cmp.visible() then
					cmp.close()
				end
				fallback()
			end,

			-- Tab only handles snippet_forward and not ai_accept
			["<tab>"] = function(fallback)
				return LazyVim.cmp.map({ "snippet_forward" }, fallback)()
			end,
		})
  end
}

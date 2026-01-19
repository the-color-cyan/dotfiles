return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = {
		editor = {
			client = "neovim",
			tooltip = "i'm vimbing",
			icon = nil,
		},
		display = {
			theme = "default",
			flavor = "accent",
			swap_fields = false,
			swap_icons = false,
		},
	},
}

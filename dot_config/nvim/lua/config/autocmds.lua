-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- overwrite tab spacing for F# files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "fsharp",
	callback = function(args)
		vim.bo[args.buf].tabstop = 4
		vim.bo[args.buf].shiftwidth = 4
	end,
})

local f = require("config.functions")
Rustfmt_Cache = {}
-- rust file tabstop and shiftwidth formatting passed in by rustfmt
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function(args)
		local tab_spaces = f.get_rustfmt_config(args.file)

		vim.bo[args.buf].tabstop = tab_spaces
		vim.bo[args.buf].shiftwidth = tab_spaces
	end,
})

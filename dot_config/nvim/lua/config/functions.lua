local functions = {}

local function get_rustfmt_config(file_path)
	local rustfmt_cache = Rustfmt_Cache

	-- directory as cache key
	local dir = vim.fn.fnamemodify(file_path, ":p")

	-- check if local cache exists for directory - return cache if exists
	if rustfmt_cache[dir] then
		return rustfmt_cache[dir]
	end

	-- get output from rustfmt command
	local cmd = vim.fn.system({
		"rustfmt",
		"--print-config",
		"current",
		file_path,
	})

	-- check if shell returned errors
	if vim.v.shell_error == 0 then
		-- extract number of tab_spaces
		local tab_spaces = cmd:match("tab_spaces%s*=%s*(%d+)")

		if tab_spaces ~= nil then
			rustfmt_cache[dir] = tonumber(tab_spaces)
			Rustfmt_Cache[dir] = rustfmt_cache[dir]
			return rustfmt_cache[dir]
		end
	end

	return nil
end

functions.get_rustfmt_config = get_rustfmt_config

return functions

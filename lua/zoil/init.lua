local M = {}

M.config = {}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local zoxide_table = {}

function M.matchtest(obj)
	for line in vim.gsplit(obj.stdout, "\n", { trimempty = true }) do
		for score, path in string.gmatch(line, "(%d+%.%d)%s+([a-zA-Z0-9/%.]+)") do
			zoxide_table[score] = path
		end
	end
end

vim.system({ "zoxide", "query", "--list", "--score" }, { text = true }, M.matchtest)

return M

if vim.g.loaded_zoil then
	return
end
vim.g.loaded_zoil = true

vim.api.nvim_create_user_command("ZoilPing", function()
	vim.notify("zoil.nvim is loaded from " .. debug.getinfo(1, "S").source)
end, { desc = "Verify zoil.nvim is on the runtimepath" })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ appending plugins ]]
require("lazy").setup({
	require("plugins.sleuth"),
	require("plugins.gitsigns"),
	require("plugins.whichkey"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lspconfig"),
	require("plugins.conform"),
	require("plugins.nvimcmp"),
	require("plugins.tokyonight"),
	require("plugins.todocomments"),
	require("plugins.mininvim"),
	require("plugins.autopairs"),
	require("plugins.neo-tree"),
})

return function()
	-- See `:help cmp`
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	luasnip.config.setup({})

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },
		mappings = require("plugins.cmp.mappings"),
		sources = {
			{
				name = "lazydev",
				-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
				group_index = 0,
			},
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
		},
	})
end

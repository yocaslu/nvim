local builtin = require("functions").import("telescope.builtin")
if builtin then
	local themes = require("functions").import("telescope.themes")

	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	-- example of overriding default behavior and theme
	local ivy_theme_opts = themes.get_ivy({ previewer = false, border = false })
	local map_builtin = function(mode, keys, func, std_opts, desc, optional_opts)
		local opts = std_opts
		if optional_opts then
			opts = vim.tbl_extend("keep", optional_opts, std_opts)
		end

		vim.keymap.set(mode, keys, function()
			func(themes.get_ivy(opts))
		end, desc)
	end

	map_builtin("n", "<leader>sh", builtin.help_tags, ivy_theme_opts, { desc = "[s]earch [h]elp" })
	map_builtin("n", "<leader>sk", builtin.keymaps, ivy_theme_opts, { desc = "[s]earch [k]eymaps" })
	map_builtin("n", "<leader>sf", builtin.find_files, ivy_theme_opts, { desc = "[s]earch [f]iles" })
	map_builtin("n", "<leader>ss", builtin.builtin, ivy_theme_opts, { desc = "[s]earch [s]elect Telescope" })
	map_builtin("n", "<leader>sw", builtin.grep_string, ivy_theme_opts, { desc = "[s]earch current [w]ord" })
	map_builtin("n", "<leader>sg", builtin.live_grep, ivy_theme_opts, { desc = "[s]earch by [g]rep" })
	map_builtin("n", "<leader>sd", builtin.diagnostics, ivy_theme_opts, { desc = "[s]earch [d]iagnostics" })
	map_builtin("n", "<leader>sr", builtin.resume, ivy_theme_opts, { desc = "[s]earch [r]esume" })
	map_builtin("n", "<leader><leader>", builtin.buffers, ivy_theme_opts, { desc = "[ ] find existing buffers" })

	map_builtin(
		"n",
		"<leader>s.",
		builtin.oldfiles,
		ivy_theme_opts,
		{ desc = '[s]earch recent Files ("." for repeat)' }
	)

	map_builtin(
		"n",
		"<leader>/",
		builtin.current_buffer_fuzzy_find,
		ivy_theme_opts,
		{ desc = "[/] Fuzzily search in current buffer" }
	)

	-- It's also possible to pass additional configuration options.
	--  See `:help telescope.builtin.live_grep()` for information about particular keys
	map_builtin(
		"n",
		"<leader>s/",
		builtin.live_grep,
		ivy_theme_opts,
		{ desc = "[s]earch [/] in Open Files" },
		{ grep_open_files = true, prompt_title = "Live Grep in Open Files" }
	)

	-- Shortcut for searching your Neovim configuration files
	map_builtin(
		"n",
		"<leader>sn",
		builtin.find_files,
		ivy_theme_opts,
		{ desc = "[s]earch [n]eovim files" },
		{ cwd = vim.fn.stdpath("config") }
	)

	-- [[ Opens an new window with telescope to select the buffer ]]

	-- preset the theme
	local dropdown_window_opts = themes.get_dropdown({
		previewer = false,
		border = false,
	})

	vim.keymap.set("n", "<leader>wov", function()
		vim.cmd("vsplit")
		return builtin.find_files(dropdown_window_opts)
	end, { desc = "[w]indow [o]pen file [v]ertically" })

	vim.keymap.set("n", "<leader>woh", function()
		vim.cmd("split")
		builtin.find_files(dropdown_window_opts)
	end, { desc = "[w]indow [o]pen file [h]orizontally" })

	vim.keymap.set("n", "<leader>st", function()
		builtin.colorscheme(themes.get_dropdown())
	end)
end

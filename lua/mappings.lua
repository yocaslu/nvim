-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<CR>", { desc = "Enter explorer mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "save file" })

-- save file without auto-formatting
-- vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", { desc = "quit vim" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { desc = "delete without yanking" })

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll forward and centralize" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll backwards and centralize" })

-- Find and center
vim.keymap.set("n", "n", "nzzzv", { desc = "found foward & center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "found backwards & center" })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "increase window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "decrease window width" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "go to next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "go to previous buffer" })
vim.keymap.set("n", "<leader>bx", ":bdelete!<CR>", { desc = "delete buffer" }) -- close buffer
vim.keymap.set("n", "<leader>bc", "<cmd> enew <CR>", { desc = "create new buffer" }) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "split [w]indow [v]ertically" }) -- split window vertically
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "split [w]indow [h]orizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "split [w]indows [e]qual width & height" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wx", ":close<CR>", { desc = "[w]indow [c]lose" }) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-l>", ":wincmd k<CR>", { desc = "move to window left" })
vim.keymap.set("n", "<C-k>", ":wincmd j<CR>", { desc = "move to window below" })
vim.keymap.set("n", "<C-j>", ":wincmd h<CR>", { desc = "move to window above" })
vim.keymap.set("n", "<C-;>", ":wincmd l<CR>", { desc = "move to window right" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "go to previous tab" }) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>tlw", "<cmd>set wrap!<CR>", { desc = "toggle line wrapping" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

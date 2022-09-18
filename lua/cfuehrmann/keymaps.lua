-- local opts = { noremap = true, silent = true }
local opts = { noremap = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("n", "<leader>e", ":Lex 40<cr>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)

-- leap.nvim: Initiate multi-window mode with the current window as the only target:
keymap("n", "s", ":lua require('leap').leap { target_windows = { vim.fn.win_getid() }}<cr>", opts)

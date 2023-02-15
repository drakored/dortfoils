vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- When moving in chunks, bubble stuff around the moved items
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Cursor stays in the same spot when using "J" instead of moving to 
-- the end of the line
vim.keymap.set("n", "J", "mzJ`z")

-- Center the cursor on the screen when using page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Make search terms stay in the middle of the screen when using "n"
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When pasting 'foo' over 'bar' (with 'p'), keep 'foo' in your paste 
-- register instead of replacing it with 'bar'
vim.keymap.set("x", "<leader>p", [["_dP]])

-- (y)anking but with <leader> will put the yanked text into your system
-- clipboard (i.e. register ")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void register instead of saving if for later
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- "Don't ever press capital Q. Honestly, it's the worst place in the universe." -ThePrimeagen, 2022
vim.keymap.set("n", "Q", "<nop>")

-- Quickly setup a new tmux session
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format the document?
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation? 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace all words that match the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set the file to be executable (good for creating a new shell script)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

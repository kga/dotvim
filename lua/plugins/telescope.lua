require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
  },
})

local map = vim.keymap.set
map("n", "ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "fb", "<Cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "fm", "<Cmd>Telescope oldfiles<CR>", { desc = "Find MRU" })
map("n", "fg", "<Cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "fw", "<Cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })

require("fzf-lua").setup({
  winopts = {
    preview = { hidden = true },
  },
  files = {
    fd_opts = "--exclude node_modules --exclude .git --color=never --type f --hidden --follow",
  },
  grep = {
    rg_opts = "--glob='!node_modules' --glob='!.git' --hidden --column --line-number --no-heading --color=always",
  },
})

local map = vim.keymap.set
map("n", "ff", "<Cmd>FzfLua files<CR>",     { desc = "Find files" })
map("n", "fb", "<Cmd>FzfLua buffers<CR>",   { desc = "Find buffers" })
map("n", "fm", "<Cmd>FzfLua oldfiles<CR>",  { desc = "Find MRU" })
map("n", "fg", "<Cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
map("n", "fw", "<Cmd>FzfLua grep_cword<CR>",{ desc = "Grep word under cursor" })

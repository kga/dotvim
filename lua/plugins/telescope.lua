return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
      { "fb", "<Cmd>Telescope buffers<CR>", desc = "Find buffers" },
      { "fm", "<Cmd>Telescope oldfiles<CR>", desc = "Find MRU" },
      { "fg", "<Cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "fw", "<Cmd>Telescope grep_string<CR>", desc = "Grep word under cursor" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    },
  },
}

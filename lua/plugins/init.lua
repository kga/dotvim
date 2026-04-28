vim.pack.add({
  { src = "https://github.com/shaunsingh/nord.nvim" },
  { src = "https://github.com/filipjanevski/0x96f.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.telescope")

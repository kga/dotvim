vim.pack.add({
  { src = "https://github.com/shaunsingh/nord.nvim",          version = "80c1e5321505aeb22b7a9f23eb82f1e193c12470" },
  { src = "https://github.com/filipjanevski/0x96f.nvim",      version = "v0.2.1" },
  { src = "https://github.com/nvim-lua/plenary.nvim",         version = "v0.1.4" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons",   version = "4fc505ac7bd7692824a142e96e5f529c133862f8" },
  { src = "https://github.com/nvim-lualine/lualine.nvim",     version = "131a558e13f9f28b15cd235557150ccb23f89286" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = "v0.2.2" },
})

require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.telescope")

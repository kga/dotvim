return {
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "filipjanevski/0x96f.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("0x96f").setup()
      vim.cmd.colorscheme("0x96f")
    end,
  },
}

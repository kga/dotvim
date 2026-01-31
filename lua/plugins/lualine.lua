return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "nord",
      },
      sections = {
        -- デフォルトの diagnostics を除外（LSP 診断はコード上のサインで十分）
        lualine_b = { "branch", "diff" },
      },
      inactive_sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {},
      },
    },
  },
}

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
      { "fl", "<Cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "fw", "<Cmd>Telescope grep_string<CR>", desc = "Grep word under cursor" },
      { "fg", function()
          -- ghq list を使ったカスタムピッカー
          local pickers = require("telescope.pickers")
          local finders = require("telescope.finders")
          local conf = require("telescope.config").values
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          pickers.new({}, {
            prompt_title = "ghq repositories",
            finder = finders.new_oneshot_job({ "ghq", "list", "--full-path" }, {}),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, _)
              actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                  vim.cmd("cd " .. selection[1])
                  require("telescope.builtin").find_files()
                end
              end)
              return true
            end,
          }):find()
        end,
        desc = "Find ghq repos",
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    },
  },
}

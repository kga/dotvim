return {
  {
    "junegunn/vim-easy-align",
    keys = {
      { "<Enter>", "<Plug>(EasyAlign)", mode = "v", desc = "Easy Align" },
    },
  },
  {
    "thinca/vim-quickrun",
    dependencies = { "tyru/current-func-info.vim" },
    config = function()
      vim.g.quickrun_config = {
        ["prove/carton"] = {
          exec = "carton exec -- %c %o -v %s",
          command = "prove",
        },
        ["prove/carton/contextual"] = {
          exec = "TEST_METHOD=%a carton exec -- %c %o -v %s",
          command = "prove",
        },
      }

      vim.cmd([[
        command! Prove call s:prove()
        function! s:prove()
          let func_name = cfi#format('%s', '')
          if func_name == ''
            QuickRun prove/carton
          else
            execute 'QuickRun prove/carton/contextual -args ' . func_name
          endif
        endfunction
      ]])

      vim.keymap.set("n", "<Leader>p", "<Cmd>Prove<CR>", { silent = true })
    end,
  },
  {
    "majutsushi/tagbar",
  },
  {
    "tyru/current-func-info.vim",
    lazy = true,
  },
}

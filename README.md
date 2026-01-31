# dotvim

Neovim 専用 Lua 設定

## セットアップ

```sh
# シンボリックリンクを作成
ln -sf ~/ghq/github.com/kga/dotvim ~/.config/nvim

# Neovim を起動すると lazy.nvim が自動でプラグインをインストールする
nvim
```

## 構成

```
init.lua                エントリポイント
lua/
  options.lua           vim.opt 設定
  keymaps.lua           キーマッピング
  autocmds.lua          autocmd
  plugins/
    init.lua            lazy.nvim ブートストラップ + easy-align
    colorscheme.lua     nord.nvim
    lualine.lua         ステータスライン
    telescope.lua       ファジーファインダー (ff/fb/fm/fg)
    nvim-tree.lua       ファイルツリー
    lsp.lua             nvim-lspconfig + mason.nvim
    cmp.lua             nvim-cmp
    git.lua             vim-fugitive
```

## LSP サーバー

`:Mason` で管理。自動インストール対象:

- `gopls` (Go)
- `ts_ls` (TypeScript)

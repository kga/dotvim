local map = vim.keymap.set

-- j/k で表示行移動
map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

-- コマンドライン Emacs 風キーバインド
map("c", "<C-a>", "<Home>")
map("c", "<C-f>", "<Right>")
map("c", "<C-b>", "<Left>")
map("c", "<C-d>", "<Delete>")
map("c", "<Esc>b", "<S-Left>")
map("c", "<Esc>f", "<S-Right>")

-- ハイライト消去
map("n", "<Space>/", "<Cmd>nohlsearch<CR>", { silent = true })

-- 0 で行頭トグル
map("n", "0", function()
  return vim.fn.col(".") == 1 and "^" or "0"
end, { expr = true })

-- Tab 操作 (t prefix)
map("n", "t", "<Nop>")

for n = 1, 9 do
  map("n", "t" .. n, "<Cmd>tabnext " .. n .. "<CR>", { silent = true })
end

map("n", "tc", "<Cmd>tablast | tabnew<CR>", { silent = true })
map("n", "td", "<Cmd>tabclose<CR>", { silent = true })
map("n", "tn", "<Cmd>tabnext<CR>", { silent = true })
map("n", "tp", "<Cmd>tabprevious<CR>", { silent = true })

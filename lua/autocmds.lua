-- filetype 検出
vim.filetype.add({
  filename = {
    ["cpanfile"] = "perl",
    ["Capfile"] = "ruby",
  },
  extension = {
    psgi = "perl",
    t = "perl",
    tt2 = "tt2html",
    nginx = "nginx",
  },
  pattern = {
    [".*%.nginx%.conf"] = "nginx",
    [".*/nginx/.*%.conf"] = "nginx",
    [".*/templates/.*%.html"] = "tt2html",
    [".*%.sql"] = "mysql",
  },
})

-- grep 後に quickfix を自動で開く
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "*grep*",
  command = "cwindow",
})

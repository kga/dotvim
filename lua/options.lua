local opt = vim.opt

opt.backup = false
opt.directory = vim.fn.stdpath("config") .. "/swp"
opt.number = false

opt.list = true
opt.listchars = { tab = "> ", trail = "-" }
opt.scrolloff = 10
opt.display = "lastline"
opt.foldenable = true
opt.foldmethod = "marker"

opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log"

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.wildmode = { "list:longest", "full" }

opt.modelines = 0
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.incsearch = false

opt.showmatch = true
opt.matchpairs:append("<:>")

opt.ambiwidth = "double"
opt.hidden = true

opt.showtabline = 2

opt.completeopt = { "menu", "menuone", "noselect" }

opt.fileencodings = { "utf-8", "iso-2022-jp", "euc-jp", "cp932", "ucs-bom", "utf-16", "utf-16le" }

opt.termguicolors = true

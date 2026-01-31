local opt = vim.opt

opt.backup = false
opt.directory = vim.fn.stdpath("config") .. "/swp"
opt.ruler = true
opt.number = false

opt.backspace = { "indent", "eol", "start" }

opt.list = true
opt.listchars = { tab = "> ", trail = "-" }
opt.scrolloff = 10
opt.display = "lastline"
opt.foldenable = true
opt.foldmethod = "marker"

opt.suffixes = ".bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc"

opt.smarttab = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.wildmode = { "list:longest", "full" }
opt.wildmenu = true

opt.modelines = 0
opt.autoindent = true
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.hlsearch = true
opt.incsearch = false

opt.showcmd = true
opt.showmatch = true
opt.matchpairs:append("<:>")

opt.laststatus = 2
opt.ambiwidth = "double"
opt.hidden = true

opt.showtabline = 2

opt.completeopt = { "menu", "menuone", "noselect" }

opt.encoding = "utf-8"
opt.fileencodings = { "utf-8", "iso-2022-jp", "euc-jp", "cp932", "ucs-bom", "utf-16", "utf-16le" }

opt.termguicolors = true

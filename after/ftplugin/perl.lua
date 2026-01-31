vim.opt_local.path:prepend("lib")
vim.opt_local.path:prepend("extlib")
vim.opt_local.path:prepend("t/lib")
vim.opt_local.path:prepend("modules/*/lib")
vim.opt_local.path:prepend("modules/*/t/lib")
vim.opt_local.path:prepend("../../modules/*/lib")
vim.opt_local.path:prepend("local/lib/perl5")
vim.opt_local.path:prepend("local/lib/perl5/darwin-2level")

vim.opt_local.includeexpr = [[substitute(substitute(v:fname,'^.\{-}\([A-Za-z0-9_:]\+\)[^A-Za-z0-9_:]*$','\1.pm',''),'::','/','g')]]
vim.opt_local.suffixesadd:prepend(".pm")

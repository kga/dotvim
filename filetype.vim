" perl
autocmd BufNewFile,BufRead,BufEnter cpanfile,*.psgi,*/t/*.t setfiletype perl
autocmd BufNewFile,BufRead *.tt2\= setfiletype tt2html

" nginx
autocmd BufNewFile,BufRead */nginx/*.conf,*.nginx.conf setfiletype nginx

" tt2
" setfiletype だとすでに filetype が決定済みの時は実行されない
autocmd BufNewFile,BufRead */templates/*.html set filetype=tt2html

" ftplugin/iop.vim
setlocal completefunc=iopcomplete#CompleteIOP

set cindent
set tabstop=4
set shiftwidth=4
set expandtab

:let maplocalleader = "\\"
:inoremap { {<CR><CR>};<up><tab>
:inoremap ( ()<left>
:inoremap " ""<left>
:inoremap ; ;<CR><CR>
:inoremap # /* {{{  */ <CR><CR><CR><CR>/* }}} */<CR><up><up><up><up><up><right><right><right><right><right><right><right>
:inoremap <localleader>c class <name> : 25xxx : <parent_class> {<CR><tab><CR>};<CR><up><up><up><right><right><right><right><right><right>
:inoremap <localleader>i interface  {<CR><CR>};<CR><up><up><tab><up><right><right><right><right><right><right>
:inoremap <localleader>e enum  {<CR><tab><CR>};<CR><up><up><tab><up><right>
:inoremap <localleader>s struct  {<CR><CR>};<CR><up><up><tab><up><right><right><right>
:inoremap <localleader>* /** */<left><left>


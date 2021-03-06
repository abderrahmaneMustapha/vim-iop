" ftplugin/iop.vim
setlocal completefunc=iopcomplete#CompleteIOP

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

:let maplocalleader = "\\"
:inoremap { {<CR><tab><CR><bs><bs><bs><bs>}<up><tab>
:inoremap ( ()<left>
:inoremap " ""<left>
:inoremap ; ;<CR><CR>
:inoremap # /* {{{  */ <CR><CR><CR><CR>/* }}} */<CR><up><up><up><up><up><right><right><right><right><right><right><right>
:inoremap <localleader>c class  :  :  {<CR><tab><CR><left><left><left><left>};<CR><up><up><up><right><right><right><right><right><right>
:inoremap <localleader>i interface  {<CR><CR>};<CR><up><up><tab><up><right><right><right><right><right><right>
:inoremap <localleader>e enum  {<CR><CR>};<CR><up><up><tab><up><right>
:inoremap <localleader>s struct  {<CR><CR>};<CR><up><up><tab><up><right><right><right>
:inoremap <localleader>* /** */<left><left>


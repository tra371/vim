set number
set relativenumber

filetype plugin indent on
syntax on
augroup LightweightTSXSyntax
    autocmd!
    autocmd FileType typescript,javascriptreact,typescriptreact setlocal syntax=javascript
augroup END
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

set backspace=indent,eol,start


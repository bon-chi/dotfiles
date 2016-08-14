" TODO: I don't know why ftplugin isn't loaded automatically
:source ~/.vim/plugged/rust.vim/ftplugin/rust.vim
" let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" setting of racer
set hidden
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH="/usr/local/src/rust/src"

setlocal tags=./rusty-tags.vi;/
" TODO: disable when there is no Cargo.toml
autocmd BufWrite *.rs :silent exec "!rusty-tags vi --start-dir=" . expand('%:p:h') . "&" | redraw!

" setting of lexima not to complete lifetime
call lexima#add_rule({'char': "'", 'input_after': "", 'filetype': 'rust'})

" TODO move to vimrc
""""setting for lexima.vim""""""""""""""""""""""""""""""""""""""""""""""""
call lexima#add_rule({'char': '<C-h>', 'at': '(\%#)', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '(\%#)', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '{\%#}', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '\[\%#\]', 'delete': 1})

call lexima#add_rule({'char': '<C-h>', 'at': '"\%#"', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '"""\%#"""""""', 'input': '<C-h><C-h><C-h>', 'delete': 3})
call lexima#add_rule({'char': '<C-h>', 'at': "'''\\%#'''''''", 'input': '<C-h><C-h><C-h>', 'delete': 3})
call lexima#add_rule({'char': '<C-h>', 'at': '`\%#`', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '```\%#```````', 'input': '<C-h><C-h><C-h>', 'delete': 3})

call lexima#add_rule({'char': '<C-h>', 'at': '( \%# )', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '{ \%# }', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '\[ \%# ]', 'delete': 1})
call lexima#add_rule({'char': '<C-h>', 'at': '"\%#"', 'delete': 1})

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" alias to run rustc
nnoremap <silent><F10>  :RustRun input<CR>
nnoremap <silent><F9>  :RustRun<CR>
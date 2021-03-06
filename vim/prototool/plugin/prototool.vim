function! PrototoolFormatEnable() abort
    silent! let g:prototool_format_enable = 1
    silent! let g:prototool_format_no_rewrite_flag = ''
endfunction

function! PrototoolFormatDisable() abort
    silent! unlet g:prototool_format_enable
    silent! let g:prototool_format_no_rewrite_flag = ''
endfunction

function! PrototoolFormatNoRewriteEnable() abort
    silent! let g:prototool_format_enable = 1
    silent! let g:prototool_format_no_rewrite_flag = '--no-rewrite '
endfunction

function! PrototoolFormatToggle() abort
    if exists('g:prototool_format_enable')
        call PrototoolFormatDisable()
        execute 'echo "prototool format DISABLED"'
    else
        call PrototoolFormatEnable()
        execute 'echo "prototool format ENABLED"'
    endif
endfunction

function! PrototoolFormatNoRewriteToggle() abort
    if exists('g:prototool_format_enable')
        call PrototoolFormatDisable()
        execute 'echo "prototool format DISABLED"'
    else
        call PrototoolFormatNoRewriteEnable()
        execute 'echo "prototool format --no-rewrite ENABLED"'
    endif
endfunction

function! PrototoolFormat() abort
    if exists('g:prototool_format_enable')
        silent! execute '!prototool format ' . g:prototool_format_no_rewrite_flag . '-w %'
        silent! edit
    endif
endfunction

function! PrototoolCreateEnable() abort
    silent! let g:prototool_create_enable = 1
endfunction

function! PrototoolCreateDisable() abort
    silent! unlet g:prototool_create_enable
endfunction

function! PrototoolCreateToggle() abort
    if exists('g:prototool_create_enable')
        call PrototoolCreateDisable()
        execute 'echo "prototool create DISABLED"'
    else
        call PrototoolCreateEnable()
        execute 'echo "prototool create ENABLED"'
    endif
endfunction

function! PrototoolCreate() abort
    if exists('g:prototool_create_enable')
        silent! execute '!prototool create %'
        silent! edit
    endif
endfunction

" default functionality below

call PrototoolFormatDisable()
call PrototoolCreateEnable()

autocmd BufEnter,BufWritePost *.proto :call PrototoolFormat()
autocmd BufNewFile *.proto :call PrototoolCreate()

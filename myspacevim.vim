function! myspacevim#before() abort
  au BufRead,BufNewFile *.R setlocal textwidth=80
  au BufRead,BufNewFile *.r setlocal textwidth=80
let g:neomake_enabled_c_makers = ['clang']
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'r': ['styler']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
nnoremap jk <Esc>
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>
let g:JuliaFormatter_options = {
        \ 'indent'                    : 2,
        \ 'margin'                    : 80,
        \ 'always_for_in'             : v:true,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ 'remove_extra_newlines'     : v:true,
        \ 'always_use_return'         : v:true,
        \ 'whitespace_in_kwargs'      : v:true,
        \ 'annotate_untyped_fields_with_any' : v:true,
        \ 'format_docstrings'         : v:true
        \ }
"other configs
let g:github_dashboard = { 'username': 'fernal73', 'password': $GITHUB_TOKEN }
let g:gista#client#default_username = 'monkeyxite'
endfunction

function! myspacevim#after() abort
iunmap jk
endfunction

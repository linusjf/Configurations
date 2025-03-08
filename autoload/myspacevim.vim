" Author        : Linus Fernandes
" Created       : 04/03/2024
" License       : MIT
" Description   :

function! myspacevim#before() abort
  au BufRead,BufNewFile *.R setlocal textwidth=80
  au BufRead,BufNewFile *.r setlocal textwidth=80
  au BufRead,BufNewFile *.jl setlocal textwidth=80
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
let g:neomake_enabled_c_makers = ['clang']
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'r': ['styler']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
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
let g:github_dashboard = {}

" Dashboard window position
" - Options: tab, top, bottom, above, below, left, right
" - Default: tab
let g:github_dashboard['position'] = 'top'

" Disable Emoji output
" - Default: only enable on terminal Vim on Mac
let g:github_dashboard['emoji'] = 0

" Customize emoji (see http://www.emoji-cheat-sheet.com/)
let g:github_dashboard['emoji_map'] = {
\   'user_dashboard': 'blush',
\   'user_activity':  'smile',
\   'repo_activity':  'laughing',
\   'ForkEvent':      'fork_and_knife'
\ }

" Command to open link URLs
" - Default: auto-detect
let g:github_dashboard['open_command'] = 'open'

" API timeout in seconds
" - Default: 10, 20
let g:github_dashboard['api_open_timeout'] = 10
let g:github_dashboard['api_read_timeout'] = 20

" Do not set statusline
" - Then you can customize your own statusline with github_dashboard#status()
let g:github_dashboard['statusline'] = 0

let g:github_dashboard['username'] = 'linusjf'
let g:github_dashboard['password'] = $GITHUB_TOKEN
let g:gista#client#default_username = 'monkeyxite'
let g:tmpl_auto_initialize = 1
let g:tmpl_search_paths = ['~/templates']
let g:tmpl_author_email = 'linusfernandes at gmail dot com'
let g:tmpl_author_name = 'Linus Fernandes'
let g:tmpl_project = 'Github Learning Repos'
let g:tmpl_company = 'Linus Fernandes'
let g:tmpl_copyright = 'Copyright (c) g:tmpl_company, all rights reserved.'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_debug = 3  " Enable debugging if needed

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_auto_extension_ext = 'md'
let g:vmt_auto_update_on_save = 1
let g:vmt_dont_insert_fence = 0
let g:vmt_cycle_list_item_markers = 1
let g:shfmt_extra_args = '-i 2'
let g:shfmt_fmt_on_save = 1
" Highlight objects like .foo (default: 0)
let g:jq_highlight_objects = 1

" Highlight all function calls (default: 0)
" This will highlight all words directly followed by an opening parenthesis
let g:jq_highlight_function_calls = 1
let g:jqplay = {
      \ 'exe': 'jq',
      \ 'opts': '-e -S .',
      \ 'autocmds': ['TextChanged','TextChangedI','InsertLeave']
      \}
let g:neoformat_python_black = {
    \ 'exe': 'black',
    \ 'stdin': 1,
    \ 'args': ['-q', '-'],
    \ }
let g:neoformat_enabled_python = ['black']

let g:NERDTreeHijackNetrw=0

iabbrev <buffer> --- <c-k>-M
" Show column numbers
set ruler
set rulerformat=%l,%v
endfunction

function! myspacevim#after() abort
" iunmap jk
let g:neomake_javascript_eslint_maker =  {
        \ 'exe': 'npx',
        \ 'args': ['--quiet', 'eslint', '--format=compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
        \ 'cwd': '%:p:h',
        \ 'output_stream': 'stdout',
        \ }

  let g:neomake_javascript_jsx_enabled_makers = ['eslint']

  let g:neoformat_enabled_javascript = ['npxprettier']
  au FileType markdown setlocal wrap
endfunction

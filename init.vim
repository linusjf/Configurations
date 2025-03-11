" Author        : Linus Fernandes
" Created       : 11/03/2025
" License       : MIT
" Description   :
" Set SpaceVim options
let g:spacevim_colorscheme = 'gruvbox'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_enable_guicolors = v:true
let g:spacevim_statusline_separator = 'arrow'
let g:spacevim_statusline_inactive_separator = 'bar'
let g:spacevim_buffer_index_type = 4
let g:spacevim_enable_tabline_filetype_icon = v:true
let g:spacevim_enable_statusline_mode = v:true
let g:spacevim_enable_vimfiler_welcome = v:false
let g:spacevim_statusline_left_sections = ['winnr', 'major mode', 'filename', 'fileformat', 'minor mode lighters', 'version control info', 'search status']
let g:spacevim_statusline_right_sections = ['cursorpos', 'percentage', 'input method', 'date', 'time']
let g:spacevim_lint_engine = 'ale'
let g:spacevim_bootstrap_before = 'myspacevim#before'
let g:spacevim_bootstrap_after = 'myspacevim#after'
let g:spacevim_vimcompatible = v:true
let g:spacevim_filetree_direction = 'left'

" Load SpaceVim layers
call SpaceVim#layers#load('default')
call SpaceVim#layers#load('autocomplete', {
      \ 'auto_completion_tab_key_behavior': 'cycle',
      \ 'auto_completion_delay': 200,
      \ 'auto_completion_complete_with_key_sequence': 'nil',
      \ 'auto_completion_complete_with_key_sequence_delay': 0.1,
      \ 'auto-completion-return-key-behavior': 'complete'
      \ })
call SpaceVim#layers#load('shell', {
      \ 'default_position': 'bottom',
      \ 'default_height': 30
      \ })
call SpaceVim#layers#load('core#banner')
call SpaceVim#layers#load('core#statusline')
call SpaceVim#layers#load('core#tabline')
call SpaceVim#layers#load('checkers', {
      \ 'lint_on_the_fly': v:true,
      \ 'lint_on_save': v:true,
      \ 'lint_exclude_filetype': [],
      \ 'open_error_list': 2,
      \ 'show_cursor_error': v:true
      \ })
call SpaceVim#layers#load('format', {
      \ 'format_method': 'codefmt',
      \ 'format_on_save': v:true,
      \ 'silent_format': v:true
      \ })
call SpaceVim#layers#load('edit', {
      \ 'autosave_timeout': 2000,
      \ 'autosave_events': [],
      \ 'autosave_all_buffers': v:true
      \ })
call SpaceVim#layers#load('ui', {
      \ 'enable_sidebar': v:true,
      \ 'enable_scrollbar': v:false,
      \ 'enable_indentline': v:true,
      \ 'enable_cursorword': v:false,
      \ 'indentline_char': '|',
      \ 'conceallevel': 0,
      \ 'concealcursor': '',
      \ 'cursorword_delay': 50,
      \ 'cursorword_exclude_filetype': [],
      \ 'indentline_exclude_filetype': []
      \ })
call SpaceVim#layers#load('colorscheme', {
      \ 'colorscheme': 'gruvbox',
      \ 'colorscheme_bg': 'dark',
      \ 'random_theme': v:false
      \ })
call SpaceVim#layers#load('debug', {
      \ 'debugger_plugin': 'vim-vebugger'
      \ })
call SpaceVim#layers#load('foldsearch', {
      \ 'foldsearch_highlight': v:true
      \ })
call SpaceVim#layers#load('lang#cmake')
call SpaceVim#layers#load('lang#lua')
call SpaceVim#layers#load('lang#java', {
      \ 'format_on_save': v:true,
      \ 'java_formatter_jar': '~/javaformatter/google-java-format.jar',
      \ 'java_file_head': [
      \   '/**',
      \   ' * @author : `fnamemodify(expand("~"), ":t")`',
      \   ' * @created : `strftime("%Y-%m-%d")`',
      \   '**/',
      \   ''
      \   ]
      \ })
"call SpaceVim#layers#load('lang#markdown', {
"      \ 'listItemIndent': '1',
"     \ 'enableWcwidth': v:true,
"     \ 'listItemChar': '*',
"     \ 'enabled_formater': ['remark', 'prettier']
""    \ })
call SpaceVim#layers#load('lang#php')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('lang#sh', {
      \ 'bash_file_head': []
      \ })
call SpaceVim#layers#load('lang#jsonnet')
call SpaceVim#layers#load('lsp', {
      \ 'enabled_clients': ['intelephense', 'pyright', 'rust_analyzer']
      \ })
call SpaceVim#layers#load('lang#python', {
      \ 'python_file_head': [],
      \ 'enable_typeinfo': v:true,
      \ 'format_on_save': v:true,
      \ 'enabled_linters': ['python', 'pylint'],
      \ 'enabled_clients': ['pyright']
      \ })
"call SpaceVim#layers#load('lang#javascript', {
 "      \ 'auto_fix': v:true,
  "     \ 'enable_flow_syntax': v:false,
   "    \ 'format_on_save': v:true,
    "   \ 'enable_tern': v:false
     "  \ })
call SpaceVim#layers#load('lang#perl')
call SpaceVim#layers#load('lang#ruby')

call SpaceVim#layers#load('shell')

" this call function MUST STAY BELOW
" Otherwise, it will get overwritten by `call SpaceVim#layers#load('shell')`
call SpaceVim#layers#load('shell',
    \ {
    \  'default_position' : 'bottom',
    \  'default_height' : 100,
    \ }
    \ )

call SpaceVim#layers#load('games')

" Load SpaceVim layers
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('lang#r')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('github')
call SpaceVim#layers#load('lang#latex')
call SpaceVim#layers#load('sudo')
call SpaceVim#layers#load('test')
call SpaceVim#layers#load('tools')
call SpaceVim#layers#load('VersionControl')
call SpaceVim#layers#load('ssh')
call SpaceVim#layers#load('lang#assembly')
call SpaceVim#layers#load('lang#csharp')
call SpaceVim#layers#load('lang#toml')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('lang#julia')
call SpaceVim#layers#load('lang#sql')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#xquery')
call SpaceVim#layers#load('lang#groovy')
call SpaceVim#layers#load('lang#json')
call SpaceVim#layers#load('lang#d')
call SpaceVim#layers#load('lang#graphql')
call SpaceVim#layers#load('lang#WebAssembly')
call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('nvim-treesitter')

" Set options for specific layers
let g:spacevim_layer_lang_c = {
      \ 'clang_executable': 'clang',
      \ 'enable_clang_syntax_highlight': 1,
      \ 'clang_std': {
      \   'c': 'c17',
      \   'cpp': 'c++20'
      \   }
      \ }

let g:spacevim_layer_lang_r = {
      \ 'repl_command': 'R --no-save'
      \ }

let g:spacevim_layer_lang_csharp = {
      \ 'highlight_types': 0
      \ }

let g:spacevim_layer_lang_rust = {
      \ 'recommended_style': 1,
      \ 'format_on_save': 1
      \ }

let g:spacevim_layer_lang_json = {
      \ 'conceal': 0,
      \ 'concealcursor': ''
      \ }

let custom_repos = [
  \ {'repo': 'MaxMEllon/vim-jsx-pretty', 'merged': 0},
  \ {'repo': 'vim-scripts/dbext.vim', 'merged': 0},
  \ {'repo': 'lilydjwg/colorizer', 'merged': 0},
  \ {'repo': 'nono/jquery.vim', 'merged': 0},
  \ {'repo': 'tibabit/vim-templates', 'merged': 0},
  \ {'repo': 'farmergreg/vim-lastplace', 'merged': 0},
  \ {'repo': 'tpope/vim-surround', 'merged': 0},
  \ {'repo': 'pangloss/vim-javascript', 'merged': 0},
  \ {'repo': 'elzr/vim-json', 'merged': 0},
  \ {'repo': 'bfrg/vim-jq', 'merged': 0},
  \ {'repo': 'XadillaX/json-formatter.vim', 'merged': 0},
  \ {'repo': 'z0mbix/vim-shfmt', 'merged': 0},
  \ {'repo': 'mhinz/vim-signify', 'merged': 0},
  \ {'repo': 'mhartington/oceanic-next', 'merged': 0},
  \ {'repo': 'godlygeek/tabular', 'merged': 0},
  \ {'repo': 'preservim/vim-markdown', 'merged': 0},
  \ {'repo': 'pangloss/vim-javascript', 'merged': 0},
\ ]

for custom_repo in custom_repos
  call add(g:spacevim_custom_plugins, [custom_repo.repo, custom_repo])
endfor

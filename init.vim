" Author        : Linus Fernandes
" Created       : 11/03/2025
" License       : MIT
" Description   :
" Set SpaceVim options
let g:spacevim_colorscheme = 'gruvbox'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_enable_guicolors = v:false
let g:spacevim_enable_cursorline = v:true
let g:spacevim_enable_mouse = v:false
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
let g:spacevim_logging_level = 'info'
let g:spacevim_logging_file = "~/.SpaceVim/spacevim.log"

" Load SpaceVim layers
call SpaceVim#layers#load('default')
call SpaceVim#layers#load('autocomplete', {
      \ 'auto_completion_tab_key_behavior': 'cycle',
      \ 'auto_completion_delay': 200,
      \ 'auto_completion_complete_with_key_sequence': 'nil',
      \ 'auto_completion_complete_with_key_sequence_delay': 0.1,
      \ 'auto_completion_return_key_behavior': 'complete',
      \ 'autocomplete_method': 'coc',
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
      \ 'lint_exclude_filetype': ['python'],
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
"call SpaceVim#layers#load('lang#markdown')
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
      \ 'format_on_save': v:false,
      \ 'lint_on_save': v:false,
      \ 'enabled_linters': ['python', 'pylint'],
      \ 'enabled_clients': ['pyright'],
      \ 'enable_runner': v:true,
      \ 'repl_command': 'ipython'
      \ })
"call SpaceVim#layers#load('lang#javascript')
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
" call SpaceVim#layers#load('lang#typescript')
call SpaceVim#layers#load('nvim-treesitter')

" Set options for specific layers
let g:spacevim_layer_lang_javascript = {
  \ 'auto_fix': v:true,
  \ 'enable_flow_syntax': v:false,
  \ 'format_on_save': v:true,
  \ }
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

" # Custom plugins in Spacevim start
let g:spacevim_custom_plugins = [
      \ ['MaxMEllon/vim-jsx-pretty'],
\ ['vim-scripts/dbext.vim'],
\ ['lilydjwg/colorizer'],
\ ['nono/jquery.vim'],
\ ['tibabit/vim-templates'],
\ ['farmergreg/vim-lastplace'],
\ ['tpope/vim-surround'],
\ ['elzr/vim-json'],
\ ['bfrg/vim-jq'],
\ ['XadillaX/json-formatter.vim'],
\ ['z0mbix/vim-shfmt'],
\ ['mhinz/vim-signify'],
\ ['mhartington/oceanic-next'],
\ ['aliou/bats.vim'],
\ ['junegunn/fzf.vim'],
\ ['preservim/vim-markdown'],
\ ]
"" \ ['preservim/vim-markdown'],
"" ['pangloss/vim-javascript'],*/
" # Custom plugins in Spacevim end

function! s:SetupMarkdown()
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_folding_style_pythonic = 1
  let g:vim_markdown_override_foldtext = 0
  let g:vim_markdown_folding_level = 6
  let g:vim_markdown_no_default_key_mappings = 1
  let g:vim_markdown_toc_autofit = 1
  let g:vim_markdown_emphasis_multiline = 0
  let g:vim_markdown_conceal = 0
  let g:tex_conceal = ""
  let g:vim_markdown_math = 1
  let g:vim_markdown_conceal_code_blocks = 0
  let g:vim_markdown_follow_anchor = 1
  let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
  let g:vim_markdown_math = 1
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_toml_frontmatter = 1
  let g:vim_markdown_json_frontmatter = 1
  let g:vim_markdown_strikethrough = 1
  let g:vim_markdown_new_list_item_indent = 2
  let g:vim_markdown_no_extensions_in_markdown = 1
  let g:vim_markdown_autowrite = 1
  let g:vim_markdown_auto_extension_ext = 'md'
  let g:vim_markdown_auto_insert_bullets = 0
  let g:vim_markdown_borderless_table = 1
  let g:vim_markdown_edit_url_in = 'current'
endfunction

call s:SetupMarkdown()

function! s:SetupJavaScript()
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_ngdoc = 1
  let g:javascript_plugin_flow = 1

  augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
  augroup END

  set foldlevel=99

  let g:javascript_conceal_function = "ƒ"
  let g:javascript_conceal_null = "ø"
  let g:javascript_conceal_this = "@"
  let g:javascript_conceal_return = "⇚"
  let g:javascript_conceal_undefined = "¿"
  let g:javascript_conceal_NaN = "ℕ"
  let g:javascript_conceal_prototype = "¶"
  let g:javascript_conceal_static = "•"
  let g:javascript_conceal_super = "Ω"
  let g:javascript_conceal_arrow_function = "⇒"
  let g:javascript_conceal_noarg_arrow_function = "🞅"
  let g:javascript_conceal_underscore_arrow_function = "🞅"
endfunction

call s:SetupJavaScript()

" Call before function
call myspacevim#before()

" Set up autocommand to call after function on VimEnter
augroup myspacevim_bootstrap
    autocmd!
    autocmd VimEnter * call myspacevim#after()
augroup END

" Author        : Linus Fernandes
" Created       : 11/03/2025
" License       : MIT
" Description   :
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

call SpaceVim#layers#load('lang#javascript')

call SpaceVim#layers#load('lang#javascript',
  \ {
  \ 'auto_fix' : 'true',
  \ 'enable_flow_syntax' : 'false',
  \ 'format_on_save' : 'true',
  \ }
  \ )

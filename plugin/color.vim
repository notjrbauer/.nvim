if has('termguicolors')
  set termguicolors
end

set background=dark
silent! colorscheme tender

augroup MyCustomColors
  autocmd!
  autocmd ColorScheme * hi! clear SignColumn
        \| hi! Tabline cterm=NONE gui=NONE
        \| hi! TablineFill cterm=NONE gui=NONE
        \| hi! TablineSel cterm=reverse gui=reverse
        \| hi! NonText ctermbg=NONE guibg=NONE
        \| if &background ==# 'dark' | hi! VertSplit gui=NONE guibg=NONE guifg=#333333 cterm=NONE ctermbg=NONE ctermfg=14 | endif
        \| hi! link Todo Comment
        \| hi! link Conceal NonText
        \| hi! link Error ErrorMsg
        \| hi! link ALEError DiffDelete
        \| hi! link ALEErrorSign DiffDelete
        \| hi! link ALEWarning DiffChange
        \| hi! link ALEWarningSign DiffChange
        \| execute(printf('hi! OverLength guibg=%s ctermbg=%s guifg=NONE ctermfg=NONE', '#222222', '234'))
        \| hi! link LspDiagnosticsDefaultError DiffDelete
        \| hi! link LspDiagnosticsDefaultWarning DiffChange
        \| hi! link LspDiagnosticsDefaultHint NonText
        \| hi! User5 ctermfg=red guifg=red
        \| hi! User7 ctermfg=cyan guifg=cyan
        \| execute(printf('hi! User4 gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', utils#get_color('NonText', 'fg', 'gui'), utils#get_color('NonText','fg', 'cterm')))
        \| execute(printf('hi! StatusLine gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', utils#get_color('Identifier', 'fg', 'gui'), utils#get_color('Identifier', 'fg', 'cterm')))
        \| execute(printf('hi! StatusLineNC gui=italic cterm=italic guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', utils#get_color('NonText', 'fg', 'gui'), utils#get_color('NonText', 'fg', 'cterm')))
        " \| hi! NormalFloat cterm=NONE ctermbg=0 gui=NONE guibg=#000000

  autocmd ColorScheme codedark,plain hi! link StartifyHeader Normal
        \| hi! link StartifyFile Directory
        \| hi! link StartifyPath LineNr
        \| hi! link StartifySlash StartifyPath
        \| hi! link StartifyBracket StartifyPath
        \| hi! link StartifyNumber Title

  autocmd ColorScheme plain execute(printf('hi! LineNr gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s', utils#get_color('VisualNOS', 'bg', 'gui'), utils#get_color('VisualNOS', 'bg', 'cterm')))
        \| hi! Comment cterm=italic gui=italic ctermfg=236 guifg=#555555
        \| execute(printf('hi! Pmenu gui=NONE cterm=NONE guibg=#222222 ctermbg=234 guifg=%s ctermfg=%s', utils#get_color('Pmenu', 'fg', 'gui'), utils#get_color('Pmenu', 'fg', 'cterm')))
        \| hi! link PmenuSel TermCursor
        \| hi! Whitespace ctermfg=235 guifg=#333333
        \| hi! link graphqlString Comment
augroup END

setl spell
" If you use long lines, mutt will automatically switch to quoted-printable
" encoding. This will generally look better in most places that matter (eg.
" Gmail), where hard-wrapped email looks terrible and format=flowed is not
" supported.
"
" Needs to be in an "after" directory in order to beat Vim's runtime
" ("$VIMRUNTIME/ftplugin/mail.vim"), which sets it back to 72, but only if it
" was previously set to 0.
setl textwidth=0
setl formatprg=par\ rTbgqR\ B=.,?_A_a_0\ Q=_s>

let b:undo_ftplugin = 'setl spell< textwidth<'

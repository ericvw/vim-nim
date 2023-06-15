" Vim filetype plugin file
" Language:	Nim
" Maintainer:	Eric N. Vander Weele <ericvw@gmail.com>

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

set expandtab

setlocal comments=:#,:##
setlocal commentstring=#\ %s
setlocal formatoptions-=t formatoptions+=croql

setlocal suffixesadd=.nim

let b:undo_ftplugin = "setlocal expandtab<"
	\ . "|setlocal comments<"
	\ . "|setlocal commentstring<"
	\ . "|setlocal formatoptions<"
	\ . "|setlocal suffixesadd<"

" Restore original settings.
let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:

" Vim indent file
" Language:	Nim
" Maintainer:	Eric N. Vander Weele <ericvw@gmail.com>

" Only load this indent file when no other was loaded yet.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

" Rely upon cindent as the fallback.
setlocal cinoptions=(1s,m1

" Rely upon current line indent in tandem with indentexpr.
setlocal autoindent
" Ensure lisp indenting is not in effect.
setlocal nolisp

setlocal indentkeys+==elif
setlocal indentexpr=GetNimIndent()

let b:undo_indent = "setlocal cinoptions< autoindent< lisp< indentkeys< indentexpr<"

" Only define the function once.
if exists("*GetNimIndent")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

function! s:StripComment(line)
  return substitute(a:line, '#.*$', '', '')
endfunction

function! GetNimIndent()
  let plnum = prevnonblank(v:lnum - 1)
  if plnum == 0
    " Hit the start of file.
    return 0
  endif

  let pline = getline(plnum)

  # If the previous line is a comment, retain indentation.
  if pline =~ '^\s*#'
    return -1
  endif

  let ind = indent(plnum)
  pline = s:StripComment(pline)

  " If the previous line ends with a colon, indent.
  if pline =~ ':\s*$'
    return ind + shiftwidth()
  endif

  " If the previous line was a terminating execution statement, dedent.
  if pline =~ '^\s*\%(break\|continue\|discard\|return\)\>'
    return ind - shiftwidth()
  endif

  " If the previous line is an assignment-like statement, indent.
  if pline =~ '^\s*\%(const\|let\|type\|var\)\s*$'
    return ind + shiftwidth()
  endif

  " If the previous line is an advance type declaration, indent.
  if pline =~ '=\s*\%(concept\|enum\|tuple\)\s*$'
    return ind + shiftwidth()
  endif

  " If the previous line is an object type declaration, indent.
  if pline =~ '=\s*\%(ref\)\?\s*object\s*$'
    return ind + shiftwidth()
  endif

  " If the previous line ends with =, indent.
  if pline =~ '=\s*$'
    return ind + shiftwidth()
  endif

  let line = getline(v:lnum)

  " If the current line begins with a conditional branches, dedent.
  if line =~ '^\s*\%(elif\|else\)\>'
    return ind - shiftwidth()
  endif

  return cindent(v:lnum)
endfunction

" Restore original settings.
let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:

" Vim syntax file
" Language:	Nim
" Maintainer:	Eric N. Vander Weele <ericvw@gmail.com>

" Quit if a syntax file has already been loaded.
if exists("b:current_syntax")
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

" Keep keywords in alphabetical order inside groups for easy comparison with
" https://nim-lang.org/docs/manual.html#lexical-analysis-identifiers-amp-keywords
syn keyword nimKeyword		asm
syn keyword nimKeyword		bind break
syn keyword nimKeyword		cast concept const continue
syn keyword nimKeyword		defer discard distinct do
syn keyword nimKeyword		end
syn keyword nimKeyword		interface
syn keyword nimKeyword		let
syn keyword nimKeyword		mixin
syn keyword nimKeyword		out
syn keyword nimKeyword		ptr
syn keyword nimKeyword		ref return
syn keyword nimKeyword		static
syn keyword nimKeyword		type
syn keyword nimKeyword		using
syn keyword nimKeyword		var
syn keyword nimKeyword		yield

syn keyword nimConditional	case elif else if when
syn keyword nimRepeat		for while
syn keyword nimLabel		block
syn keyword nimOperator 	addr and as div in is isnot mod not notin of or shl shr xor
syn keyword nimException	except finally raise try

syn keyword nimKeyword convertor func iterator macro method proc template
	\ nextgroup=nimRoutine skipwhite
syn match nimRoutine "\a\%(_\|\%(\a\|\d\)\)*" contained

syn keyword nimInclude export from import include

" Comments
" https://nim-lang.org/docs/manual.html#lexical-analysis-comments
syn match  nimComment    "#.*$"  contains=nimTodo,@Spell
syn match  nimDocComment "##.*$" contains=nimTodo,@Spell
" https://nim-lang.org/docs/manual.html#lexical-analysis-multiline-comments
syn region nimComment
	\ start="#\["	end="\]#"
	\ contains=nimTodo,@Spell
syn region nimDocComment
	\ start="##\["	end="\]##"
	\ contains=nimTodo,@Spell
syn keyword nimTODO FIXME NOTE NOTES TODO XXX contained

" Strings
" https://nim-lang.org/docs/manual.html#lexical-analysis-string-literals
syn region nimString matchgroup=nimQuotes
	\ start=+"+ end=+"+ skip=+\\"+
	\ contains=nimEscape,nimEscapeStr
" https://nim-lang.org/docs/manual.html#lexical-analysis-triple-quoted-string-literals
syn region nimString matchgroup=nimTripleQuotes
	\ start=+"""+ end=+"*\zs"""+
" https://nim-lang.org/docs/manual.html#lexical-analysis-raw-string-literals
syn region nimRawString matchgroup=nimQuotes
	\ start=+[rR]"+ end=+"+ skip=+\\"+

" Characters
" https://nim-lang.org/docs/manual.html#lexical-analysis-character-literals
syn region nimCharacter matchgroup=nimQuote
	\ start="'" end="'" skip="\\'"
	\ contains=nimEscape oneline

" Escape Sequences
syn match nimEscape	contained +\\[rcnlftv\\"'abe]+
syn match nimEscape	contained "\\\d\+"
syn match nimEscape	contained "\\x\x\{2}"
syn match nimEscapeStr	contained "\\p"
syn match nimEscapeStr	contained "\\u\x\{4}"
syn match nimEscapeStr	contained "\\u{\x\+}"

" Numbers
" https://nim-lang.org/docs/manual.html#lexical-analysis-numeric-literals
syn case ignore

" Hexidecimal
syn match nimInt "\<0x\x\%(_\?\x\)*\%('[iu]\d\+\)\?\>"
syn match nimFloat "\<0x\x\%(_\?\x\)*\%('\%(f\d\+\|d\)\)\>"
" Decimal
syn match nimInt "\<\d\%(_\?\d\)*\%('\?[iu]\d\+\)\?\>"
syn match nimFloat "\<\d\%(_\?\d\)*\%('\?\%(f\d\+\|d\)\)\>"
" Octal
syn match nimInt "\<0o\o\%(_\?\o\)*\%('\?[iu]\d\+\)\?\>"
syn match nimFloat "\<0o\o\%(_\?\o\)*\%('\?\%(f\d\+\|d\)\)\>"
" Binary
syn match nimInt "\<0b[01]\%(_\>[01]\)*\%('\?[iu]\d\+\)\?\>"
syn match nimFloat "\<0b[01]\%(_\>[01]\)*\%('\?\%(f\d\+\|d\)\)\>"
"Float
syn match nimFloat "\<\d\%(_\?\d\)*\.\d\%(_\?\d\)*\%(e[-+]\?\d\%(_\?\d\)*\)\%('\?\%(f\d\+\|d\)\)\?\>"
syn match nimFloat "\<\d\%(_\?\d\)*e[-+]\?\d\%(_\?\d\)*\%('\?\%(f\d\+\|d\)\)\?\>"

syn case match

" Booleans
syn keyword nimBoolean true false

" Types
" https://nim-lang.org/docs/manual.html#types
syn keyword nimType		int int8 int16 int32 int64
syn keyword nimType		uint uint8 uint16 uint32 uint64
syn keyword nimType		float float32 float64
syn keyword nimType		bool
syn keyword nimType		char Rune
syn keyword nimType		string
syn keyword nimType		array openarray seq varargs
syn keyword nimType		set
syn keyword nimType		nil
syn keyword nimStructure	enum object tuple

" Builtin
" https://nim-lang.org/docs/system.html
syn match nimBuiltin "@"
syn keyword nimBuiltin abs add addAndFetch addEscapedChar addQuitProc
syn keyword nimBuiltin addQuoted addr alignof alloc alloc0 alloc0Impl
syn keyword nimBuiltin allocCStringArray allocImpl allocSharedImpl astToStr
syn keyword nimBuiltin atomicDec atomicInc
syn keyword nimBuiltin card cas chr clamp cmp cmpMem compileOption compiles
syn keyword nimBuiltin copyMem cpuRelax create createShared createSharedU
syn keyword nimBuiltin createU cstringArrayToSeq
syn match   nimBuiltin "contains"
syn keyword nimBuiltin dealloc deallocCStringArray deallocHeap deallocImpl
syn keyword nimBuiltin deallocShared deallocSharedImpl debugEcho dec
syn keyword nimBuiltin declared declaredInScope deepCopy default defined del
syn keyword nimBuiltin delete dispose
syn keyword nimBuiltin echo equalMem excl
syn keyword nimBuiltin find finished freeShared
syn keyword nimBuiltin gcInvariant getAllocStats getCurrentException
syn keyword nimBuiltin getCurrentExceptionMsg getFrame getFrameState
syn keyword nimBuiltin getFreeMem getGcFrame getMaxMem getOccupiedMem
syn keyword nimBuiltin getStackTrace getStackTraceEntries getTotalMem
syn keyword nimBuiltin getTypeInfo gorge gorgeEx
syn keyword nimBuiltin high
syn keyword nimBuiltin inc incl insert instantiationInfo internalNew isNil
syn keyword nimBuiltin isNotForeign iterToProc
syn keyword nimBuiltin len locals low
syn keyword nimBuiltin max min move moveMem
syn keyword nimBuiltin new newSeq newSeqOfCap newSeqUninitialized newString
syn keyword nimBuiltin ord
syn keyword nimBuiltin pop popGcFrame pred prepareMutation procCall protect
syn keyword nimBuiltin pushGcFrame
syn keyword nimBuiltin quit
syn keyword nimBuiltin rawEnv rawProc realloc0Impl reallocImpl
syn keyword nimBuiltin reallocShared0Imple reallocSharedImple repr
syn keyword nimBuiltin reprDiscriminant reset resize resizeShared
syn keyword nimBuiltin setCurrentException setFrame setFrameState setGcFrame
syn keyword nimBuiltin setLen setupForeignThreadGc shallow shallowCopy sizeof
syn keyword nimBuiltin slurp stackTraceAvailable staticExec staticREad substr
syn keyword nimBuiltin succ swap
syn keyword nimBuiltin tearDownForeignThreadGc toBiggestFloat toBiggestInt
syn keyword nimBuiltin toFloat toInt toOpenArray toOpenArrayByte toU8 toU16
syn keyword nimBuiltin toU32 typeof
syn keyword nimBuiltin unsafeAddr unsafeNew
syn keyword nimBuiltin wasMoved writeStackTrace
syn keyword nimIterator countdown countup
" https://nim-lang.org/docs/iterators.html
syn keyword nimIterator fieldPairs fields items mitems mpairs pairs
" https://nim-lang.org/docs/assertions.html
syn keyword nimBuiltin assert doAssert doAssertRaises failedAssertImpl
syn keyword nimBuiltin onFailedAssert raiseAssert
" https://nim-lang.org/docs/dollars.html
syn match nimBuiltin "\$"
" https://nim-lang.org/docs/io.html
syn keyword nimBuiltin close endOfFile flushFile getFileHandle getFilePos
syn keyword nimBuiltin getOsFileHandle open readAll readBuffer readBytes
syn keyword nimBuiltin readChar readChars readFile readLine readLines
syn keyword nimBuiltin reopen setFilePos setInheritable setStdIoUnbuffered
syn keyword nimBuiltin write writeBuffer writeChars writeFile writeLine
syn keyword nimBuiltin write writeBuffer writeChars writeFile writeLine
syn keyword nimIterator lines
" https://nim-lang.org/docs/widestrs.html
syn keyword nimBuiltin newWideCString

" Intermediate highlight links.
hi def link nimTripleQuotes	nimQuotes
" TODO: Only have iterators highlight after '.'. How to do this?
"hi def link nimIterator		nimBuiltin

" Please keep in :help group-name order.
hi def link nimComment		Comment
hi def link nimDocComment	Comment
hi def link nimString		String
hi def link nimRawString	String
hi def link nimQuotes		String
hi def link nimCharacter	Character
hi def link nimQuote		Character
hi def link nimInt		Number
hi def link nimBoolean		Boolean
hi def link nimFloat		Float

hi def link nimRoutine		Function
hi def link nimBuiltin		Function

hi def link nimConditional	Conditional
hi def link nimRepeat		Repeat
hi def link nimLabel		Label
hi def link nimOperator		Operator
hi def link nimKeyword		Keyword
hi def link nimException	Exception

hi def link nimInclude		Include

hi def link nimType		Type
hi def link nimStructure	Structure

hi def link nimEscape		SpecialChar
hi def link nimEscapeStr	SpecialChar

hi def link nimTodo		Todo

let b:current_syntax = "nim"

" Restore original settings.
let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=2 sts=2 ts=8 noet:

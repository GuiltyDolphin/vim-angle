" Vim syntax file
" Language:	Angle
" Maintainer:	Ben Moon <https://github.com/GuiltyDolphin>
" Version: 0.1.0
" URL: https://github.com/GuiltyDolphin/vim-angle

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if has("folding") && exists("angle_fold")
  setlocal foldmethod=syntax
endif


syn sync fromstart

syn keyword angleStatement in break continue
syn keyword angleStatement defun nextgroup=angleFunctionDef skipwhite
syn keyword angleStatement return
syn keyword angleStatement try catch raise
syn keyword angleConditional if then else unless
syn keyword angleRepeat for do while

syn match angleFunctionDef "\v\s+\a\w*"
      \ nextgroup=angleParameterList contained

syn match angleComment "\v#.*$" contains=angleTODO,@Spell
syn keyword angleTODO TODO FIXME XXX contained

" Taken from the Haskell syntax file, as Angle uses the same string and
" character escaping as Haskell.
syn match   angleSpecialChar contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   angleSpecialChar contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match   angleSpecialCharError	contained "\\&\|'''\+"
syn region  angleString start=+e\?"+  skip=+\\\\\|\\"+  end=+"+  contains=angleSpecialChar
syn match   angleCharacter "[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=angleSpecialChar,angleSpecialCharError
syn match   angleCharacter "^'\([^\\]\|\\[^']\+\|\\'\)'" contains=angleSpecialChar,angleSpecialCharError

syn match angleInteger "\v\-*[0-9]+"
syn match angleFloat "\v\-*[0-9]+\.[0-9]+"

syn keyword angleBuiltin index length
syn keyword angleBuiltin input print str
syn keyword angleBuiltin asType isNull
syn keyword angleBuiltin main
syn keyword angleBuiltin open close read write
syn keyword angleBuiltin shell eval include
syn keyword angleBuiltin getArgs
syn keyword angleBuiltin round
syn keyword angleBuiltin nonlocal global



syn cluster angleExpressionCluster
      \ contains=@angleLiteralCluster,@angleIdentifier,@angleOperator

syn cluster angleLiteralCluster
      \ contains=@angleString,@angleNumber,@angleList,@angleBool,@angleCharacter,@angleRange,@angleNull,@angleLambda,@angleKeywordLiteral


syn match angleOperator "\v\(@<=\&"
syn match angleOperator "\v\(@<=\*\*?"
syn match angleOperator "\v\(@<=\+\+?"
syn match angleOperator "\v\(@<=\-"
syn match angleOperator "\v\(@<=\/"
syn match angleOperator "\v\(@<=\>\=?"
syn match angleOperator "\v\(@<=\<\=?"
syn match angleOperator "\v\(@<=\=\="
syn match angleOperator "\v\^"
syn match angleOperator "\v\(@<=\|"
syn match angleOperator "\v[^=]\zs\=\ze[^=]"
syn match angleOperator "\v\|\=\ze[^=]"
syn match angleOperator "\v\|\|\=\ze[^=]"
syn match angleOperator "\v\$\ze\("




" FIXME: range's '..' currently included as a delimiter, but should move to
" its own group.
syn match angleDelimiter "\v(\(|\)|\{|\}|\;|\,|\.\.)"

syn region angleMultiStmt start="{" end="}" transparent fold keepend extend

syn keyword angleBool true false

syn keyword angleNull null
syn match angleNull "\v\w@<!\(\)"

syn match angleIdentifier "\v(\$|\@)?\a\w*"

syn match angleKeywordLiteral "\v\:\a\w*"

syn match angleListBracket "\v\[|\]"

syn region angleParameterList start="(" end=")"
      \ contains=angleParameter,angleParameterConstraintIndicator
      \ contained

syn match angleParameter "\v(\$|\!|\.\.)?" nextgroup=angleIdentifier
      \ contained

syn match angleParameterConstraintIndicator "\v\:"
      \ nextgroup=angleParameterConstraint contained

syn match angleParameterConstraint "\v\@"
      \ nextgroup=angleIdentifier contained

hi def link angleBool Boolean
hi def link angleBuiltin Function
hi def link angleChararacter Character
hi def link angleComment Comment
hi def link angleConditional Conditional
hi def link angleDelimiter Delimiter
hi def link angleFloat Float
hi def link angleFunctionDef Function
hi def link angleIdentifier Identifier
hi def link angleKeywordLiteral Constant
hi def link angleListBracket Delimiter
hi def link angleNull Constant
hi def link angleInteger Number
hi def link angleOperator Operator
hi def link angleParameter Identifier
hi def link angleParameterConstraint Identifier
hi def link angleParameterConstraintIndicator Delimiter
hi def link angleParameterList Delimiter
hi def link angleRepeat Repeat
hi def link angleSpecialChar SpecialChar
hi def link angleSpecialCharError Error
hi def link angleStatement Keyword
hi def link angleString String

let b:current_syntax = "angle"

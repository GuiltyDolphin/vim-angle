if exists("b:current_syntax")
  finish
endif



syntax keyword angleStatement in break continue
syntax keyword angleStatement defun nextgroup=angleFunctionDef skipwhite
syntax keyword angleStatement return
syntax keyword angleConditional if then else unless
syntax keyword angleRepeat for do while

syntax match angleFunctionDef "\v\s+\a\w*"
      \ nextgroup=angleParameterList contained

syntax match angleComment "\v#.*$" contains=angleTODO,@Spell
syntax keyword angleTODO TODO FIXME XXX contained

" Taken from the Haskell syntax file, as Angle uses the same string and
" character escaping as Haskell.
syn match   angleSpecialChar	contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   angleSpecialChar	contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match   angleSpecialCharError	contained "\\&\|'''\+"
syn region  angleString		start=+e\?"+  skip=+\\\\\|\\"+  end=+"+  contains=angleSpecialChar
syn match   angleCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=angleSpecialChar,angleSpecialCharError
syn match   angleCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=angleSpecialChar,angleSpecialCharError

syntax match angleInteger "\v[0-9]+"
syntax match angleFloat "\v[0-9]+\.[0-9]+"

syntax keyword angleBuiltin index length
syntax keyword angleBuiltin input print str
syntax keyword angleBuiltin asType isNull
syntax keyword angleBuiltin main



syntax cluster angleExpressionCluster
      \ contains=@angleLiteralCluster,@angleIdentifier,@angleOperator

syntax cluster angleLiteralCluster
      \ contains=@angleString,@angleNumber,@angleList,@angleBool,@angleCharacter,@angleRange,@angleNull,@angleLambda,@angleKeywordLiteral


syntax match angleOperator "\v\(@<=\&"
syntax match angleOperator "\v\(@<=\*"
syntax match angleOperator "\v\(@<=\+"
syntax match angleOperator "\v\(@<=\-"
syntax match angleOperator "\v\(@<=\/"
syntax match angleOperator "\v\(@<=\>\=?"
syntax match angleOperator "\v\(@<=\<\=?"
syntax match angleOperator "\v\(@<=\=\="
syntax match angleOperator "\v\^"
syntax match angleOperator "\v\(@<=\|"




" FIXME: range's '..' currently included as a delimiter, but should move to
" its own group.
syntax match angleDelimiter "\v(\(|\)|\{|\}|\;|\,|\.\.)"

syntax keyword angleBool true false

syntax keyword angleNull null
syntax match angleNull "\v\w@<!\(\)"

syntax match angleIdentifier "\v\$?\a\w*"

syntax match angleKeywordLiteral "\v\:\a\w*"

syntax match angleListBracket "\v\[|\]"

syntax region angleParameterList start="(" end=")"
      \ contains=angleParameter,angleParameterConstraintIndicator
      \ contained

syntax match angleParameter "\v(\$|\!|\.\.)?" nextgroup=angleIdentifier
      \ contained

syntax match angleParameterConstraintIndicator "\v\:"
      \ nextgroup=angleParameterConstraint contained

syntax match angleParameterConstraint "\v\@"
      \ nextgroup=angleIdentifier contained

highlight link angleBool Boolean
highlight link angleBuiltin Function
highlight link angleChararacter Character
highlight link angleComment Comment
highlight link angleConditional Conditional
highlight link angleDelimiter Delimiter
highlight link angleFloat Float
highlight link angleFunctionDef Function
highlight link angleIdentifier Identifier
highlight link angleKeywordLiteral Constant
highlight link angleListBracket Delimiter
highlight link angleNull Constant
highlight link angleInteger Number
highlight link angleOperator Operator
highlight link angleParameter Identifier
highlight link angleParameterConstraint Identifier
highlight link angleParameterConstraintIndicator Delimiter
highlight link angleParameterList Delimiter
highlight link angleRepeat Repeat
highlight link angleSpecialChar SpecialChar
highlight link angleSpecialCharError Error
highlight link angleStatement Keyword
highlight link angleString String

let b:current_syntax = "angle"

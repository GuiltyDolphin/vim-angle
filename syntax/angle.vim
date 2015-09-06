if exists("b:current_syntax")
  finish
endif

syntax keyword angleConditional if then else unless

syntax keyword angleRepeat for do while

syntax keyword angleKeyword in break continue
syntax keyword angleKeyword defun return

syntax keyword angleStatement defun nextgroup=angleFunctionDef skipwhite

syntax match angleFunctionDef "\v\s+\a\w*"
      \ nextgroup=angleParameterList contained

syntax keyword angleBuiltinFunction index length
syntax keyword angleBuiltinFunction input print str
syntax keyword angleBuiltinFunction asType isNull

syntax match angleComment "\v#.*$" contains=angleTODO,@Spell
syntax keyword angleTODO TODO FIXME XXX contained

syntax match angleOperator "\v\&"
syntax match angleOperator "\v\*"
syntax match angleOperator "\v\+"
syntax match angleOperator "\v\-"
syntax match angleOperator "\v\/"
syntax match angleOperator "\v\=\="
syntax match angleOperator "\v\^"
syntax match angleOperator "\v\|"

syntax match angleNumber "\v[0-9]+"

syntax match angleFloat "\v[0-9]+\.[0-9]+"


" Taken from the Haskell syntax file, as Angle uses the same string and
" character escaping as haskell.
syn match   angleSpecialChar	contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   angleSpecialChar	contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match   angleSpecialCharError	contained "\\&\|'''\+"
syn region  angleString		start=+e\?"+  skip=+\\\\\|\\"+  end=+"+  contains=angleSpecialChar
syn match   angleCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=angleSpecialChar,angleSpecialCharError
syn match   angleCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=angleSpecialChar,angleSpecialCharError

syntax match angleBracket "\v\(|\)|\{|\}"

syntax match angleDelimiter "\v(\(|\)|\{|\}|\;)"

syntax keyword angleBool true false

syntax keyword angleNull null

syntax match angleIdentifier "\v\a\w*"

syntax match angleKeywordLiteral "\v\:\a\w*"

syntax match angleListBracket "\v\[|\]"

syntax match angleBraces "\v\{|\}"

syntax match angleParens "\v\(|\)"

syntax match angleElementSeparator "\v\,"

" syntax match angleAnnotationConstraint

syntax region angleParameterList start="(" end=")"
      \ contains=angleParameter,angleParameterConstraintIndicator
      \ contained

syntax match angleParameter "\v(\$|\!|)?" nextgroup=angleIdentifier
      \ contained


syntax match angleParameterConstraintIndicator "\v\:"
      \ nextgroup=angleParameterConstraint contained

syntax match angleParameterConstraint "\v\@"
      \ nextgroup=angleIdentifier contained


highlight link angleKeyword Keyword
highlight link angleBuiltinFunction Function
highlight link angleComment Comment
highlight link angleOperator Operator
highlight link angleNumber Number
highlight link angleFloat Float
highlight link angleString String
highlight link angleChararacter Character
highlight link angleBool Boolean
highlight link angleIdentifier Identifier
highlight link angleParameterConstraint Identifier
highlight link angleKeywordLiteral Constant
highlight link angleNull Constant
highlight link angleSynDelims Delimiter
highlight link angleParens Delimiter
highlight link angleListBracket Delimiter
highlight link angleBraces Delimiter
highlight link angleRepeat Repeat
highlight link angleConditional Conditional
highlight link angleParameter Identifier
highlight link angleParameterList Delimiter
highlight link angleStatement Keyword
highlight link angleParameterConstraintIndicator Delimiter
highlight link angleFunctionDef Function
highlight link angleSpecialCharError Error
highlight link angleSpecialChar SpecialChar
highlight link angleDelimiter Delimiter

let b:current_syntax = "angle"

if exists("b:current_syntax")
  finish
endif

syntax keyword angleConditional if then else unless

syntax keyword angleRepeat for do while

syntax keyword angleKeyword in break continue
syntax keyword angleKeyword defun return

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

syntax region angleString start=/\ve?"/ skip=/\v\\./ end=/\v"/

syntax match angleBracket "\v\(|\)|\{|\}"

" Temporary? -> Would need to only allow one character, but allow for
" escaped unicode sequences.
syntax region angleChar start=/\v'/ skip=/\v\\./ end=/\v'/

syntax keyword angleBool true false

syntax keyword angleNull null

syntax match angleIdentifier "\v\a\w*"

syntax match angleParameterConstraint "\v\@\a\w*"

syntax match angleKeywordLiteral "\v\:\a\w*"

syntax match angleListBracket "\v\[|\]"

syntax match angleBraces "\v\{|\}"

syntax match angleParens "\v\(|\)"

syntax match angleElementSeparator ","

syntax match angleStatementEnd ";"

" syntax match angleAnnotationConstraint

syntax match angleArgument "(\$|\!|)?" " contains=@angleIdentifier

syntax region angleArgumentList start="(" end=")" contains=@angleArgument

highlight link angleKeyword Keyword
highlight link angleBuiltinFunction Function
highlight link angleComment Comment
highlight link angleOperator Operator
highlight link angleNumber Number
highlight link angleFloat Float
highlight link angleString String
highlight link angleChar Character
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
highlight link angleArgument Identifier
highlight link angleArgumentList Delimiter

let b:current_syntax = "angle"

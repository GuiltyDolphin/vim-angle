if exists("b:current_syntax")
  finish
endif

syntax keyword angleKeyword if then else unless
syntax keyword angleKeyword true false
syntax keyword angleKeyword for in do while break continue
syntax keyword angleKeyword defun return
syntax keyword angleKeyword null

syntax keyword angleFunction index length
syntax keyword angleFunction input print str
syntax keyword angleFunction asType isNull

syntax match angleComment "\v#.*$"

syntax match angleOperator "\v\&"
syntax match angleOperator "\v\*"
syntax match angleOperator "\v\+"
syntax match angleOperator "\v\-"
syntax match angleOperator "\v\/"
syntax match angleOperator "\v\=\="
syntax match angleOperator "\v\^"
syntax match angleOperator "\v\|"

highlight link angleKeyword Keyword
highlight link angleFunction Function
highlight link angleComment Comment
highlight link angleOperator Operator

let b:current_syntax = "angle"

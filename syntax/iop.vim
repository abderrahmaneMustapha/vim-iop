if exists("b:current_syntax")
    finish
endif

" basic keywords and types
syntax keyword iopKeyword interface abstract package import
syntax keyword iopComplexType class enum union struct module
syntax keyword iopKeyword in out throw typedef static
syntax keyword iopBooleanTrue    true
syntax keyword iopBooleanFalse   false
syntax keyword iopBasicTypes int uint long ulong xml
syntax keyword iopBasicTypes byte ubyte short ushort void
syntax keyword iopBasicTypes bool double string bytes
syntax keyword iopTodos TODO FIXME XXX TBD NOTE

" comments
syntax keyword iopCommentTodo contained TODO FIXME XXX TBD NOTE
syntax region  iopComment start=+/\*+  end=+\*/+ contains=iopCommentTodo,@Spell fold extend keepend

" decorators
syntax match   iopDecorator /^\s*@/ nextgroup=iopDecoratorFunction
syntax match   iopDecoratorFunction  contained /\h[a-zA-Z0-9_.]*/

" types
syntax match   iopNumber  /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\%(\x\|_\)\+\)n\=\>/
syntax match   iopDouble  /\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/
syntax region  iopString  start=+"\|c"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

" operators
syntax match iopOperator /[=<>&:?]/
syntax match iopOperator /(<<\|>>)/

" iop tags
syntax match iopTag  "^[0-9]*:"

" iop open & close
syntax match iopBrackets "\[\]\|{\|}"

" highlights
highlight link iopDecorator Special
highlight link iopTag Identifier
highlight link iopBrackets Identifier
highlight link iopDecoratorFunction Function
highlight link iopComment Comment
highlight link iopKeyword Keyword
highlight link iopBooleanTrue Keyword
highlight link iopBooleanFalse Keyword
highlight link iopComplexType Keyword
highlight link iopBasicTypes Type
highlight link iopTodos Todo
highlight link iopNumber Number
highlight link iopDouble Double
highlight link iopString String
highlight link iopOperator Operator

let b:current_syntax = "iop"
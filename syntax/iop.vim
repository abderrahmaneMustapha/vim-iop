if exists("b:current_syntax")
    finish
endif

syntax keyword iopKeyword enum union struct
syntax keyword iopKeyword class   interface static abstract
syntax keyword iopKeyword in out throw typedef
syntax keyword iopBasicTypes int uint long ulong xml
syntax keyword iopBasicTypes byte ubyte short ushort void
syntax keyword iopBasicTypes bool double string bytes
syntax keyword iopTodos TODO FIXME XXX TBD NOTE

syntax keyword iopCommentTodo contained TODO FIXME XXX TBD NOTE
syntax region  iopComment start=+/\*+  end=+\*/+ contains=iopCommentTodo,@Spell fold extend keepend

syntax match   iopDecorator /^\s*@/ nextgroup=iopDecoratorFunction
syntax match   iopDecoratorFunction  contained /\h[a-zA-Z0-9_.]*/ nextgroup=iopParenDecorator

syntax match   iopNumber  /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\%(\x\|_\)\+\)n\=\>/
syntax match   iopDouble  /\c\<\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%(e[+-]\=\d\+\)\=\>/

highlight link iopDecorator Special
highlight link iopDecoratorFunction Function
highlight link iopComment Comment
highlight link iopKeyword Keyword
highlight link iopBasicTypes Keyword
highlight link iopTodos Todo
highlight link iopNumber Number
highlight link iopDouble Double

let b:current_syntax = "iop"
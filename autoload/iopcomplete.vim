let s:iops=readfile(expand('~/.vim/iop.txt'))
let s:types=readfile(expand('~/.vim/iop-types.txt'))
let s:decorators=readfile(expand('~/.vim/iop-deco.txt'))
let s:values=readfile(expand('~/.vim/iop-values.txt'))

function! FindParent(line_num)
    let prevline = prevnonblank(a:line_num-1)
    while prevline > -1 && indent(prevline)>0
         let prevline = prevnonblank(prevline-1)
    endwhile
    if prevline > -1
        let line = getline(prevline)
        if stridx(line, "interface") > -1
            return s:values
        endif
        if stridx(line, "enum") > -1
            return []
        endif
        if stridx(line, "class") > -1 || stridx(line, "struct") > -1
            return s:types+s:decorators
        endif
    endif
    return s:iops+s:decorators
endfun

function! iopcomplete#CompleteIOP(findstart, base)
    let line = getline('.')
    if a:findstart
        " locate the start of the word
        let start = col('.') - 1
        while start > 0 && line[start - 1]!= ' ' && (line[start - 1] =~ '\a' || line[start - 1] =~ '.')
            let start -= 1
        endwhile
        return start
    else
        let line_num = line('.')
        let idt = indent(line_num)
        let matches = FindParent(line_num)
        " find classes matching "a:base"
        let res = []
        for m in matches
            if m =~ '^' . a:base && stridx(line, "static") == -1 || m !="static" && index(s:decorators, m) == -1
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun

let s:matches=readfile(expand('~/.vim/iop.txt'))
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
            return "interface"
        endif
        if stridx(line, "enum") > -1
            return "enum"
        endif
        if stridx(line, "class") > -1 || stridx(line, "struct") > -1
            return "types"
        endif
    endif
    return -1
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
        " find classes matching "a:base"
        let res = []
        let parent = FindParent(line_num)
        if idt > 0 && stridx(line, "static") > -1 && parent == "types"
            for m in s:types
                if m =~ '^' . a:base && m !="static"
                    call add(res, m)
                endif
            endfor
        elseif idt > 0 && parent == "types"
            for m in s:types+s:decorators
                if m =~ '^' . a:base
                    call add(res, m)
                endif
            endfor
        elseif idt > 0 && parent == "interface"
            for m in s:values
                if m =~ '^' . a:base
                    call add(res, m)
                endif
            endfor
        elseif parent != "enum"
            for m in s:matches
                if m =~ '^' . a:base
                    call add(res, m)
                endif
            endfor
        endif
        return res
    endif
endfun

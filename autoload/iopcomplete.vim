let s:matches=readfile(expand('~/.vim/iop.txt'))

function! iopcomplete#CompleteIOP(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a' || line[start - 1] =~ '.' || line[start - 1] =~ '-')
            let start -= 1
        endwhile
        return start
    else
        " find classes matching "a:base"
        let res = []
        for m in s:matches
            if m =~ '^' . a:base
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun

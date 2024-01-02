syntax enable
filetype on
filetype indent on
set t_Co=256
set number
"set relativenumber
set cursorline
set colorcolumn=80
set showmode
set showcmd
set encoding=utf-8
set list
set listchars=trail:·,tab:»·,nbsp:+
set mouse=a
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch
set nobackup
set noswapfile
set nowrap
set foldmethod=indent
set foldlevelstart=99
set fillchars=eob:\ 
set signcolumn=yes
set background=dark


nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-n> :bn<cr>
nmap <c-p> :bp<cr>
nmap <c-x>k :bd<cr>
nmap <c-x><c-e> :wqa<cr>
nmap <a-d> :terminal<cr>
tmap <a-d> exit<cr>

imap <c-d> <del>
imap <c-b> <left>
imap <c-f> <right>
imap <c-a> <home>
imap <c-e> <end>
imap <c-k> <c-o>d$
imap <c-s> <esc>:w<cr>
imap <c-n> <down>
imap <c-p> <up>
imap <c-j> <c-o>o
imap <c-k> <c-o>O

cmap <c-d> <del>
cmap <c-b> <left>
cmap <c-f> <right>
cmap <c-a> <home>
cmap <c-e> <end>


let s:background = &background
if &background ==# 'dark'
    let s:blue             = #{gui: '#a3a3eb', cterm: 147}
    let s:orange           = #{gui: '#d7af87', cterm: 180}
    let s:red              = #{gui: '#d78787', cterm: 174}
    let s:teal             = #{gui: '#5fd7af', cterm: 79 }
    let s:yellow           = #{gui: '#d7d787', cterm: 186}

    let s:norm             = #{gui: '#bcbcbc', cterm: 250}
    let s:norm_subtle      = #{gui: '#dfdfdf', cterm: 253}
    let s:norm_most_subtle = #{gui: '#bfbfbf', cterm: 245}
    let s:bg_subtle        = #{gui: '#2a2a2a', cterm: 235}
    let s:bg_most_subtle   = #{gui: '#1a1a1a', cterm: 234}
    let s:bg               = #{gui: '#0a0a0a', cterm: 232}

    let s:bg_active        = s:bg_subtle
    let s:bg_inactive      = s:bg_most_subtle
else
    let s:blue             = #{gui: '#2f2fdf', cterm: 20 }
    let s:orange           = #{gui: '#c24a0f', cterm: 130}
    let s:red              = #{gui: '#d4312f', cterm: 203}
    let s:teal             = #{gui: '#028157', cterm: 29 }
    let s:yellow           = #{gui: '#a36118', cterm: 130}

    let s:norm             = #{gui: '#000000', cterm: 16 }
    let s:norm_subtle      = #{gui: '#202020', cterm: 236}
    let s:norm_most_subtle = #{gui: '#404040', cterm: 59 }
    let s:bg_subtle        = #{gui: '#d5d5d5', cterm: 188}
    let s:bg_most_subtle   = #{gui: '#e5e5e5', cterm: 254}
    let s:bg               = #{gui: '#f5f5f5', cterm: 255}

    let s:bg_active        = s:bg_most_subtle
    let s:bg_inactive      = s:bg_subtle
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style) abort
    execute 'highlight' a:group
            \ 'guifg='   has_key(a:style, 'fg')    ? a:style.fg.gui   : 'NONE'
            \ 'guibg='   has_key(a:style, 'bg')    ? a:style.bg.gui   : 'NONE'
            \ 'guisp='   has_key(a:style, 'sp')    ? a:style.sp.gui   : 'NONE'
            \ 'gui='     has_key(a:style, 'gui')   ? a:style.gui      : 'NONE'
            \ 'ctermfg=' has_key(a:style, 'fg')    ? a:style.fg.cterm : 'NONE'
            \ 'ctermbg=' has_key(a:style, 'bg')    ? a:style.bg.cterm : 'NONE'
            \ 'cterm='   has_key(a:style, 'cterm') ? a:style.cterm    : 'NONE'
endfunction

call s:h('Normal', #{fg: s:norm})

" Restore &background's value in case changing Normal changed &background.
" (`:help :hi-normal-cterm`)
if &background !=# s:background
    let &background = s:background
endif

" Syntax Highlights: {{{1
call s:h('Comment', #{fg: s:norm_most_subtle, gui: 'italic', cterm: 'italic'})

call s:h('Constant', #{fg: s:blue})
highlight! link String Constant
highlight! link Character Constant
highlight! link Number Constant
highlight! link Boolean Constant
highlight! link Float Constant

highlight! link Identifier Normal
highlight! link Function Identifier

call s:h('Keyword', #{fg: s:norm_subtle})
highlight! link Conditonal Keyword
highlight! link Repeat Keyword
highlight! link Operator Keyword
highlight! link Statement Keyword
highlight! link Exception Keyword
highlight! link Label Keyword

call s:h('PreProc', #{fg: s:norm_subtle})
highlight! link Include PreProc
highlight! link Define PreProc
highlight! link PreCondit PreProc

highlight! link Type Identifier
highlight! link StorageClass Keyword
highlight! link Structure Keyword
highlight! link Typedef Type

call s:h('Special', #{fg: s:norm_subtle})
call s:h('SpecialChar', #{fg: s:blue, gui: 'bold', cterm: 'bold'})
call s:h('Tag', #{fg: s:orange})
highlight! link Delimiter Special
call s:h('SpecialComment', #{fg: s:norm_subtle, gui: 'italic', cterm: 'italic'})
call s:h('Debug', #{fg: s:norm_subtle})

call s:h('Underlined', #{fg: s:norm, gui: 'underline', cterm: 'underline'})
call s:h('Error', #{fg: s:red, gui: 'bold', cterm: 'bold'})
highlight! link Todo SpecialComment

" Other Highlights: {{{1
call s:h('NonText', #{fg: s:norm_most_subtle, bg: s:bg_most_subtle})
call s:h('EndOfBuffer', #{fg: s:norm_most_subtle})
call s:h('Ignore', #{fg: s:norm_most_subtle})
highlight! link Conceal Ignore
highlight! link Whitespace Ignore
call s:h('SpecialKey', #{fg: s:norm_subtle, gui: 'bold', cterm: 'bold'})

call s:h('Visual', #{fg: s:bg, bg: s:norm_most_subtle})
call s:h('VisualNOS', #{fg: s:norm, bg: s:norm_most_subtle})

call s:h('Search', #{fg: s:bg, bg: s:blue})
call s:h('IncSearch', #{fg: s:bg, bg: s:orange})
highlight! link CurSearch IncSearch

call s:h('DiffAdd', #{fg: s:bg, bg: s:teal})
call s:h('DiffDelete', #{fg: s:bg, bg: s:red})
call s:h('DiffText', #{fg: s:bg, bg: s:yellow})
call s:h('DiffChange', #{bg: s:bg_subtle})

call s:h('SpellBad', #{gui: 'undercurl', cterm: 'underline', sp: s:red})
call s:h('SpellCap', #{gui: 'undercurl', cterm: 'underline', sp: s:yellow})
call s:h('SpellRare', #{gui: 'undercurl', cterm: 'underline', sp: s:teal})
call s:h('SpellLocal', #{gui: 'undercurl', cterm: 'underline', sp: s:norm})

call s:h('ErrorMsg', #{fg: s:red})
call s:h('WarningMsg', #{fg: s:yellow})
call s:h('MoreMsg', #{fg: s:norm_subtle, gui: 'bold', cterm: 'bold'})
highlight! link ModeMsg MoreMsg
call s:h('Title', #{fg: s:norm_subtle})
call s:h('Question', #{fg: s:teal})
call s:h('Directory', #{fg: s:blue})

call s:h('CursorLine', #{bg: s:bg_most_subtle})
highlight! link CursorColumn CursorLine
call s:h('CursorLineNr', #{fg: s:blue, bg: s:bg_most_subtle})
call s:h('LineNr', #{fg: s:norm_most_subtle})

call s:h('ColorColumn', #{bg: s:bg_subtle})
call s:h('SignColumn', #{fg: s:blue})
call s:h('FoldColumn', #{fg: s:norm_most_subtle})
call s:h('Folded', #{fg: s:norm_subtle})

call s:h('StatusLine', #{bg: s:bg_active})
call s:h('StatusLineNC', #{fg: s:norm_subtle, bg: s:bg_inactive})
call s:h('VertSplit', #{fg: s:bg_most_subtle})

highlight! link TabLine StatusLineNC
highlight! link TabLineSel StatusLine
highlight! link TabLineFill TabLine

call s:h('QuickFixLine', #{bg: s:bg_active})
call s:h('WildMenu', #{fg: s:bg, bg: s:norm})

call s:h('Pmenu', #{fg: s:norm, bg: s:bg_most_subtle})
highlight! link PmenuSel Search
highlight! link PmenuThumb Search
highlight! link PmenuSbar Pmenu

" Standard Plugins: {{{1
" c.vim
highlight! link cUserLabel Identifier

" diff.vim
call s:h('diffAdded', #{fg: s:teal})
call s:h('diffRemoved', #{fg: s:red})
call s:h('diffChanged', #{fg: s:yellow})

" help.vim
highlight! link helpHyperTextJump Tag
highlight! link helpURL Underlined

" javascript.vim
highlight! link javaScriptFunction Keyword
highlight! link javaScriptBraces Operator
highlight! link javaScriptParens Operator
highlight! link javaScriptValue Constant

" lua.vim
highlight! link luaFunction Keyword

" matchparen.vim
call s:h('MatchParen', #{fg: s:orange, bg: s:bg_active,
            \            gui: 'bold', cterm: 'bold'})

" rust.vim
highlight! link rustLifetime StorageClass
highlight! link rustModPath Identifier
highlight! link rustSelf Keyword

" vim.vim
highlight! link vimCommentTitle SpecialComment
highlight! link vimCommentString Comment
highlight! link vimHiBang Special
highlight! link vimOperParen Special

" zig.vim
highlight! link zigDummyVariable Special
highlight! link zigEscape SpecialChar
highlight! link zigMacro Keyword
highlight! link zigMultilineStringDelimiter String
highlight! link zigVarDecl Keyword
" }}}

" New default colors in 0.10 no longer have links to some groups, restore them
highlight! link WinSeparator VertSplit
highlight! link NormalFloat Pmenu

highlight! link FloatTitle NormalFloat
call s:h('FloatBorder', #{fg: s:norm_most_subtle, bg: s:bg_most_subtle})



" vim: et tw=80 sw=4

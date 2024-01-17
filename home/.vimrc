syntax enable
filetype on
filetype indent on
set t_Co=256
set number
"set relativenumber
set cursorline
set colorcolumn=80
set vb
set t_vb=""
set noeb
set showmode
set showcmd
set encoding=utf-8
set list
set listchars=trail:·,tab:»·»,nbsp:+,extends:→,precedes:←
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

let mapleader=" "
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <c-n> :bn<cr>
nmap <c-p> :bp<cr>
nmap <c-x>k :bd<cr>
nmap <c-x><c-e> :wqa<cr>
nmap <leader>nh :nohl<cr>
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


hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
hi Statusline ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatuslineNC ctermfg=NONE ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=bold
hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=bold,reverse
hi QuickFixLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=106 ctermbg=235 cterm=bold
hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
hi LineNrAbove ctermfg=NONE ctermbg=NONE cterm=NONE
hi LineNrBelow ctermfg=NONE ctermbg=NONE cterm=NONE
hi NonText ctermfg=243 ctermbg=NONE cterm=NONE
hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=243 ctermbg=NONE cterm=NONE
hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
hi Visual ctermfg=NONE ctermbg=106 cterm=NONE
hi VisualNOS ctermfg=NONE ctermbg=106 cterm=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuThumb ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuKind ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuKindSel ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuExtra ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuExtraSel ctermfg=NONE ctermbg=NONE cterm=NONE
hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
hi Error ctermfg=NONE ctermbg=NONE cterm=reverse
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=reverse
hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo ctermfg=NONE ctermbg=NONE cterm=reverse
hi MatchParen ctermfg=NONE ctermbg=NONE cterm=bold
hi Search ctermfg=255 ctermbg=113 cterm=NONE
hi IncSearch ctermfg=255 ctermbg=113 cterm=NONE
hi CurSearch ctermfg=255 ctermbg=113 cterm=NONE
hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi debugPC ctermfg=NONE ctermbg=NONE cterm=NONE
hi debugBreakpoint ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
hi Folded ctermfg=NONE ctermbg=NONE cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
hi Comment ctermfg=243 ctermbg=NONE cterm=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE
hi String ctermfg=NONE ctermbg=NONE cterm=NONE
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE
hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
hi Statement ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc ctermfg=NONE ctermbg=NONE cterm=NONE
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE
hi Special ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi Title ctermfg=NONE ctermbg=NONE cterm=bold
hi Directory ctermfg=NONE ctermbg=NONE cterm=bold
hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
hi Debug ctermfg=NONE ctermbg=NONE cterm=NONE
hi DiffAdd ctermfg=NONE ctermbg=28 cterm=bold
hi DiffDelete ctermfg=NONE ctermbg=160 cterm=bold
hi diffAdded ctermfg=NONE ctermbg=76 cterm=bold
hi diffRemoved ctermfg=NONE ctermbg=166 cterm=bold
hi diffSubname ctermfg=NONE ctermbg=28 cterm=NONE
hi DiffText term=reverse cterm=bold ctermbg=NONE
hi DiffChange ctermfg=NONE ctermbg=76 cterm=bold
hi! link Terminal Normal
hi! link StatuslineTerm Statusline
hi! link StatuslineTermNC StatuslineNC
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi! link sqlKeyword Statement
hi! link yamlBlockMappingKey Statement
hi! link vimVar Normal
hi! link vimOper Normal
hi! link vimSep Normal
hi! link vimParenSep Normal
hi! link vimCommentString Comment
hi! link gitCommitSummary Title
hi! link markdownUrl String

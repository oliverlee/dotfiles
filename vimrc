"set ts=4 sw=4 ai noet
"set et sw=4 sts=4 ts=4 ai
set expandtab shiftwidth=4 softtabstop=4 tabstop=4 autoindent
set list listchars=tab:»\ ,trail:·

set secure                                                  " disable unsafe commands in local .vimrc files
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8    " saving and encoding
set hlsearch                                                " highlight search terms
set wildmenu                                                " completion
set backspace=indent,eol,start                              " sane backspace
set clipboard=unnamedplus                                   " use system clipboard for yank/put/delete
set mouse=a                                                 " enable mouse for all modes settings
set nomousehide                                             " don't hide the mouse cursor while typing
set mousemodel=popup                                        " right-click pops up context menu
set ruler                                                   " show cursor position in status bar
set number                                                  " show line numbers
set nofoldenable                                            " disable code folding
set scrolloff=10                                            " scroll the window so we can always see 10 lines around the cursor
set textwidth=80                                            " default textwidth
set cursorline                                              " highlight current line
set guioptions-=T                                           " turn off GUI toolbar (icons)
set guioptions-=r                                           " turn off GUI right scrollbar
set guioptions-=L                                           " turn off GUI left scrollbar
set laststatus=2                                            " always show status bar
set spell spelllang=en                                      " turn on spell check for US

" middle-click paste
map! <S-Insert> <MiddleMouse>

colorscheme alshain
if has('gui_running')
  set guifont=Monospace\ 11
  set guicursor=n-c:block-Cursor
  set guicursor=i:ver20-iCursor
  set guicursor=v:blink-Cursor-blinkwait10-blinkon200-blinkoff150
endif
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"                " vertical bar in insert mode
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"                " underline
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"                " block in normal mode
endif

" appearance
syntax on                                                   " enable syntax highlighting
set background=dark
set t_Co=256                                                " 256 colors in terminal
filetype indent plugin on                                   " use filetype specific indent rules
let &colorcolumn="80,".join(range(120,999),",")             " highlight column 80 and 120 and onward
highlight ColorColumn ctermbg=235 guibg=#2c2d27

highlight clear SpellBad                                    " underline misspelled words
highlight SpellBad cterm=underline
highlight clear SpellCap                                    " don't highlight non capitalized words

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
"autocmd BufNewFile,BufReadPost *.yaml,*.yml so ~/.vim/yaml.vim
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 autoindent
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType cpp setlocal textwidth=120
autocmd FileType tex setlocal textwidth=80
autocmd FileType make setlocal expandtab!
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

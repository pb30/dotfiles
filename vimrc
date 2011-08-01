colorscheme customdante
set background=light
syntax on " Enable syntax highlighting

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/gmarik/vundle.git'
Bundle 'git://github.com/rstacruz/sparkup.git', {'rtp': 'vim/'}
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/spf13/PIV.git'
Bundle 'git://github.com/vim-scripts/HTML-AutoCloseTag.git'
Bundle 'git://github.com/Raimondi/delimitMate.git'
Bundle 'git://github.com/msanders/snipmate.vim.git'
"Bundle 'ervandew/supertab'

filetype plugin indent on

set showmode      " Always display current mode

                  " Indentation
set smartindent   "   Indent after {
set autoindent    "   Match previous line indentation
set expandtab     "   Expand tab to spaces
set tabstop=4     "   4 spaces = tab
set softtabstop=4 "   4 spaces = tab
set shiftwidth=4  "   4 spaces = tab

                  " Search
set ignorecase    "   Set search to case-insensitive
set hlsearch      "   Highlight search results
set incsearch     "   Start highlighting matches when typing in search

set number        " Enable line numbering
set showmatch

set autoread      " If file has changed outside vim, and not inside, reload

set nobackup      " Disable backups
set nowritebackup
set noswapfile


" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\(\s\+$\|\t\)/

" Enter in normal mode will insert empty line
nmap <CR> _i<Enter><Esc>
" Space in normal mode will insert space after cursor
nnoremap <Space> i<Space><Esc>

" PHP syntax checking with :make
set makeprg=php\ -l\ %
autocmd QuickFixCmdPre make w
set errorformat=%m\ in\ %f\ on\ line\ %l

" Disable PIV's PHP code folding
set foldlevelstart=99
let g:DisableAutoPHPFolding = 1

filetype plugin on
set ofu=syntaxcomplete#Complete

" Autocomplete braces/quotes
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Space><Space><Space><Space>
inoremap {{     {
inoremap {}     {}
inoremap /*          /**/<Left><Left>
inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>      /*<CR>*/<Esc>O
inoremap =" =""<Left>
inoremap =' ='' <Left>
inoremap <lt>?php <?php  ?><Left><Left><Left><Left>
inoremap <lt>?php<CR> <?php<CR>?><Esc>O<Space><Space><Space><Space>

" \c to display underline the current line
nnoremap <Leader>c :set cursorline! <CR>

" Comment out lines
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>

" w!! to save file as sudo, if you forgot to do sudo vim
cmap w!! %!sudo tee > /dev/null %


" Plugins
"   \hlt - will reveal a linked list of highlighting from the top-level down to the bottom level
"

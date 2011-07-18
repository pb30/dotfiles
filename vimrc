colorscheme default
set background=light
syntax on " Enable syntax highlighting
highlight htmlString ctermfg=white
highlight phpStringSingle ctermfg=white
highlight phpStringDouble ctermfg=white
highlight phpFunctions ctermfg=green
highlight phpComment ctermfg=darkgray

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

highlight LineNr ctermbg=black ctermfg=darkblue

" Enter in normal mode will insert empty line
nmap <CR> _i<Enter><Esc>
" Space in normal mode will insert space after cursor
nnoremap <Space> i<Space><Esc>

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\(\s\+$\|\t\)/

" PHP syntax checking with :make
set makeprg=php\ -l\ %
autocmd QuickFixCmdPre make w
set errorformat=%m\ in\ %f\ on\ line\ %l

filetype plugin on
set ofu=syntaxcomplete#Complete

" Autocomplete HTML tag on <// 
inoremap <lt>// </<C-X><C-O>
inoremap {      { }<Left><Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap /*          /**/<Left><Left>
inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>      /*<CR>*/<Esc>O
inoremap =" =""<Left>
inoremap =' ='' <Left>
inoremap <lt>?php <?php ?><Left><Left><Left>

" \c to display underline the current line
nnoremap <Leader>c :set cursorline! <CR>

" Comment out lines
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>

" w!! to save file as sudo, if you forgot to do sudo vim
cmap w!! %!sudo tee > /dev/null %

syntax on " Enable syntax highlighting
set background=light
colorscheme customdante

""""""""""""""""""" Vundle
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
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/mileszs/ack.vim.git'
Bundle 'git://github.com/kergoth/vim-HiLinkTrace.git'
Bundle 'git://github.com/fholgado/minibufexpl.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/vim-scripts/vcscommand.vim.git'

filetype plugin indent on


""""""""""""""""""" Basic Options
set showmode        " Always display current mode
set relativenumber  " Display line numbers relative to cursor
set nocompatible    " Disable Vi defaults
set encoding=utf-8  " Encoding
set modelines=0     " Disable modelines in files
set showmatch       " Briefly highlight matching bracket when typing
set wildmenu        " Show list/menu when tab completing commands
"set number         " Enable line numbering
let mapleader = "," " Remap leader from \
set backspace=indent,eol,start


""""""""""""""""""" Indentation
set smartindent     " Indent after {
set autoindent      " Match previous line indentation
set expandtab       " Expand tab to spaces
set tabstop=4       " 4 spaces = tab
set softtabstop=4   " 4 spaces = tab
set shiftwidth=4    " 4 spaces = tab


""""""""""""""""""" Search
set ignorecase      " Set search to case-insensitive
set smartcase       " If search contains uppercase, make it case sensitive
set hlsearch        " Highlight search results
set incsearch       " Start highlighting matches when typing in search
set gdefault        " Apply substitutions globally by default


""""""""""""""""""" File Handling
set autoread        " If file has changed outside vim, and not inside, reload
set nobackup        " Disable backups
set nowritebackup   " Disable backups when overwriting a file
set noswapfile


"""""""""""""""""" Autocomplete
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


"""""""""""""""""" Key Commands
" Enter in normal mode will insert empty line
    nmap <CR> _i<Enter><Esc>
" Space in normal mode will insert space after cursor
    nnoremap <Space> i<Space><Esc>
" Clear search highlighting
    nnoremap <leader><space> :noh<cr>
" Display underline on the current line
    nnoremap <Leader>c :set cursorline! <CR>
" w!! to save file as sudo, if you forgot to do sudo vim
    cmap w!! %!sudo tee > /dev/null %
" Strip trailing whitespace with ,W
    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>'
"One less key to hit when trying to save
    nnoremap ; :
" Search current directory with ack using ,a
    nnoremap <leader>a :Ack<space>
" Reselect pasted text (to do indentation, etc) with ,v
    nnoremap <leader>v V`]
" Toggle line numbering
    nnoremap <leader>n :set invrelativenumber<CR>


"""""""""""""""""" PHP
" PHP syntax checking with :make
    set makeprg=php\ -l\ %
    autocmd QuickFixCmdPre make w
    set errorformat=%m\ in\ %f\ on\ line\ %l
" Disable PIV's PHP code folding on open, enable with ,f
    let g:DisableAutoPHPFolding = 1
    nnoremap <leader>f :EnablePHPFolds<CR>:set foldlevel=1<CR>


"""""""""""""""""" Plugins
" MiniBufExplorer
map <Leader>b :MiniBufExplorer<cr>
" NERDTree
map <Leader>t :NERDTree<cr>


"""""""""""""""""" Misc
set ofu=syntaxcomplete#Complete
" Highlight extra whitespace
    highlight ExtraWhitespace ctermbg=darkgreen
    match ExtraWhitespace /\(\s\+$\|\t\)/




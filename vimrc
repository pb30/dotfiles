set t_Co=256 " Enable 256 colors
syntax on    " Enable syntax highlighting
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
hi LineNr ctermbg=black
hi SignColumn ctermbg=black


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
Bundle 'git://github.com/gerw/vim-HiLinkTrace.git'
Bundle 'git://github.com/fholgado/minibufexpl.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/vim-scripts/vcscommand.vim.git'
Bundle 'git://github.com/vim-scripts/matchit.zip.git'
Bundle 'git://github.com/airblade/vim-gitgutter.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'

filetype plugin indent on


""""""""""""""""""" Basic Options
set showmode        " Always display current mode
set nocompatible    " Disable Vi defaults
set encoding=utf-8  " Encoding
set modelines=0     " Disable modelines in files
set showmatch       " Briefly highlight matching bracket when typing
set wildmenu        " Show list/menu when tab completing commands
set mouse=a         " Enable mouse use to select windows, tabs, resize
let mapleader = "," " Remap leader from \
set backspace=indent,eol,start
if v:version >= 703
	set relativenumber  " Display line numbers relative to cursor
else
	set number         " Enable line numbering
endif


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


"""""""""""""""""" Statusline
set statusline=%t       " Tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " File encoding
set statusline+=%{&ff}] " File format
set statusline+=%h      " Help file flag
set statusline+=%m      " Modified flag
set statusline+=%r      " Read only flag
set statusline+=%y      " Filetype
set statusline+=%=      " Left/right separator
set statusline+=%c,     " Cursor column
set statusline+=%l/%L   " Cursor line/total lines
set statusline+=\ %P    " Percent through file

set laststatus=2        " Always show statusline


"""""""""""""""""" Windows
map <C-J> 10<C-W>_<C-W>j
map <C-K> 10<C-W>_<C-W>k
map <C-L> 10<C-W>_<C-W>l
map <C-H> 10<C-W>_<C-W>h


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
" Yank to end of line
    map Y yy
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
" Toggle paste mode to prevent vim reindenting code
    nnoremap <leader>v :set invpaste<CR>
" Toggle line numbering
	if v:version >= 703
		nnoremap <leader>n :set invrelativenumber<CR>
	else
		nnoremap <leader>n :set invnumber<CR>
	endif
" Search/Replace
    nnoremap <leader>s :%s//<left>
" Stupid help menu right next to the ESC key...
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>


"""""""""""""""""" PHP
" PHP syntax checking with :make
    set makeprg=php\ -l\ %
    autocmd QuickFixCmdPre make w
    set errorformat=%m\ in\ %f\ on\ line\ %l
" Disable PIV's PHP code folding on open, enable with ,f
    set foldlevel=99
    set foldlevelstart=99
    let g:DisableAutoPHPFolding = 1
    nnoremap <leader>f :EnablePHPFolds<CR>:set foldlevel=1<CR>


"""""""""""""""""" Plugins
" MiniBufExplorer
map <Leader>b :MiniBufExplorer<cr>
" NERDTree
map <Leader>t :NERDTree<cr>
" gitgutter (next/prev changed hunk)
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>
" CtrlP
map <Leader>p :CtrlP<cr>

"""""""""""""""""" Misc
set ofu=syntaxcomplete#Complete
" Highlight VCS conflict markers
"    match ErrorMsg /^\(<\|=\|>\|\\|\)\{7\}\([^=].\+\)\?$/
" Highlight extra whitespace
    highlight ExtraWhitespace ctermbg=darkgreen
    match ExtraWhitespace /\(\s\+$\|\t\)/

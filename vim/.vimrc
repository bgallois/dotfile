set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim
syntax on
color harlequin
set smartindent
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
set noswapfile

" airline
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1 
let g:airline#extensions#hunks#enabled = 1

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" Shortcut to navigate multiple files in one vim
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <C-Up> gT
map <C-Down> gt

" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

execute pathogen#infect()
call pathogen#helptags()

map <C-I> :py3f ~/.vim/bundle/clang-format/clang-format.py<cr>
imap <C-I> <c-o>:py3f ~/.vim/bundle/clang-format/clang-format.py<cr>

set noruler
set noshowmode
set hidden

inoremap ii <Esc> 

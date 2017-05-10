set nocompatible              " be iMproved, required
filetype off                  " required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'nvie/vim-flake8'

Plugin 'dbext.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'hdima/python-syntax'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'bps/vim-textobj-python' 
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'davidhalter/jedi-vim'
Plugin 'google/yapf'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fweep/vim-zsh-path-completion'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

syntax enable

noremap <leader>git :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs firefox<CR><CR>

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

noremap <F3> :Autoformat<CR>
set clipboard=unnamedplus
let g:pymode_lint_config = '$HOME/.pylint.rc'
set nofoldenable
let g:formatter_yapf_style = 'pep8'
let g:indentLine_char = '|'
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239

nnoremap <S-k> :m-2<CR>==
nnoremap <S-j> :m+<CR>==
vnoremap <S-k> :m-2<CR>gv=gv
vnoremap <S-j> :m'>+<CR>gv=gv

map H ^
map L $

map <silent> <leader>b oimport pdb; pdb set_trace()<esc>
map <silent> <leader>B Oimport pdb; pdb set_trace()<esc>
command! W :w
hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
set laststatus=2
set t_Co=256
"let g:ale_sign_column_always = 1
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
nmap <F8> :TagbarToggle<CR>

let g:airline_powerline_fonts=1 
let g:airline_theme = 'luna'
"let g:airline_solarized_bg = 'dark'

"disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


set splitbelow
set splitright

set spell spelllang=en_us
set relativenumber
set nu
set ruler
set showcmd
set cursorline
set wrap
map <C-n> :NERDTreeToggle<CR>
hi SpellBad    ctermfg=015      ctermbg=000     cterm=underline      guifg=#FFFFFF   guibg=#000000   gui=none
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let python_highlight_all = 1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
noremap n nzz
noremap N Nzz
noremap j jzz
noremap k kzz


"" html
"" for html files, 2 spaces
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

"" javascript
let g:javascript_enable_domhtmlcss = 1

"" vim-javascript
augroup vimrc-javascript
	autocmd!
	autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4 smartindent
augroup END

"" python
"" vim-python
augroup vimrc-python
	autocmd!
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=120
	        \ formatoptions+=croq softtabstop=4 smartindent
	        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

set nocompatible              " be iMproved, required
filetype off                  " required
" let g:python3_host_prog = '/usr/local/bin/python3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"""""" PLUGIN INSTALLER
Plugin 'VundleVim/Vundle.vim'
"""""" GIT WRAPPER
Plugin 'tpope/vim-fugitive'
"""""" FUZZY FILE FINDER
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
"""""" LIGHT CURRENT LINE
Plugin 'itchyny/lightline.vim'
"""""" MULTIPLE CURSORS WITH CTRL-N
Plugin 'terryma/vim-multiple-cursors'
"""""" NERDTREE
Plugin 'Xuyuanp/nerdtree-git-plugin'
"""""" SHOW TAGBAR
Plugin 'majutsushi/tagbar'
"""""" ADD CLOSING TAGS FOR CERTAIN THINGS
Plugin 'Townk/vim-autoclose'
"""""" GC COMMENTS
Plugin 'tomtom/tcomment_vim'
Plugin 'moll/vim-bbye'
Plugin 'StanAngeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'stephpy/vim-php-cs-fixer'
"""""" ERRORS AND OTHER STUFF THAT ARE FANTASTIC
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"""""" MOVE AROUND PAGE BETTER
Plugin 'easymotion/vim-easymotion'
Plugin 'ayu-theme/ayu-vim'
Plugin 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
"Plugin 'kristijanhusak/deoplete-phpactor'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'ervandew/supertab'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'joshdick/onedark.vim'
Plugin 'airblade/vim-gitgutter'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'craigemery/vim-autotag'
Plugin 'mileszs/ack.vim'


" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'dracula/vim'
Plugin 'gre/play2vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
color dracula
"" colorscheme ayu
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }
" let g:airline_theme='onedark'

Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

execute pathogen#infect()
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
"filetype plugin indent on

" TODO: Pick a leader key
 let mapleader = "  "

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=50
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! config/**/*.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" let mapleader="\"

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

:nnoremap <Leader>b :Bdelete<CR>

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

execute pathogen#infect()

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_exec = './bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_php_phpmd_exec = './bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

set tags=tags
set path=.
"set tags=./tags,tags;$HOME

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
set rtp+=/usr/local/opt/fzf

if !has('gui_running')
  set t_Co=256
endif

map <C-b> :NERDTreeToggle<CR>
" SHOW TAGS
map <C-m> :TagbarToggle<CR>



" If php-cs-fixer is in $PATH, you don't need to define line below
"  let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
"let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
set rtp+=/usr/local/opt/fzf
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
"
" let g:deoplete#enable_at_startup = 1
"
" let g:deoplete#sources = {}
" let g:deoplete#sources.php = ['omni', 'phpactor', 'ultisnips', 'buffer']
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
"autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true

"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

set completeopt=longest,menuone

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>U <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>U :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
let g:ctrlp_max_files=0

nnoremap <c-p> :FZF<cr>

vmap <c-y> "+yy
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

function! AllReplace()
  let result = getreg("")
  let search = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]]
  let test = "%s/" . search .  "/" . result . "/gc"
  execute test
endfunction
vmap <Leader>y :call AllReplace()<CR>

set complete-=i
set cursorline
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = '~/.vim/gutentags'
map <silent> <leader>jd :CtrlPTag<cr><c-\>w

nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

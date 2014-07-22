set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/git-nerdtree'
Plugin 'widox/vim-buffer-explorer-plugin'

Plugin 'altercation/vim-colors-solarized.git'

" syntax plugins
Plugin 'stephpy/vim-phpdoc'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'm2mdas/phpcomplete-extended'

Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pekepeke/titanium-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'

Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic.git'

Plugin 'othree/html5.vim'

Plugin 'ap/vim-css-color'
"Plugin 'JulesWang/css.vim' // only necessary if your Vim version < 7.4
Plugin 'cakebaker/scss-syntax.vim'

Plugin 'matze/vim-move'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'mileszs/ack.vim'
"Plugin 'majutsushi/tagbar'
Plugin 'gregsexton/MatchTag'
Plugin 'henrik/vim-indexed-search'
Plugin 'kshenoy/vim-signature'
Plugin 'sk1418/HowMuch'
Plugin 'bling/vim-airline'

" vim-scripts repos
Plugin 'AutoComplPop'
Plugin 'SearchComplete'
Plugin 'ShowMarks'
Plugin 'CmdlineComplete'
Plugin 'Conque-Shell'

" non github repos
"Plugin 'git://git.wincent.com/command-t.git'
" ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..



" General {
    set fileencoding=utf-8 " Encodage des caractères pour les fichiers
    set enc=utf-8       " Encodage utilisé par vim (conversion effectué si différent de fileencoding)
    set tenc=utf-8  " Encodage utilisé par vim (conversion effectué si différent de fileencoding)

    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set autochdir              " do not switch to the current file directory..
    set fileformat=unix
    " not every vim is compiled with this, use the following line instead
    " If you use command-t plugin, it conflicts with this, comment it out.
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    "scriptencoding utf-8
    " set autowrite                  " automatically write a file when leaving a modified buffer
    set hid                         "Change buffer - without saving
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)


    " Setting up the directories {
        set backup                       " backups are nice ...
        set backupdir=$HOME/.vimbackup// " but not when they clog .
        set directory=$HOME/.vimswap//   " Same for swap files
        set viewdir=$HOME/.vimviews//    " same for view files

        " Creating directories if they don't exist
        silent execute '!mkdir -p $HOME/.vimbackup'
        silent execute '!mkdir -p $HOME/.vimswap'
        silent execute '!mkdir -p $HOME/.vimviews'
        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" Vim UI {
    "colo professional                 "   load a colorscheme
    "color nuvola                    "load a colorscheme
    "color peachpuff

    "set background=light
    let g:solarized_termcolors=256
    set background=light
    colorscheme solarized
    set showmode                    " display the current mode

    set cursorline                  " highlight current line
    hi cursorline guibg=#EEEEEE     " highlight bg color of current line
    hi CursorColumn guibg=#EEEEEE   " highlight cursor

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2            " show statusline only if there are > 1 windows
    endif

    set backspace=indent,eol,start  " backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set magic                       "Set magic on, for regular expressions
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set nofoldenable                " auto fold code
    set gdefault                    " the /g flag on :s substitutions by default

" }

" Formatting {
    set wrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set si                          "Smart indet
    set tabstop=4                   " an indentation every four columns
    set shiftwidth=4                " use indents of 4 spaces
    set softtabstop=4
    set smarttab
    set expandtab                 " tabs are tabs, not spaces
    set lbr
    set tw=500
    set matchpairs+=<:>             " match, to be used with %
    autocmd FileType html :setlocal sw=2 ts=2 sts=2
    autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
" }

" Key Mappings {

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Shortcuts
    " Change Working Directory to that of the current file
    "cmap cwd lcd %:p:h

" }

" Plugins {

    let php_sql_query=1 "Coloration des requetes SQL
    let php_htmlInStrings=1 "Coloration des balises html


    " ShowMarks {
        let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "toggle ShowMarks On and off
        :map <C-F2> <ESC>\mt<CR><ESC>
        "Places the next available mark
        :map <C-F3> <ESC>\mm<CR><ESC>
        " Don't leave on by default, use :ShowMarksOn to enable
        let g:showmarks_enable = 1
        " For marks a-z
        highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
        " For marks A-Z
        highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
        " For all other marks
        highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
        " For multiple marks on the same line.
        highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
    " }

    " AUTO COMPLETION {
        set complete=.,w,b,u,t,i,k~/.vim/syntax/php.api
        autocmd FileType php set omnifunc=phpcomplete#CompletePHP

        if has("autocmd")
            autocmd BufEnter *.phtml set syn=php
            autocmd BufEnter *.module set syn=php
            autocmd BufEnter *.install set syn=php
            autocmd BufEnter *.tpl set syn=php
            autocmd BufEnter *.mod set syn=php
            autocmd BufEnter *.inc set syn=php
        endif
    " }

    " Ctags {
        set tags+=./tags,tags;
    " }

    " PhpDocs {
        "source ~/.vim/plugin/php-doc.vim
        inoremap <C-o> <ESC>:call PhpDocSingle()<CR>i
        nnoremap <C-o> :call PhpDocSingle()<CR>
        vnoremap <C-o> :call PhpDocRange()<CR>
        let g:pdv_cfg_Author = "Erwan INYZANT <erwan@garden-media.fr>"
        let g:pdf_cfg_Copyrigth = "SAS1080 2014"
    " }

    " CtrlP {
        nnoremap <C-f> :CtrlP ~/working_dir/current-repo/digitick<CR>
    "}
    " NERDCommenter {
        :map <C-c> <leader>cc<CR>
        :map <C-x> <leader>cu<CR>
    " }

    " airline {
        let g:airline_theme='powerlineish'
        let g:airline_powerline_fonts=1
        set t_Co=256
        let g:airline_enable_branch     = 1
        let g:airline_enable_syntastic  = 1

    " }

    " Syntastic {
        " Global Options
        let g:syntastic_enable_balloons = 0
        let g:syntastic_enable_highlighting = 0
        let g:syntastic_auto_loc_list=1
        let g:syntastic_auto_jump=0
        let g:syntastic_mode_map = { 'mode': 'active',
           \ 'active_filetypes': ['js', 'php'],
           \ 'passive_filetypes': [] }

        " Checker Options
        let g:syntastic_php_checkers = ['php']
        "let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
        let g:syntastic_php_phpcs_post_args="--warning-severity=6"
        let g:syntastic_js_checkers = ['jshint']
        let g:syntastic_css_checkers = []

        let g:syntastic_html_tidy_ignore_errors = [
            \"trimming empty <i>",
            \"trimming empty <b>",
            \"trimming empty <li>",
            \"trimming empty <span>",
            \"trimming empty <button>",
            \"<input> proprietary attribute \"autocomplete\"",
            \"proprietary attribute",
            \"unescaped &",
            \"escaping malformed URI reference",
            \"capture",
        \]

    " }

    " Ack {
        let g:ackprg = "/usr/local/bin/ack --noenv --smart-case --type-add php=.inc,.mod --php --css --html --js --xml --flush -H --nocolor --nogroup --column"
    " }

    " Fugitive {
        set previewheight=40
    " }

    " phpfolding {
        map <F5> <Esc>:EnableFastPHPFolds<Cr>
        map <F6> <Esc>:EnablePHPFolds<Cr>
        map <F7> <Esc>:DisablePHPFolds<Cr>
        let g:DisableAutoPHPFolding = 1
    " }

    " Javascript libraries syntax {
        let g:used_javascript_libs = 'jquery,angularjs,angularui'
    " }
" }



let g:NERDTreeChDirMode = 0

map <F6> <ESC>:NERDTreeToggle<CR>
map <F3> :e ~/.vimrc<CR>
map <F2> :source ~/.vimrc<CR>
map <C-g> g<C-]>
map <F4> <ESC>:TagbarToggle<CR>

map <F9> <Esc>:w<ENTER>y<ECHAP>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" My Plugins here:
"
" original repos on github
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'widox/vim-buffer-explorer-plugin'
Plug 'altercation/vim-colors-solarized'

" syntax plugins
"Plug 'shawncplus/phpcomplete.vim'
"Plug 'Rican7/php-doc-modded'
Plug 'eInyzant/vim-phpdoc'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'evidens/vim-twig'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py --all'}
"Plug 'ycm-core/lsp-examples', { 'do': 'python3 ./install.py --lang-php'}

Plug 'Shougo/defx.nvim'
Plug 't9md/vim-choosewin'
Plug 'kristijanhusak/defx-git'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': '/home/erwan/.local/bin/composer.phar install' }


Plug 'fs111/pydoc.vim'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" Linter + fixer :
Plug 'dense-analysis/ale'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete-flow.vim'
"Plug 'yami-beta/asyncomplete-omni.vim'
"Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
"Plug 'felixfbecker/php-language-server', {'do': 'composer install && composer run-script --working-dir=. parse-stubs'}
"Plug 'ryanolsonx/vim-lsp-python'

Plug 'tweekmonster/django-plus.vim'

Plug 'ap/vim-css-color'

Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'henrik/vim-indexed-search'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'


" vim-scripts repos
"Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/ShowMarks'
Plug 'vim-scripts/CmdlineComplete'
Plug 'vim-scripts/Conque-Shell'

" For automatic ctags indexing
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'


" non github repos
"Plug 'git://git.wincent.com/command-t.git'
" ...

" Initialize plugin system
call plug#end()

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
	"set autochdir              " do not switch to the current file directory..
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
	set si                          "Smart indet

	set autoindent
	"set expandtab                 " tabs are tabs, not spaces
	set expandtab
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2


	"set smarttab
	set lbr
	set tw=500
	set matchpairs+=<:>             " match, to be used with %
	autocmd FileType html :setlocal sw=2 ts=2 sts=2 noexpandtab
	autocmd FileType javascript :setlocal sw=2 ts=2 sts=2 expandtab
	autocmd FileType jade :setlocal sw=2 ts=2 sts=2 expandtab
	autocmd FileType less :setlocal sw=2 ts=2 sts=2 expandtab
	autocmd FileType typescript :setlocal sw=2 ts=2 sts=2 expandtab
	autocmd FileType php :setlocal sw=4 ts=4 sts=4 expandtab
	autocmd FileType python :setlocal sw=4 ts=4 sts=4 expandtab
  autocmd FileType python set ft=python.django
  autocmd FileType vue syntax sync fromstart

" }

" Key Mappings {

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	let mapleader=","

	" Shortcuts
	" Change Working Directory to that of the current file
	"cmap cwd lcd %:p:h

" }

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

" Plugins {

	let php_sql_query=1 "Coloration des requetes SQL
	let php_htmlInStrings=1 "Coloration des balises html

  " Ale {
    let g:ale_set_loclist = 1
    let g:ale_set_quickfix = 0
    let g:ale_completion_enabled=0
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_on_enter = 0
    let g:ale_fix_on_save = 0
    let g:ale_linters = {
      \ 'javascript':['eslint'],
      \ 'javascriptreact': ['javascript', 'jsx'],
      \ 'zsh': 'sh',
      \ 'vue': ['vue', 'javascript'],
      \ 'python': ['pyflakes', 'pycodestyle', 'pylint', 'prospector'],
      \ 'php': []
    \}
    " \ 'php': ['phpcbf', 'phpcs']
    let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'php': [],
      \   'python': ['black', 'remove_trailing_lines', 'trim_whitespace'],
    \}
    "\   'python': ['autopep8', 'black', 'isort', 'yapf', 'add_blank_lines_for_python_control_statements'],
    "phpcbf
    let g:ale_python_pyflakes_executable = 'pyflakes3'
    let g:ale_python_pylint_executable = 'pylint3'
    let g:ale_python_pylint_options = '--rcfile $HOME/pylint.rc'
    let g:ale_python_pycodestyle_options = '--max-line-length=100'
  " }

  " LANGUAGE SERVER PROTOCOL {
    "au User lsp_setup call lsp#register_server({
     "\ 'name': 'php-language-server',
     "\ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
     "\ 'whitelist': ['php'],
     "\ })

    if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
    endif
  " }

  " Autosync completion {
    "inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    "inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
    "set completeopt+=preview
    "let g:asyncomplete_auto_popup = 1
    "autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    "au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
    "\ 'name': 'flow',
    "\ 'whitelist': ['javascript'],
    "\ 'completor': function('asyncomplete#sources#flow#completor'),
    "\ 'config': {
    "\    'prefer_local': 1,
    "\    'flowbin_path': expand('~/bin/flow'),
    "\    'show_typeinfo': 1
    "\  },
    "\ }))

    "if has('python3')
      "let g:UltiSnipsExpandTrigger="<c-e>"
      "call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
          "\ 'name': 'ultisnips',
          "\ 'whitelist': ['*'],
          "\ 'completor': function('asyncomplete#sources#ultisnips#completor'),
          "\ }))
    "endif
  " }

  " YouCompleteMe {
    set completeopt=preview,menuone
    let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
    let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
    let g:ycm_complete_in_comments = 1 " Completion in comments
    let g:ycm_complete_in_strings = 1 " Completion in string
    let g:ycm_python_binary_path = '/var/www/html/Localhost/la-belle-vie/venv/bin/python'
    let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 0
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_min_num_of_chars_for_completion = 2
    let g:ycm_max_num_candidates = 50
    let g:ycm_max_num_candidates_to_detail = 0
    let g:ycm_max_num_identifier_candidates = 10
    let g:ycm_auto_trigger = 1
    let g:ycm_always_populate_location_list = 1

    let g:ycm_key_list_stop_completion = ['<C-y>']

    "source /home/erwan/.vim/plugged/lsp-examples/vimrc.generated
  " }

  " Deoplete {
    let g:deoplete#enable_at_startup = 1
    "let g:python3_host_prog = expand('/usr/bin/python3')
    let g:neosnippet#enable_completed_snippet = 1
    let g:deoplete#sources#jedi#show_docstring = 1
    let g:autocomplete_flow#insert_paren_after_function = 0
    call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
    call deoplete#custom#option('ignore_sources', {'php': ['omni']})
    "call deoplete#custom#option('sources', {'php' : ['omni', 'phpactor', 'ultisnips', 'buffer']})
    "call deoplete#custom#option('sources', {'python' : ['around', 'member', 'omni', 'buffer', 'defx', 'file', 'jedi', 'ultisnips']})
    call deoplete#custom#option({
      \ 'candidate_marks': ['a','z','e', 'r','p','o','i'],
      \ 'max_list': 100,
      \ 'num_processes': 4
      \ })
    call deoplete#custom#source('LanguageClient','mark', 'ℰ')
    call deoplete#custom#source('omni',          'mark', '⌾')
    call deoplete#custom#source('flow',          'mark', '⌁')
    call deoplete#custom#source('TernJS',        'mark', '⌁')
    call deoplete#custom#source('jedi',          'mark', '⌁')
    call deoplete#custom#source('vim',           'mark', '⌁')
    call deoplete#custom#source('ultisnips',     'mark', '⌘')
    call deoplete#custom#source('around',        'mark', '↻')
    call deoplete#custom#source('buffer',        'mark', 'ℬ')
    call deoplete#custom#source('tmux-complete', 'mark', '⊶')
    call deoplete#custom#source('syntax',        'mark', '♯')
    call deoplete#custom#source('member',        'mark', '.')

    " register omni
    call deoplete#custom#source('omni', 'functions', {
    \ 'html': 'htmlcomplete#CompleteTags',
    \ 'css' : 'csscomplete#CompleteCSS',
    \ 'scss' : 'csscomplete#CompleteCSS',
    \ 'sass' : 'csscomplete#CompleteCSS',
    \ 'xml' : 'xmlcomplete#CompleteTags',
    \ 'markdown' : 'htmlcomplete#CompleteTags',
    \ })

    call deoplete#custom#source('omni', 'input_patterns', {
    \ 'html' : '<[^>]',
    \ 'css'  : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'scss' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'sass' : '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]',
    \ 'xml'  : '<[^>]*',
    \ 'md'   : '<[^>]*',
    \})
  "}
  "
  " Defx {
    "let g:vimfiler_as_default_explorer = 1
    map ,ex <ESC>:Defx -auto-cd -split=vertical -resume -toggle -winwidth=50 -columns=git:mark:indent:icon:filename:type<CR>
    "call vimfiler#custom#profile('default', 'context', {
          "\ 'safe' : 0,
          "\ })
	  call defx#custom#column('icon', {
	      \ 'directory_icon': '▸',
	      \ 'opened_icon': '▾',
	      \ 'root_icon': ' ',
	      \ })
	  call defx#custom#column('mark', {
	      \ 'readonly_icon': '✗',
	      \ 'selected_icon': '✓',
	      \ })
      autocmd FileType defx call s:defx_my_settings()
      function! s:defx_my_settings() abort
        " Define mappings
        nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open', 'choose')
        nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
        nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
        nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
        nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
        nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
        nnoremap <silent><buffer><expr> P
        \ defx#do_action('preview')
        nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle') . 'j'
        nnoremap <silent><buffer><expr> h
        \ defx#do_action('close_tree')
        nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
        nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
        nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
        nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
        nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
        nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
        nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
        nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
        nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
        nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
        nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
        nnoremap <silent><buffer><expr> <BS>
        \ defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
        nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
        nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
        nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
        nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
        nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
        nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
        nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
      endfunction
  " }
  " Defx Git {
    call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '?'
    \ })
    call defx#custom#column('git', 'column_length', 1)

  " }

  " UtilSnip {
    let g:UltiSnipsExpandTrigger       = "<c-j>"
    let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
    let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
  " }
 
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

  " Indexer.tar.gz {
    let g:indexer_ctagsCommandLineOptions='-R -h ".php" --fields=+aimlS --links=no --totals=no --python-kinds=-i --PHP-kinds=+cf --languages=+PHP,-JavaScript,+Python,-SQL,-HTML'
    let g:indexer_ctagsJustAppendTagsAtFileSave=1
    let g:indexer_useSedWhenAppend=1
    let g:indexer_dontUpdateTagsIfFileExists=0
    let g:indexer_backgroundDisabled=1
    let g:indexer_ctagsWriteFilelist=1
    "let g:indexer_disableCtagsWarning=1
    " }

	" PhpDocs {
		"source ~/.vim/plugin/php-doc.vim
		inoremap <leader>o <ESC>:call PhpDocSingle()<CR>i
		nnoremap <leader>o :call PhpDocSingle()<CR>
		vnoremap <leader>o :call PhpDocRange()<CR>
    let g:pdv_cfg_File_Description='This file is part of the GardenMedia Mission Project'
		let g:pdv_cfg_Author='Erwan INYZANT <erwan@garden-media.fr>'
    let g:pdv_cfg_License = "PHP Version 7.1 {@link http://www.php.net/license/}"
		let g:pdv_cfg_Copyright=strftime('%Y') . ' Garden Media Studio VN Company Limited'
    let g:pdv_cfg_Link='https://www.einyzant.io'
    let g:pdv_cfg_Version='Release: 1.0.0'
    let g:pdv_cfg_Package='GardenMedia'
    let g:pdv_cfg_Php_Version='7'
    let g:pdv_cfg_autoEndClass=0
    let g:pdv_cfg_autoEndFunction=0
	" }

	" NERDCommenter {
		:map <C-c> <leader>cc<CR>
		:map <C-x> <leader>cu<CR>
	" }

	" airline {
    "let g:airline_theme='powerlineish'
    let g:airline_theme='dark'
    let g:airline_powerline_fonts=1
    set t_Co=256
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#ale#enabled = 1

	" }


	" Ack {
		let g:ackprg = "/usr/bin/ack --noenv --smart-case --type-add php=.inc,.mod,.csv --type-add css=.less,.scss --type-add js=.vue --php --css --htm --html --js --xml --json --py --python --yaml --flush -H --nocolor --nogroup --column --ignore-dir=var --ignore-dir=dev --ignore-dir=update --ignore-dir=cache --ignore-dir=build --ignore-dir=pub -R"
	" }

	" Fugitive {
		set previewheight=40
	" }

  " Git Gutter {
    let g:gitgutter_max_signs = 9999
  " }

	" phpfolding {
		map <C-F5> <Esc>:EnableFastPHPFolds<Cr>
		map <C-F7> <Esc>:DisablePHPFolds<Cr>
		let g:DisableAutoPHPFolding = 1
	" }

	" Javascript libraries syntax {
		let g:used_javascript_libs = 'jquery,angularjs,angularui,react,vue,requirejs,underscore'
	" }

  " tern_for_vim {
    let g:tern_map_keys=1
    let g:tern_show_arguments_hints='on_hold'
  " }
  "
  " vim devicons {
    let g:webdevicons_enable = 1
    "let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_airline_statusline = 1
  " }
  " html5 {
    let g:html5_event_handler_attributes_complete = 1
    let g:html5_rdfa_attributes_complete = 1
    let g:html5_microdata_attributes_complete = 1
    let g:html5_aria_attributes_complete = 1
  " }
  " vim-javascript {
    let g:javascript_plugin_flow = 1
  " }
  "
  " Vdebug (x-debug) {
    let g:vdebugoptions = {}
    let g:vdebugoptions["port"] = 9000
  " }
" }

map ,rs :e ~/.vimrc<CR>
map ,ws :source ~/.vimrc<CR>
map <C-g> g<C-]>
map ,ta <ESC>:TagbarToggle<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
map <C-f> :ALEFix<CR>

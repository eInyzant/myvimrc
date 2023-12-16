set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" My Plugins here:
"
" original repos on github
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
Plug 'widox/vim-buffer-explorer-plugin'

" Color Scheme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

" syntax plugins
Plug 'eInyzant/vim-phpdoc'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'evidens/vim-twig'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dart-lang/dart-vim-plugin'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'


" File explorer
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" File/Buffer/Git search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'fs111/pydoc.vim'

" Auto completion and more:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim'

" Utilitaires
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'henrik/vim-indexed-search'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'easymotion/vim-easymotion'


" vim-scripts repos
"Plug 'vim-scripts/AutoComplPop'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/ShowMarks'
Plug 'vim-scripts/CmdlineComplete'
Plug 'vim-scripts/Conque-Shell'

" For automatic ctags indexing
Plug 'ludovicchabant/vim-gutentags'
"Plug 'vim-scripts/DfrankUtil'
"Plug 'vim-scripts/vimprj'
"Plug 'vim-scripts/indexer.tar.gz'


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

  " Gruvbox {
    let g:gruvbox_contrast_light="hard"
    let g:gruvbox_italic=1 
  " }
  "
  " Everforest {
    let g:everforest_background = 'hard'
    let g:everforest_better_performance = 1
    let g:everforest_enable_italic=1
  " }

	set background=light
  colorscheme everforest
  "colorscheme gruvbox
	set showmode                    " display the current mode

  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

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

  set grepprg=rg\ --vimgrep\ --smart-case\ --follow " use ripgrep instead of grep and can be used like : ":grep pizza"
  " Search and replace :
  " :grep "pizza"
  " :cfdo %s/pizza/donut/g | update

  let php_sql_query=1 "Coloration des requetes SQL
  let php_htmlInStrings=1 "Coloration des balises html

  " Undotree {
    nnoremap <leader>u :UndotreeToggle<CR>
    let persistent_undo=1
    if has("persistent_undo")
      let target_path = expand('~/.vim/undodir')

      " create the directory and any parent directories
      " if the location does not exist.
      if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
      endif

      let &undodir=target_path
      set undofile
    endif
  " }

  " Codeium {
    "imap <script><silent><nowait><expr> <C-g> codeium#Accept()
    imap <leader>n   <Cmd>call codeium#CycleCompletions(1)<CR>
    imap <leader>p   <Cmd>call codeium#CycleCompletions(-1)<CR>
    imap <leader>x   <Cmd>call codeium#Clear()<CR>
    set statusline+=\{…\}%3{codeium#GetStatusString()}
  " }

  " Coc-flutter {
    let g:dart_format_on_save = 1
    let g:dartfmt_options = ['--fix', '--line-length 80']
    nnoremap <leader>fe :CocCommand flutter.emulators <CR>
    nnoremap <leader>fd :below new output:///flutter-dev <CR>
    nnoremap <leader>fr :CocCommand flutter.run <CR>
  " }

  " EasyMotion {
    let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap <leader>ss <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    "nmap s <Plug>(easymotion-overwin-f2)

    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1

    " JK motions: Line motions
    map <Leader>l <Plug>(easymotion-lineforward)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    map <Leader>h <Plug>(easymotion-linebackward)

    " <Leader>f{char} to move to {char}
    map  <Leader>x <Plug>(easymotion-bd-f)
    nmap <Leader>x <Plug>(easymotion-overwin-f)

    " Move to word
    map  <Leader>ww <Plug>(easymotion-bd-w)
    nmap <Leader>ww <Plug>(easymotion-overwin-w)
  " }

  " ChadTree {
    map ,ex <ESC>:CHADopen<CR>
    let g:chadtree_settings = {
        \ 'options.follow': v:false,
        \ }

  " }

  " Gutentags {
    set statusline+=%{gutentags#statusline('[♨',']')}
    "let g:gutentags_add_default_project_roots=['.git', '.hg', '.svn', '.bzr', '_darcs', '_darcs', '_FOSSIL_', '.fslckout']
  " }

  " Fzf {
    " Initialize configuration dictionary
    let g:fzf_vim = {}
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
    let g:fzf_vim.preview_window = ['down,60%', 'ctrl-/']
    nnoremap <silent> <C-p> :Files<CR>
    nnoremap <silent> <Leader>bf :Buffers<CR>
    nnoremap <silent> <Leader>gr :RG<CR>
  " }

  " Coc {
    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
      
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
    "let g:airline#extensions#ale#enabled = 1
	" }


	" Ack {
		let g:ackprg = "/usr/bin/ack --noenv --smart-case --type-add php=.inc,.mod,.csv --type-add css=.less,.scss --type-add js=.vue --php --css --htm --html --js --xml --json --py --python --yaml --flush -H --nocolor --nogroup --column --ignore-dir=var --ignore-dir=dev --ignore-dir=update --ignore-dir=cache --ignore-dir=build --ignore-dir=pub -R"
	" }

	" Fugitive {
		set previewheight=40
	" }

  " Git Gutter {
    "let g:gitgutter_max_signs = 9999
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
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

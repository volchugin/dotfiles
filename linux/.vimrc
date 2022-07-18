
" =============================================================================
" Miller Medeiros .vimrc file
" -----------------------------------------------------------------------------
" heavily inspired by: @factorylabs, @scrooloose, @nvie, @gf3, @bit-theory, ...
" =============================================================================


" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible            " Disable vi compatibility

filetype on                 " filetype must be 'on' before setting it 'off'
                            "   otherwise it exits with a bad status and breaks
                            "   git commit.
"filetype off                " force reloading *after* pathogen loaded
filetype plugin on
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-T'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/clam.vim'
Plugin 'othree/html5.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'junkblocker/patchreview-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'mhinz/vim-signify'
Plugin 'int3/vim-extradite'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'frazrepo/vim-rainbow'               " Rainbow brackets 
Plugin 'junegunn/fzf'                       " fuzzy file finder
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'valloric/youcompleteme'

" tags
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'szw/vim-tags'
Plugin 'webastien/vim-ctags'

" html
Plugin 'rstacruz/sparkup'
Plugin 'alvan/vim-closetag'
Plugin 'docunext/closetag.vim'

" css
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" js
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'millermedeiros/vim-esformatter'
Plugin 'leafgarland/typescript-vim'
Plugin 'prettier/vim-prettier'

" vue
Plugin 'posva/vim-vue'

" python
Plugin 'klen/python-mode'	            " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		    " Jedi-vim autocomplete plugin
Plugin 'pappasam/coc-jedi'
Plugin 'mitsuhiko/vim-jinja'		    " Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim"
Plugin 'psf/black'                      " Uncompromising python code formatter
Plugin 'google/yapf'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'


" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"
" Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'millermedeiros/vim-statline'
" Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'
Plugin 'ryanoasis/vim-devicons'

" colorschemes
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'rakr/vim-one'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'junegunn/seoul256.vim'

" required for vundle
call vundle#end()

syntax on
filetype plugin indent on   " enable detection, plugins and indent


" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps


" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"

set spelllang=en_us         " spell checking
set spellsuggest=best		" suggest spell
set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
                            "   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.


" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally


" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set ic                      " search ignore case
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
                            "   contain upper-case letters
let g:incsearch#auto_nohlsearch = 1


" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
"set esckeys                     " Allow cursor keys in insert mode. (doesnt work with NeoVim)
set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others

" --- mouse ---
set mouse=a


if !has('nvim')
    set ttymouse=xterm2
endif


" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" --- clipboard ---
set clipboard+=unnamedplus  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim (no need with Neovim)
set go+=a               " Visual selection automatically copied to the clipboard


" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_tabline = 1
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

"let g:molokai_original=0
" make 'var' keyword easier to spot
hi link javascriptType Keyword
" default ColorColumn is too distractive
hi clear ColorColumn
hi link ColorColumn FoldColumn
" defaul line number is too distractive
hi clear LineNr
hi link LineNr Comment
hi link OverLength Error

" --- UI settings ---


if has('gui_running')
    set guifont=MesloLGS\ NF:h12
    set gfn:MesloLGS \NF:h13
    "set transp=1:

    " toolbar and scrollbars
    set guioptions+=T       " add/remove toolbar
    set guioptions-=L       " remove left scroll bar
    set guioptions+=r       " add right scroll bar
    set guioptions-=b       " bottom scroll bar
    set guioptions-=h      " only calculate bottom scroll size of current line
    "set shortmess=atI       " Don't show the intro message at start and
                            "   truncate msgs (avoid press ENTER msgs).
    autocmd VimEnter * TagbarToggle
    autocmd VimEnter * NERDTree | wincmd p
    autocmd VimEnter * if !argc() | NERDTree | wincmd p
endif

"set powerline_cmd="py3"    " Tell powerline to use Python 3python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

set background=dark
" Cursor line but only current window and not when inserting text
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set numberwidth=6           " width of numbers line (default on gvim is 4)
set report=1                " Show all changes.
set showmode                " Show the current mode.
" set noshowmode              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set showtabline=1           " Always display the tabline, even if there is only one tab

set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.
" set termguicolors           " Set terminal colors as GUI

set display+=lastline       " When included, as much as possible of the last line in a window will be displayed
set scrolloff=8             " Start scrolling n lines before horizontal
                            "   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=3            " The minimal number of columns to scroll
                            "   horizontally.

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" use relative line number by default
if exists('+relativenumber')
  set relativenumber
endif

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set wildignore+=*/coverage


" --- diff ---
set diffopt=filler          " Add vertical spaces to keep right
                            "   and left aligned.
set diffopt+=iwhite         " Ignore whitespace changes.


" --- folding---
set foldmethod=manual       " manual fold
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default - you must manually enter za to fold (and unfold)
set foldlevel=99
 
"Using the space bar would be a better choice, so add this line of command to your configuration file:
nnoremap <space> za
"  Want to see the documentation string of the folding code?
let g:SimpylFold_docstring_preview=1


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list


" --- remove sounds effects ---
set noerrorbells
set visualbell


" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
set ai
                                " spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=120
set colorcolumn=100              " Show large lines
highlight ColorColumn ctermbg=darkgray

set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.

let g:indentLine_char='¦'       " Support any ASCII code, can also use special characters: ¦, ┆, or │, but only valid under utf-8 encoding
let g:indentLine_enabled = 1    " Make indentline effective


" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" incsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


" ---- FZF ----
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" ---- Ctags ----
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:vim_ctags__relative = 'always'      "tagpath relative to tags index file
let g:vim_ctags__totals   = 'yes'         "display reporting after build
set exrc
set secure
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '*.pyc']
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    " add any database in current directory
    if filereadable("cscope.out")
        silent cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        silent cs add $CSCOPE_DB
    endif
endif


" ---- Airline ---
let g:airline_powerline_fonts = 1
let g:airline_theme = 'ayu_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
        endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_symbols = {}
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.linenr = ''
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '|'
let g:airline#extensions#coc#enabled = 1
"call airline#parts#define_accent('mode', 'bold')
"let g:airline_section_a = airline#section#create(['mode', ' '])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"let g:airline_section_y=0
" Just show the filename (no path) in the tab
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
" Don't bother telling me about whitespace
silent! call airline#extensions#whitespace#disable()
" Don't bother telling me about spelling
let g:airline_detect_spell=0
" Show system time
" let g:airline_section_b = '%{strftime("%H:%M")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
" Coc Vim stuff
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#bookmark#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline#extensions#syntastic#enabled = 1

" Better display for messages - this makes the command line area bigger.
" Default is set cmdheight=1
set cmdheight=2


" --- NERDTree ----
autocmd VimEnter * NERDTree | wincmd p 
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=0
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUseNerdFonts = 1

" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"When starting vim in the terminal, share NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" ---- NERDTrees File highlighting ----
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')


" --- NERDCommenter ---
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
    \ 'scss': { 'left': '//' }
\ }


" --- Syntastic : Linting / Error check ---
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
" close/open location list (errors)
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :Errors<CR> :lw<CR>
noremap <silent><leader>ln :lnext<CR>
noremap <silent><leader>lp :lprev<CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslintme'
let g:syntastic_javascript_eslint_generic = 1


" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d
" see [autocommands] at the end for more autocomplete settings

" nodejs-complete / jscomplete
let g:node_usejscomplete = 1
let g:jscomplete_use = ['dom', 'moz']

let g:SuperTabMappingForward = '<s-Tab>'
let g:SuperTabMappingBackward = '<s-c-Tab>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabDefaultCompletionType = "<c-p>"


" --- snipmate ---
let g:snips_author = 'Miller Medeiros'


" --- EasyMotion ---
let g:EasyMotion_leader_key = '<leader>m'
" lets make <leader>F and <leader>f use easymotion by default
let g:EasyMotion_mapping_f = '<leader>em'
let g:EasyMotion_mapping_F = '<leader>mm'



" --- Strip trailing whitespace ---
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Trailing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>


" --- matchit ---
runtime macros/matchit.vim          " enable matchit (better '%' key mapping)


" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1

" --- vim-vue ---
let g:vue_pre_processors = []       " no preprocessors for memory save (options: 'pug', 'scss')
let g:vue_pre_processors = 'detect_on_enter'

" --- vim-signify ---
let g:signify_update_on_focusgained = 1


" --- Command-T ---
" let g:CommandTMaxFiles=2000
" let g:CommandTMaxHeight=12
" noremap <silent> <leader>tt :CommandT<CR>
" noremap <silent> <leader>bt :CommandTBuffer<CR>
" noremap <silent> <leader>tf :CommandTFlush<CR>

" --- Ctrl-P ---
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
noremap <silent> <leader>tt :CtrlP<CR>
noremap <silent> <leader>bt :CtrlPBuffer<CR>
noremap <silent> <leader>tf :CtrlPClearCache<CR>



" --- LustyJuggler ---
let g:LustyJugglerSuppressRubyWarning = 1  " avoid error if running on terminal


" --- statline ---
" errors color
hi User3 guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
let g:statline_mixed_indent_string = '[mix]'


" --- gundo ---
nnoremap <leader>gu :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1


" --- toggle indentation mode ---

function! ToggleExpandTab()
    if &et
        set noet softtabstop=0
    else
        execute "set et softtabstop=". &tabstop
    endif
endfunction

noremap <silent> <leader>et :call ToggleExpandTab()<CR>


" --- Show syntax highlighting groups for word under cursor ---
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
nnoremap <leader>sh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" faster when opening files with large lines
set synmaxcol=300


" --- Highlight word under cursor ---
" hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
" nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr>


" --- Tabular.vim ---
noremap <silent> <leader>t: :Tabularize /:<CR>
noremap <silent> <leader>t= :Tabularize /=<CR>
noremap <silent> <leader>t, :Tabularize /,<CR>
noremap <silent> <leader>t{ :Tabularize /{<CR>
noremap <silent> <leader>t" :Tabularize /"<CR>
noremap <silent> <leader>t' :Tabularize /'<CR>
noremap <silent> <leader>t[ :Tabularize /[<CR>
noremap <silent> <leader>t/ :Tabularize ///<CR>
noremap <silent> <leader>t\| :Tabularize /\|<CR>


" --- include content of static files ---
" borrowed from: http://vim.1045645.n5.nabble.com/vim-counterpart-for-persistent-includes-td4276915.html

function! IncludeStatic()
 :g/<!-- #include "[^"]*" -->\_.\{-}<!-- end include -->/let fname = matchstr(getline('.'),'<!-- #include "\zs[^"]*\ze" -->')|exec '+,/<!-- end include -->/-!cat '.fnameescape(fname)
endfunction

noremap <silent> <leader>ic :call IncludeStatic()<CR>



" --- convert selected text from markdown to HTML ---
vnoremap <silent> <leader>md :! mdown<CR>

function! SanitizeMdown()
    %s/<\/\?p>//
    %s/<br \?\/\?>/ /
    %s/<pre><code>/<pre class="brush:js">\r/
    %s/<\/code><\/pre>/<\/pre>/
endfunc
noremap <silent> <leader>mds :call SanitizeMdown()<CR>



" --- format JavaScript source code using esformatter --

nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>



" --- toggle autocomplete behavior and word delimiters ---

" better auto complete for CSS class names
" more info: http://blog.millermedeiros.com/vim-css-complete/

function! KeywordsAll()
    setl iskeyword=@,48-57,192-255,\@,\$,%,-,_
endfunc

function! KeywordsBasic()
    setl iskeyword=@,48-57,192-255
endfunc


" --- visual block move ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=35m10

let g:DVB_TrimWS = 1
vmap  <expr>  <S-LEFT>   DVB_Drag('left')
vmap  <expr>  <S-RIGHT>  DVB_Drag('right')
vmap  <expr>  <S-DOWN>   DVB_Drag('down')
vmap  <expr>  <S-UP>     DVB_Drag('up')
vmap  <expr>  D          DVB_Duplicate()


" --- transform lists ---
" http://www.youtube.com/watch?v=aHm36-na4-4#t=17m30

nmap <leader>ls :call ListTrans_toggle_format()<CR>
vmap <leader>ls :call ListTrans_toggle_format('visual')<CR>


" --- vim-rainbow ---
" 
let g:rainbow_active = 0

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']


" --- vim-devicons ---
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_startify = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1     " enable folder/directory glyph flag (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 0
let g:DevIconsDefaultFolderOpenSymbol = 'ƛ'
let g:WebDevIconsOS = 'Darwin'

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" ----- YouCompleteMe -----

"Opening and closing of the completion menu
" set completeopt=longest,menu "Make Vim's completion menu behave the same as general IDE (refer to VimTip1228)
" let g:ycm_min_num_of_chars_for_completion=2 "list the matches from the second typed character
" let g:ycm_cache_omnifunc=0 "Disable cache matches, regenerate matches every time
" let g:ycm_autoclose_preview_window_after_completion=1 "Intelligently close the auto-complete window
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "automatically close the preview window after leaving insert mode
 
 "Switch and select between items in the completion menu: By default, tab s-tab is used to switch up and down, and space is used for selection. Custom settings can be made:
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>'] "Use the up and down keys to switch between the completion menus
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"" Press Enter to select the current item in the completion menu
 
 "Turn on various completion engines
" let g:ycm_collect_identifiers_from_tags_files=1 "Turn on YCM based tag engine
" let g:ycm_auto_trigger = 1 "Turn on YCM based on identifier completion, the default is 1
" let g:ycm_seed_identifiers_with_syntax=1 "Turn on YCM based on syntax keyword completion
" let g:ycm_complete_in_comments = 1 "can also be completed in the comment input
" let g:ycm_complete_in_strings = 1 "can also be completed in string input
" let g:ycm_collect_identifiers_from_comments_and_strings = 0 "comments and text in strings will also be included in the completion
 
 "Remap shortcuts
 "The behavior of the up, down, left, and right keys will display other information. Inoremap consists of i insert mode and noremap without remapping, only one layer is mapped, and it is not mapped to the mapped map.
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
 
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
 
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>  "Jump to definition
"let g:ycm_confirm_extra_conf=1 "close loading. ycm_extra_conf.py confirmation prompt
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

"let g:ycm_python_interpreter_path = '/Users/denisvolchugin/anaconda3/bin/python'
"let g:ycm_python_sys_path = ['/usr/bin/python3.9']
"let g:ycm_extra_conf_vim_data = [
"  \  'g:ycm_python_interpreter_path',
"  \  'g:ycm_python_sys_path'
"  \]
"let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

 "Set comment shortcut
map <F4> <leader>ci<CR>
"In normal mode press v, move the cursor to select the line to be commented, then press F4 to add a comment to all selected lines


" ----- Custom function to run py file in current environment
map <F6> <ESC>:Autopep8<CR>:w<CR>:call RunPython()<CR>
 
function! RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

"switch to nomal mode >> execute Autopep8 standard code format >> save current file >> call Runpython custom function, 
"Runpython automatically selects the python interpreter in the current environment
" -----------------------------------------------------------------------------
" KEY MAPPINGS
" -----------------------------------------------------------------------------

" mapleader set at the top of the file to avoid conflicts

" ---- FZF mappings ----
nnoremap <silent> <leader>f :FZF<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <F8> :TagbarToggle<CR>

" --- FIX/IMPROVE DEFAULT BEHAVIOR ---

" avoid mistyping commands
command! W w
command! Wq wq
command! Bd bd

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing
nnoremap S i<cr><esc><right>

" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk

" next tab
nnoremap <C-Tab> :tabn<CR>

" automatic esc, really uncommon to type jj,jk
inoremap jj <ESC>
inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Bubble single lines, similar to Eclipse (requires unimpaired.vim)
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines, similar to Eclipse (requires unimpaired.vim)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Duplicate lines, similar to Eclipse
noremap <C-S-Up> YP
noremap <C-S-Down> YP

" 'fix' search regexp to be compatible with Perl format
" nmap / /\v
" vmap / /\v

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" improve the 'search word under cursor' behavior
nnoremap * :silent call KeywordsAll()<CR> *
nnoremap # :silent call KeywordsAll()<CR> #


" --- COMMON STUFF / HELPERS ---

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" Open file (useful for HTML)
noremap <silent> <leader>o :!open %<CR>

" Reformat code
nnoremap <leader>rf gg=G

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Pull word under cursor into LHS of a substitute (find and replace)
nnoremap <leader>rr :silent call KeywordsAll()<CR> :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Insert/append a single character
" noremap ,, i_<esc>r
" noremap ;; a_<esc>r

" Visually select the text that was last edited/pasted
nnoremap <leader>v `[v`]

" fast Ack
nnoremap <leader>a :tab split<CR>:Ack<Space>
nnoremap <leader>aw :silent call KeywordsAll()<CR> :tab split<CR>:Ack<cword><CR> :silent call KeywordsBasic()<CR>

" Toggle spelling hints
nnoremap <silent> <leader>ts :set spell!<CR>


" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Shortcut key combination:
" nnoremap <C-J> <C-W><C-J>        "Shortcut key combination:-Ctrl-j to switch to the split window below
" nnoremap <C-K> <C-W><C-K>        "Shortcut key combination:-Ctrl-k to switch to the upper split window
" nnoremap <C-L> <C-W><C-L>        "Shortcut key combination:-Ctrl-l to switch to the right split window
" nnoremap <C-H> <C-W><C-H>        "Shortcut key combination:-Ctrl-h to switch to the left split window


" Move windows around (only works on same row)
noremap <C-S-Right> <C-w>r
noremap <C-S-Left> <C-w>R

" Quick new file
nnoremap <leader>n :enew<CR>

" Open current buffer in a new split
noremap <leader>s :vsplit<cr>
noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>

" delete buffer but keep window open (requires bufkill.vim)
map <leader>bd :BD<CR>

" smarter next/prev buffer (requires bufkill.vim)
map <leader>bn :BF<CR>
map <leader>bp :BB<CR>

" resize splits (http://vim.wikia.com/wiki/Resize_splits_more_quickly)
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" add spaces inside current parenthesis
" rtcut key combination:-Ctrl-l to switch to the right split window
map <leader>( vi(xi  P

" copy to system clipboard with Control+C
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>


" -----------------------------------------------------------------------------
" FILE HANDLING
" -----------------------------------------------------------------------------

" [autocommands] borrowed from @bit-theory vimfiles and edited
augroup mm_buf_cmds
    " clear commands before resetting
    autocmd!

    " when vimrc is edited, reload it
    autocmd bufwritepost .gvimrc source %
    autocmd bufwritepost .vimrc source %

    " Only show cursorline in the current window and in normal mode
    au WinLeave,InsertEnter * set nocul
    au WinEnter,InsertLeave * set cul

    " filetype
    autocmd BufNewFile,BufRead *.json setf json
    autocmd BufNewFile,BufRead *.hx setf haxe

    autocmd FileType mustache runtime! ftplugin/html/sparkup.vim

    " Enable omnicomplete for supported filetypes
    autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " jscomplete is a separate plugin
    autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " make `gf` search for .js files
    autocmd FileType javascript,javascript.jsx setlocal suffixesadd=.js
    autocmd FileType javascript,javascript.jsx setlocal path+=js,scripts,src

    " make sure `complete` works as expected for CSS class names without
    " messing with motions (eg. '.foo-bar__baz') and we make sure all
    " delimiters (_,-,$,%,.) are treated as word separators outside insert mode
    autocmd InsertEnter,BufLeave * :silent call KeywordsAll()
    autocmd InsertLeave,BufEnter * :silent call KeywordsBasic()

    " yes, we need to duplicate it on VimEnter for some weird reason
    autocmd VimEnter * nnoremap * :silent call KeywordsAll()<CR> *
    autocmd VimEnter * nnoremap # :silent call KeywordsAll()<CR> #

    " Toggle relative/absolute line numbers during edit
    " if exists('+relativenumber')
        " autocmd InsertEnter * setl nu
        " autocmd InsertLeave,BufEnter * setl rnu
    " endif

    " highlight char at column 121 (textwidth + 1)
    autocmd BufEnter * match OverLength /\%121v/

    " Color Column (only on insert)
    if exists("&colorcolumn")
        autocmd InsertEnter * set colorcolumn=100
        autocmd InsertLeave * set colorcolumn=""
    endif
augroup EN

set rtp+=/usr/bin/fzf                         "file manager

"-----------------------------------------------------
" Python-mode settings
"-----------------------------------------------------

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes, pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1
"
" " поддержка virtualenv
let g:pymode_virtualenv = 1
"
" " установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" " подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " отключить autofold по коду
let g:pymode_folding = 0
"
" " возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 1
let g:jedi#environment_path ='/usr/bin/python3.9'
let g:jedi#goto_command = '<leader>d'
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_stubs_command = '<leader>s'
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>nu'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#rename_command = '<leader>r'

" for Neovim 
let g:python3_host_prog='/usr/bin/python3.9'


"=====================================================
" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" а debug-mode на <F6>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
" проверка кода в соответствии с PEP8 через <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" автокомплит через <Ctrl+Space>
inoremap <C-Space> <C-x><C-o>

" переключение между синтаксисами
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>src :source %<CR>

"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"Configure vim according to PEP8 standard
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
let g:closetag_html_style=1
autocmd BufNewFile,BufRead *.js, *.html, *.css set tabstop=2|set softtabstop=2|set shiftwidth=2

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4


" --- Ctags ----
map <silent> <F3> :call DisplayTag()<CR>
map <silent> <F4> :call DisplayGivenTag()<CR>
nnoremap <silent> <F5> :call RebuildTags()<CR>
"nmap <C-f> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-*>g :cs find g <C-R>=expand("<cword>")<CR><CR>


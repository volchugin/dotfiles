set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if &compatible
    set nocompatible               " Be iMproved
endif

" Required: 
filetype plugin indent on
" Only set syntax highlighting once!
if !exists("g:syntax_on")
    syntax enable
endif 

call plug#begin('~/.config/nvim/plugged')
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'arcticicestudio/nord-vim'
Plug 'tommcdo/vim-exchange'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'sainnhe/sonokai'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'tmhedberg/SimpylFold'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'zchee/deoplete-jedi'

call plug#end()

function! MakeSession()
    let b:sessiondir = $HOME . "/.config/nvim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
   let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction

function! LoadSession()
    let b:sessiondir = $HOME . "/.config/nvim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
    else
        echo "No session loaded."
    endif
endfunction

" Controls the open/close Vim functions
augroup vimSessions
    autocmd!
    " Adding automatons for when entering or leaving Vim
    au VimEnter * nested :call LoadSession()
   au VimLeave * :call MakeSession()
augroup END

augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufNewFile,BufRead *.txt set syntax=markdown
    autocmd FileType text setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt setlocal spell
    " Stop any default wrapping when in txt or markdown
    set textwidth=0
    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
augroup END



" Prevent CTRL+Z suspending Vim
nnoremap <c-z> <nop

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction


  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction


if !&scrolloff
    set scrolloff=8       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   split                       - Use floating window for Denite
"   start_filter                - Start filtering on default
"   auto_resize                 - Auto resize the Denite window height automatically.
"   source_names                - Use short long names if multiple sources
"   prompt                      - Customize denite prompt
"   highlight_matched_char      - Matched characters highlight
"   highlight_matched_range     - matched range highlight
"   highlight_window_background - Change background group in floating window
"   highlight_filter_background - Change background group in floating filter window
"   winrow                      - Set Denite filter window to top
"   vertical_preview            - Open the preview window vertically

let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" Prettier - to enable format on save
let g:prettier#autoformat = 0
augroup prettier
    autocmd!
   autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
augroup END


" Neoformat config
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Neomake format
let g:neomake_python_enabled_makers = ['pylint']


" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Now make navigating between splits a little easier. Just use leader h,j,k,l
" nnoremap <Leader>j <C-W><C-J>
" nnoremap <Leader>k <C-W><C-K>
" nnoremap <Leader>l <C-W><C-L>
" nnoremap <Leader>h <C-W><C-H>


let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
"let g:compe.source.nvim_lsp = v:true
"let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


"" After searching, pressing escape stops the highlight
nnoremap <silent> <esc> :noh<cr><esc>

" Easy open devDiary file
nnoremap <Leader>od :edit ~/Desktop/DevDiary/diary.md<CR>

" Easy select all of file
nnoremap <Leader>sa ggvG<c-$>

" Easy show registers
nnoremap <silent> <Leader>zz :reg<CR>


" Make visual yanks pace the cursor back where started
" adding lazyredraw as it should help with the flicker
"set lazyredraw
vmap y ygv<Esc>

" Line bubbling
" Use these two if you don't have prettier
"nnoremap <silent> <c-j> :m .+1<CR>==
"nnoremap <silent> <c-k> :m .-2<CR>==
nnoremap <silent> <c-j> :m .+1<CR>
nnoremap <silent> <c-k> :m .-2<CR>
inoremap <silent> <c-j> <Esc>:m .+1<CR>==gi
inoremap <silent> <c-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <c-j> :m '>+1<CR>gv=gv
vnoremap <silent> <c-k> :m '<-2<CR>gv=gv

"Auto close tags
imap ,/ </<C-X><C-O>

if exists('+termguicolors') && ($TERM == "st-256color" || $TERM == "tmux-256color")
    if(has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
    endif
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Telescope
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

let g:deoplete#enable_at_startup = 1

" Set matching bracket for 10 seconds
set mat=10

" Get a preview of replacements
set inccommand=split

" Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
" Source: http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
set wrap linebreak nolist
set formatoptions=l

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

set completeopt=menuone,noselect 

let g:python3_host_prog='/usr/local/bin/python3.9'

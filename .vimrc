" Vi IMproved
set nocompatible

" vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set leader to , must come before any <leader> mappings
let mapleader=","

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

nnoremap <leader>bi :PlugInstall<CR>
nnoremap <leader>bu :PlugUpdate<CR>
nnoremap <leader>bc :PlugClean<CR>

" plugins {{{

" colorschemes {{{

" modern theme for modern VIMs
Plug 'ayu-theme/ayu-vim'
" summerfruit color scheme in 256 colors
Plug 'baeuml/summerfruit256.vim'
" A Vim colorscheme based on Github's syntax highlighting as of 2018.
Plug 'cormacrelf/vim-colors-github'
" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'
" a port of the monokai scheme for TextMate
Plug 'tomasr/molokai'

" }}}

" tools {{{

" NERDTree {{{
" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
" change the NERDTree directory to the root node
let NERDTreeChDirMode=2
" store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
" show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" show hidden files
let NERDTreeShowHidden=1
" highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" single click to fold/unfold directories and double click to open files
let NERDTreeMouseMode=2
" do not show line numbers
let NERDTreeShowLineNumbers=0
" nerdtree window width
let NERDTreeWinSize=30
" NERDTree recursively opens dirs that have only one child which is also a dir
let NERDTreeCasadeOpenSingleChildDir=1
" don't display these kinds of files
let NERDTreeIgnore=[ '\.class$', '\.o$', '^\.git$', '^\.svn$' ]

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nm :NERDTreeMirror<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nv :NERDTreeVCS<CR>
" }}}

" }}}

" }}}

" Initialize plugin system
call plug#end()

" general {{{

" utf-8 encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
" enable modeline
set modeline
" lines to read for modeline
set modelines=5
" don't flash
set t_vb=
set visualbell
" don't beep
set noerrorbells
" tab spaces size
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
" allow backspacing over indent, eol, and the start of an insert
set backspace=indent,eol,start
" copy indent from current line when starting a new line
set autoindent
" keyword completion
set complete=.,w,b,u,t,i,U,kspell
" only one space on joined lines
set nojoinspaces
" change the terminal's title
set title
" screen will not be redrawn while executing macros
set lazyredraw
" fast terminal connection
set ttyfast
" add/substract only dec, bin and hex values
set nrformats=bin,hex
" ignore changes in amount of white space at end of line.
set diffopt+=iwhiteeol
" show filler lines
set diffopt+=filler
" diff in vertical splits
set diffopt+=vertical
if has("patch-8.1.0360")
	" use histogram algorithm for diff
	set diffopt+=algorithm:histogram
	" use indent heuristic for diff
	set diffopt+=indent-heuristic
endif
" ~ command behaves like an operator
set tildeop
" same column with commands G, H, M, L, gg...
set nostartofline
" spell checkin
if has('spell')
	set spelllang=fr
endif
" max number of tab opened with the -p option command line argument
set tabpagemax=1000
" automatically read it file if it was changed outside of vim
set autoread
" show as much as possible of the last line
set display+=lastline
" Delete comment character when joining commented line
set formatoptions+=j

" }}}

" graphical {{{

if has('syntax')
	syntax enable
endif

if has('gui_running')
	" show GUI tabs
	set guioptions=e
endif

if (has("termguicolors"))
	" enable true colors support
	set termguicolors
endif

if &diff
	" use a slightly darker background
	let g:github_colors_soft = 1
	" set a colorscheme improved for diff
	silent! colorscheme github
else
	" set another colorscheme
	let ayucolor="mirage" " for mirage version of theme
	silent! colorscheme ayu

endif

if exists('+cursorline')
	" show current line
	set cursorline
endif

" hide the mouse pointer while typing
set mousehide
if has('mouse')
	" mouse activation
	set mouse=a
endif

" show line number
set number
" line wrapping off
set nowrap
" screen lines to keep above and below the cursor
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
" don't display invisibles chars by default
set nolist
set listchars=tab:▸\ ,extends:❯,nbsp:·,trail:·,eol:¬,precedes:❮
" show wrapped lines
set showbreak=↪
" smartly cut lines when list is disabled
set linebreak
" short messages, message for reading a file overwrites any previous message,
" and no intro message
set shortmess=aoOI
" split below
set splitbelow
" split right
set splitright

" }}}

" history {{{

" remember more commands and search history
set history=1000
" levels of undo
set undolevels=1000
if v:version >= 703
	" use undofile
	set undofile
	set undodir=~/.vim/tmp/undo
endif

" }}}

" backup {{{

" swapfile directory
set directory=~/.vim/tmp/swap
" keep backup file
set backup
set writebackup
set backupdir=~/.vim/tmp/backup

" }}}

" the status line {{{

" turn on wild menu
set wildmenu
" completion mode
set wildmode=longest:full,full
" ignore some types of files
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,.svn,.git,CVS,.hg,*.obj,.DS_Store
" always show current position
set ruler
" the commandbar height
set cmdheight=1
" always put a status line in, even if there is only one window
set laststatus=2
" Show the current mode
set showmode
" show the command in the status line
set showcmd

" }}}

" searching {{{

" highlight search results
set hlsearch
" incremental search
set incsearch
" show matching parenthesis
set showmatch
set matchpairs+=<:>
set matchpairs+==:;
" do not ignore case when searching
set noignorecase

" }}}

" folding {{{

" enable folding
set foldenable
" add a fold column
set foldcolumn=1
" detect triple-{ style fold markers
set foldmethod=marker
" start out with everything folded
set foldlevelstart=100
" which commands trigger auto-unfold
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" set a nicer foldtext function
set foldtext=MyFoldText()
function MyFoldText()
	let nucolwidth = &fdc + &number*&numberwidth
	let winwd = winwidth(0) - nucolwidth - 10
	let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
	let fdnfo = string(v:foldlevel) . ", " . string(foldlinecount) . " "
	let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
	let fillcharcount = winwd - len(line) - len(fdnfo)
	return line . repeat(" ",fillcharcount) . fdnfo
endfunction

" }}}

" functions {{{

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" disable search display
nnoremap <silent> <leader>/ :nohlsearch<CR>

function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l=line(".")
	let c=col(".")
	" do the business:
	execute a:command
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" remove trailing whitespaces
command! StripTrailingWhiteSpaces call Preserve("%s/\\s\\+$//e")
" remove empty lines
command! RemoveEmptyLines call Preserve("%g/^\\s*$/d")
" convert empty line blocks into one empty line
command! RemoveEmptyLinesBlocks call Preserve('%g/^\_$\n\_^$/d')
" reindent entire file
command! ReIndent call Preserve("normal gg=G<C-o><C-o>zz")

" switch between number, relative number and no number
function! g:ToggleNumberMode()
	if exists('+relativenumber')
		if &relativenumber
			set norelativenumber
			set number
			set number?
		elseif &number
			set nonumber
			set nonumber?
		else
			set relativenumber
			set relativenumber?
		endif
	else
		if &number
			set nonumber
			set nonumber?
		else
			set number
			set number?
		endif
	endif
endfunc

" switch virtual edit
function! g:ToggleVirtualEdit()
	if &virtualedit=='all'
		" disable virtual edit
		set virtualedit=
	else
		" edit anywhere
		set virtualedit=all
	endif
	set virtualedit?
endfunc

" }}}

" mappings {{{

" disable ex mode key
nnoremap <silent> Q <Nop>

" disable F1 key (help)
inoremap <F1> <Esc>
vnoremap <F1> <Esc>
" switch list
nnoremap <F1> :set invlist<CR>:set list?<CR>

" switch between number and relative number
nnoremap <silent> <F2> :call g:ToggleNumberMode()<CR>

if has('spell')
	" enable / disable spell checking
	nnoremap <silent> <F4> :set invspell<CR>:set spell?<CR>
endif

" enable / disable wrapping
nnoremap <silent> <F5> :set invwrap<CR>:set wrap?<CR>

" toggle paste mode
set pastetoggle=<F7>

" enable / disable virtual edit.
nnoremap <silent> <F8> :call g:ToggleVirtualEdit()<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= yypVr=
nnoremap <silent> <leader>u- yypVr-
nnoremap <silent> <leader>u* yypVr*
nnoremap <silent> <leader>u# yypVr#
nnoremap <silent> <leader>U= yyPVr=
nnoremap <silent> <leader>U- yyPVr-
nnoremap <silent> <leader>U* yyPVr*
nnoremap <silent> <leader>U# yyPVr#

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" move lines with shift-up or shift-down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" emacs bindings in command line mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" edit / reload vimrc
nnoremap <silent> <leader>ve :edit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

nnoremap <leader>$ :StripTrailingWhiteSpaces<CR>
nnoremap <leader><Space> :RemoveEmptyLines<CR>
nnoremap <leader>b<Space> :RemoveEmptyLinesBlocks<CR>
nnoremap <leader>= :ReIndent<CR>

" vertical split
nnoremap <leader>sv <C-w>v<C-w>l
" horizontal split
nnoremap <leader>sh <C-w>s<C-w>j

" generate HTML version current buffer using current color scheme
map <silent> <leader>2h :runtime! syntax/2html.vim<CR>

" format paragraph
nnoremap <leader>q gqip

" run a makefile
nnoremap <leader>m :make<CR>

" make the current file executable
nnoremap <leader>x :w<CR>:!chmod +x %<CR>:e<CR>

" add a mapping to exit with status 1, usefull when using git difftool or
" diffmerge on several files: end the diff process.
map <leader>cq :cquit<CR>

" }}}

" autocmd {{{

" only do this part when compiled with support for autocommands
if has("autocmd")
	" strip trailing white spaces on write
	autocmd BufWritePre * :StripTrailingWhiteSpaces

	autocmd Filetype make setlocal noexpandtab
	autocmd Filetype gitconfig setlocal noexpandtab
	autocmd FileType yaml setlocal expandtab
	autocmd Filetype less,css setlocal iskeyword+=-
	autocmd Filetype php setlocal iskeyword+=$
	" text formatting {{{
	" gqip to format paragraph, see :h text-objects
	" t: Auto-wrap text using textwidth
	" w: Trailing white space indicates a paragraph continues in the next
	" line. A line that ends in a non-white character ends a paragraph.
	" a: Automatic formatting of paragraphs.  Every time text is inserted or
	" deleted the paragraph will be reformatted. When the 'c' flag is present
	" this only happens for recognized comments.
	" }}}
	autocmd FileType text setlocal textwidth=80 formatoptions+=twa

	" treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	" recognize *.txt as text files.
	autocmd BufRead,BufNewFile *.txt setfiletype text
	" readonly on log files
	autocmd BufRead *.log* setlocal readonly nowrap
	" open a NERDTree automatically when vim starts up
	" autocmd VimEnter * NERDTree

endif

" }}}

" :%!python -m json.tool
" command JsonParse execute '%!python -m json.tool' | w
" map <leader>j JsonParse

" reminder {{{
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" http://vim.wikia.com/wiki/Macros
" :h c_CTRL-F to switch to command-line window
" :h CTRL-^ to open previously edited file
" }}}

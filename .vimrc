" Vi IMproved
set nocompatible

" the vim root directory
let s:vim_dir = expand('~/.vim')

" declare some paths variables
let s:plugin_dir = s:vim_dir . '/plugged'
let s:backup_dir = s:vim_dir . '/tmp/backup'
let s:undo_dir = s:vim_dir . '/tmp/undo'
let s:swap_dir = s:vim_dir . '/tmp/swap'

" create the paths, if needed
if !isdirectory(expand(s:plugin_dir))
    call mkdir(s:plugin_dir, 'p')
endif
if !isdirectory(expand(s:backup_dir))
    call mkdir(s:backup_dir, 'p', 0700)
endif
if !isdirectory(expand(s:undo_dir))
    call mkdir(s:undo_dir, 'p', 0700)
endif
if !isdirectory(expand(s:swap_dir))
    call mkdir(s:swap_dir, 'p', 0700)
endif

" vim-plug installation
if empty(glob(s:vim_dir . '/autoload/plug.vim'))
    silent execute '!curl --silent -fLo ' . s:vim_dir . '/autoload/plug.vim
        \ --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set leader to space must come before any <leader> mappings
let mapleader = " "

" Specify a directory for plugins, avoid using standard Vim directory names
" like 'plugin'
call plug#begin(s:plugin_dir)

nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" plugins {{{

" colorschemes {{{

" modern theme for modern VIMs
Plug 'ayu-theme/ayu-vim'
" A Vim colorscheme based on Github's syntax highlighting as of 2018
Plug 'cormacrelf/vim-colors-github'
" Retro groove color scheme for Vim
Plug 'morhetz/gruvbox'
" A port of the monokai scheme for TextMate
Plug 'tomasr/molokai'

" }}}

" tools {{{

" vim-airline {{{
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" truncate all path sections but the last one, a branch 'foo/bar/baz' becomes
" 'f/b/baz'
let g:airline#extensions#branch#format = 2
" truncate sha1 commits to 10 chars
let g:airline#extensions#branch#sha1_len = 10
" no check about untracked files or dirty state
let g:airline#extensions#branch#vcs_checks = []
" enable/disable showing a summary of changed hunks under source control
let g:airline#extensions#hunks#enabled = 1
" enable/disable showing only non-zero hunks
let g:airline#extensions#hunks#non_zero_only = 0
" enable syntastic integration
let g:airline#extensions#syntastic#enabled = 1
" show buffer label at first position:
let g:airline#extensions#tabline#buf_label_first = 1
" change label for buffers
let g:airline#extensions#tabline#buffers_label = 'buf'
" enable enhanced tabline
let g:airline#extensions#tabline#enabled = 1
" how buffer names are displayed, will smartly uniquify buffers names with
" similar filename, suppressing common parts of paths
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" enable displaying buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1
" hide close button
let g:airline#extensions#tabline#show_close_button = 0
" enable displaying open splits per tab (only when tabs are opened)
let g:airline#extensions#tabline#show_splits = 1
" display number of tabs on the right side
let g:airline#extensions#tabline#show_tab_count = 1
" display tabs regardless of number
let g:airline#extensions#tabline#show_tabs = 1
" configure how numbers are displayed in tab mode: splits and tab number
let g:airline#extensions#tabline#tab_nr_type = 2
" change label for tabs
let g:airline#extensions#tabline#tabs_label = 'tab'
" enable tagbar integration
let g:airline#extensions#tagbar#enabled = 1
" display the full hierarchy of the tag, not just the tag itself if function,
" show complete signature
let g:airline#extensions#tagbar#flags = 'f,s'
" enable terminal integration
let g:airline#extensions#term#enabled = 1
" enable virtualenv integration
let g:airline#extensions#virtualenv#enabled = 1
" configure which whitespace checks to enable, indent: mixed indent within a
" line, long: overlong lines, trailing: trailing whitespace,
" mixed-indent-file: different indentation in different lines, conflicts:
" checks for conflict markers
let g:airline#extensions#whitespace#checks = ['indent', 'trailing', 'long',
            \ 'mixed-indent-file', 'conflicts']
" enable detection of whitespace errors
let g:airline#extensions#whitespace#enabled = 1
" configure the maximum number of lines where whitespace checking is enabled
let g:airline#extensions#whitespace#max_lines = 50000
" spaces are allowed after tabs, but not in between this algorithm works well
" with programming styles that use tabs for indentation and spaces for
" alignment
let g:airline#extensions#whitespace#mixed_indent_algo = 2
" enable YCM integration
let g:airline#extensions#ycm#enabled = 1
" enable modified detection
let g:airline_detect_modified = 1
" enable paste detection
let g:airline_detect_paste = 1
" enable spell detection
let g:airline_detect_spell = 1
" display spelling language when spell detection is enabled
let g:airline_detect_spelllang = 1
" disable powerline fonts
let g:airline_powerline_fonts = 0

function! GetCharCode() " {{{
    " Get the output of :ascii
    redir => ascii
    silent! ascii
    redir END

    if match(ascii, 'NUL') != -1
        return 'NUL'
    endif

    " Zero pad hex values
    let nrformat = '0x%02x'

    let encoding = (&fenc == '' ? &enc : &fenc)

    if encoding == 'utf-8'
        " Zero pad with 4 zeroes in unicode files
        let nrformat = '0x%04x'
    endif

    " Get the character and the numeric value from the return value of :ascii
    " This matches the two first pieces of the return value, e.g.
    " "<F>  70" => char: 'F', nr: '70'
    let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

    " Format the numeric value
    let nr = printf(nrformat, nr)

    return "'". char ."' ". nr
endfunction " }}}

" display charcode, fileencoding and fileformat
let g:airline_section_y = '%{GetCharCode()}
            \ %{airline#util#wrap(airline#parts#ffenc(),0)}'
" }}}

" editorconfig-vim {{{
" editorconfig plugin for vim
Plug 'editorconfig/editorconfig-vim'
" }}}

" vim-gitgutter {{{
" A Vim plugin which shows a git diff in the gutter (sign column) and
" stages/undoes hunks and partial hunks
Plug 'airblade/vim-gitgutter'
" }}}

" vim-startify {{{
" The fancy start screen for Vim
Plug 'mhinz/vim-startify'
" }}}

" nerdtree {{{
" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'
" store the bookmarks file
let NERDTreeBookmarksFile=s:vim_dir . '/NERDTreeBookmarks'
" the bookmarks list is sorted in a case-sensitive manner
let NERDTreeBookmarksSort = 2
" NERDTree recursively opens dirs that have only one child which is also a dir
let NERDTreeCascadeOpenSingleChildDir = 1
" sort case sensitively
let NERDTreeCaseSensitiveSort = 1
" change the NERDTree directory to the root node
let NERDTreeChDirMode = 2
" highlight the selected entry in the tree
let NERDTreeHighlightCursorline = 1
" single click to fold/unfold directories and double click to open files
let NERDTreeMouseMode = 2
" sort in natural order
let NERDTreeNaturalSort = 1
" respect wildignore
let NERDTreeRespectWildIgnore = 1
" show the bookmarks table on startup
let NERDTreeShowBookmarks = 1
" show hidden files
let NERDTreeShowHidden = 1
" do not show line numbers
let NERDTreeShowLineNumbers = 0
" nerdtree window width
let NERDTreeWinSize = 30
" disables display of the bookmarks label and help
let NERDTreeMinimalUI = 1
" automatically remove a buffer when a file is being deleted or renamed
let NERDTreeAutoDeleteBuffer = 1

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nm :NERDTreeMirror<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nv :NERDTreeVCS<CR>
" }}}

" nerdcommenter {{{
" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'
" lines outside the right boundary of the selection block will be commented
let NERDBlockComIgnoreEmpty = 0
" allow commenting and inverting empty lines (useful when commenting a region)
let NERDCommentEmptyLines = 1
" in visual mode (v), whole lines are commented
let NERDCommentWholeLinesInVMode = 1
" comments are aligned on the left
let NERDDefaultAlign = 'left'
" remove alternative comment
let NERDRemoveAltComs = 1
" remove extra spaces when uncommenting
let NERDRemoveExtraSpaces = 1
" add spaces after comment delimiters by default
let NERDSpaceDelims = 1
" any trailing whitespace will be deleted when uncommenting a line
let NERDTrimTrailingWhitespace = 1
" }}}

" ctrlp.vim {{{
" Fuzzy file, buffer, mru, tag, etc finder
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" }}}

" syntastic {{{
" Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'
" aggregate errors from differents checkers
let g:syntastic_aggregate_errors = 1
" the error window will be automatically opened when errors are detected, and
" closed when none are detected
let g:syntastic_auto_loc_list = 1
" do not run syntax checks on file load
let g:syntastic_check_on_open = 0
" do not checks on wq
let g:syntastic_check_on_wq = 0
" echo current error to the command window
let g:syntastic_echo_current_error = 1
" enable error highlighting
let g:syntastic_enable_highlighting = 1
" use the `:sign` interface to mark syntax errors
let g:syntastic_enable_signs = 1
" instructs syntastic to label error messages with the names of the checkers
let g:syntastic_id_checkers = 1
" passive checking for somes filetypes, to check, :SyntasticCheck
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java', 'c', 'cpp'] }
" sort aggregated errors
let g:syntastic_sort_aggregated_errors = 1
" enable balloons if vim is compiled with +ballon_eval
let g:syntastic_enable_balloons = 1
" }}}

" SirVer/ultisnips {{{
" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" use python3
let g:UltiSnipsUsePythonVersion = 3
" trigger configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
" If you want :UltiSnipsEdit to split your window
let g:UltiSnipsEditSplit = "vertical"
" }}}

" tagbar {{{
if has('patch-7.3.1058')
    Plug 'majutsushi/tagbar'
    " width of the tagbar window
    let g:tagbar_width = 30
    " on single click, jump to tag definition
    let g:tagbar_singleclick = 1
    " disable short help at the top
    let g:tagbar_compact = 1

    " additional filetypes
    let g:tagbar_type_ansible = {
                \ 'ctagstype': 'ansible',
                \ 'kinds': [
                \ 't:tasks'
                \ ],
                \ 'sort': 0
                \ }

    let g:tagbar_type_css = {
                \ 'ctagstype': 'Css',
                \ 'kinds': [
                \ 'c:classes',
                \ 's:selectors',
                \ 'i:identities'
                \ ]
                \ }
endif
" }}}

" vim-indent-guides {{{
" A Vim plugin for visually displaying indent levels in code
Plug 'nathanaelkane/vim-indent-guides'
" disable guides on startup
let g:indent_guides_enable_on_vim_startup = 0
" }}}

" }}}

" vim-fugitive {{{
" fugitive.vim: a Git wrapper so awesome, it should be illegal
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" }}}

" undotree {{{
" The undo history visualizer for VIM
Plug 'mbbill/undotree'
" the undotree window will get focus after being opened
let g:undotree_SetFocusWhenToggle = 1
" relative timestamps
let g:undotree_RelativeTimestamp = 1
" short timestamps
let g:undotree_ShortIndicators = 1
" hide help message
let g:undotree_HelpLine = 0
" }}}

" vim-eunuch {{{
" eunuch.vim: Helpers for UNIX
Plug 'tpope/vim-eunuch'
" }}}

" }}}

" Initialize plugin system
call plug#end()

" general {{{

" utf-8 encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
" no BOM for utf-8 files
set nobomb
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
" insert the longest common text of the matches
set completeopt+=longest
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
" ignore changes in amount of white space at end of line
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
" format comments
set formatoptions+=c
" continue comments by default
set formatoptions+=r
" make comment when using o or O from comment line
set formatoptions+=o
" format comments with gq
set formatoptions+=q
" don't break lines that are already long
set formatoptions+=l
if has('patch-7.3.541')
    " delete comment character when joining commented line
    set formatoptions+=j
endif
" change the update time, usefull for tagbar, gitgutter, etc
set updatetime=100
" :mksession do not save empty windows, avoid quickfix windows to be empty
" when session is restored
set sessionoptions-=blank
" :mksession do not save all options and mappings (also global values for
" local options)
set sessionoptions-=options
" :mkview do not save options and mappings local to a window or buffer (not
" global values for local options)
set viewoptions-=options
" show all changes
set report=0
" it's OK to have an unwritten buffer that is not visible
set hidden
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
    " for light version of theme
    " let ayucolor="light"
    " for mirage version of theme
    let ayucolor="mirage"
    silent! colorscheme ayu

endif

if has('syntax')
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
if has('linebreak')
    " wrap lines at convenient points when wrap is on
    set linebreak
    " show wrapped lines
    set showbreak=↪
    " increase minimal number of columns used for line number
    set numberwidth=6
endif
" screen lines to keep above and below the cursor
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
" don't display invisibles chars by default
set nolist
set listchars=tab:▸\ ,extends:❯,nbsp:·,trail:·,eol:¬,precedes:❮
" short messages, message for reading a file overwrites any previous message,
" no intro message, and truncate messages if needed
set shortmess=aoOItT
" split below
set splitbelow
" split right
set splitright
" always show tab bar
set showtabline=2
" }}}

" history {{{

" remember more commands and search history
set history=1000
" levels of undo
set undolevels=1000
if has('persistent_undo')
    " use undofile
    set undofile
    let &undodir = s:undo_dir
endif

" }}}

" backup {{{

" swapfile directory
let &directory = s:swap_dir
" keep backup file
set backup
set writebackup
let &backupdir = s:backup_dir

" }}}

" the status line {{{

if has('wildmenu')
    " turn on wild menu
    set wildmenu
endif
" completion mode
set wildmode=longest:full,full
if has('wildignore')
    " ignore some types of files
    set wildignore+=*.swp,*.bak,*.pyc,*.class,*.o,.svn,.git,CVS,.hg,*.obj,.DS_Store
    set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.psd,*.pdf
endif
if has('cmdline_info')
    " always show current position
    set ruler
endif
" the commandbar height
set cmdheight=1
" always put a status line in, even if there is only one window
set laststatus=2
" Show the current mode
set showmode
if has('cmdline_info')
    " show the command in the status line
    set showcmd
endif

" }}}

" searching {{{

if has('extra_search')
    " highlight search results
    set hlsearch
    " incremental search
    set incsearch
endif
" show matching parenthesis
set showmatch
set matchpairs+=<:>
set matchpairs+==:;
" do not ignore case when searching
set noignorecase

" }}}

" folding {{{

if has('folding')
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
        let foldlinecount = foldclosedend(v:foldstart)
                    \ - foldclosed(v:foldstart) + 1
        let fdnfo = string(v:foldlevel) . ", " . string(foldlinecount) . " "
        let line = strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
        let fillcharcount = winwd - len(line) - len(fdnfo)
        return line . repeat(" ",fillcharcount) . fdnfo
    endfunction
endif

" }}}

" functions {{{

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'
                \ <Bar>diffupdate':''<CR><CR><C-L>
endif

" disable search display
nnoremap <silent> <leader>/ :nohlsearch<CR>

function! Preserve(command)
    " Preparation: save last search, and cursor position
    let _s = @/
    let l = line(".")
    let c = col(".")
    " do the business:
    execute a:command
    " clean up: restore previous search history, and cursor position
    let @/ = _s
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
    if &virtualedit == 'all'
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

" navigation between windows, with tab ans shift-tab in normal mode
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" switch list
nnoremap <F1> :set invlist<CR>:set list?<CR>

" switch between number and relative number
nnoremap <silent> <F2> :call g:ToggleNumberMode()<CR>

" enable / disable wrapping
nnoremap <silent> <F3> :set invwrap<CR>:set wrap?<CR>

if has('spell')
    " enable / disable spell checking
    nnoremap <silent> <F4> :set invspell<CR>:set spell?<CR>
endif

" toggle paste mode
set pastetoggle=<F5>

" enable / disable virtual edit
nnoremap <silent> <F6> :call g:ToggleVirtualEdit()<CR>

if has('patch-7.3.1058')
    " toggle tagbar
    nnoremap <silent> <F7> :TagbarToggle<CR>
endif

" check syntax
nnoremap <silent> <F8> :SyntasticCheck<CR>
nnoremap <silent> <leader>st :SyntasticToggleMode<CR>

nnoremap <F9> :UndotreeToggle<CR>

nnoremap <leader>ii :IndentGuidesToggle<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= "uyy"upVr=
nnoremap <silent> <leader>u- "uyy"upVr-
nnoremap <silent> <leader>u* "uyy"upVr*
nnoremap <silent> <leader>u# "uyy"upVr#
nnoremap <silent> <leader>U= "uyy"uPVr=
nnoremap <silent> <leader>U- "uyy"uPVr-
nnoremap <silent> <leader>U* "uyy"uPVr*
nnoremap <silent> <leader>U# "uyy"uPVr#

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
" diffmerge on several files: end the diff process
map <leader>cq :cquit<CR>

" another escape key, faster
inoremap jj <Esc>

" not vi compatible, but act like D and C, yank until EOF
map Y y$

" better mark jumping: line and col
nnoremap ' `

" search and replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" reformat JSON, XML
com! FormatJSON %!python -c "import json, sys, collections; print json.dumps(
            \json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"
com! FormatXML %!python3 -c "import xml.dom.minidom, sys; print(
            \xml.dom.minidom.parse(sys.stdin).toprettyxml())"

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
    " recognize *.txt as text files
    autocmd BufRead,BufNewFile *.txt setfiletype text
    " readonly on log files
    autocmd BufRead *.log* setlocal readonly nowrap

    " close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
                \ && b:NERDTree.isTabTree()) | q | endif

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

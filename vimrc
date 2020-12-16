syntax on
filetype plugin indent on

" Install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/vim-plug')

" Colorschemes
Plug 'KeitaNakamura/neodark.vim'
" Plug 'morhetz/gruvbox'
" Plug 'ajh17/Spacegray.vim'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'unblevable/quick-scope'
Plug 'bronson/vim-visual-star-search'

" Buffers
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-obsession'
Plug 'simeji/winresizer'
Plug 'yssl/QFEnter'

" Editing
Plug 'adelarsq/vim-matchit'
Plug 'ap/vim-css-color'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'jiangmiao/auto-pairs'
Plug 'sirver/UltiSnips'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'glts/vim-textobj-comment'
Plug 'suy/vim-context-commentstring'
Plug 'mattn/emmet-vim'
Plug 'christianrondeau/vim-base64'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'TiuSh/vim-toggline'

" Other
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'craigemery/vim-autotag'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

" Completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'uplus/deoplete-solargraph' " Ruby
" Plug 'slashmili/alchemist.vim'   " Elixir
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " Typescript
Plug 'sebastianmarkow/deoplete-rust' " Rust

call plug#end()

if has('termguicolors')
  if !has('neovim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

set background=dark
let g:neodark#solid_vertsplit = 1
let g:neodark#background = '#303030'
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'soft'
" let g:spacegray_low_contrast = 1
colorscheme neodark

" Default ALE warning highlights look bad in my theme
highlight ALEWarning guibg=#404040
highlight ALEError guibg=#904040

" Gentler colour for the colorcolumn
highlight ColorColumn ctermbg=red ctermfg=white guibg=#404040

set nowrap              " Don't wrap by default
set linebreak           " Wrap at word boundaries
set sidescroll=1        " Scroll 1 char at a time
set incsearch           " Incremental search
set ignorecase          " Ignore case when searching
set smartcase           " ...but only when lower-case
set scrolloff=2         " Show 2-line context when scrolling
set autoindent          " Automatic indentation
set showcmd             " Show incomplete commands
set number              " Line Number
set shiftwidth=2        " 2 spaces for indenting
set tabstop=2           " 2 spaces for tab
set softtabstop=2       " 2 spaces for backspace
set expandtab           " Spaces instead of tabs
set winminheight=0      " Helps when handling multiple files
set hidden              " Allow modified buffers to be hidden
set textwidth=80        " A good standard console width
set autoread            " Re-read unchanged buffers if they change on-disk
set formatprg=par\ -w80 " Clever paragraph formatting with par
set spelllang=en_gb     " Set the spelling language
set colorcolumn=81      " Highlight the 81st column
set updatetime=100      " Default is 4000; lower since most plugins use async
set splitbelow          " When splitting, place cursor in bottom window
set splitright          " When splitting, place cursor in right-hand window
set exrc                " Run project-specific .vimrc / .nvimrc files
set completeopt=menu    " Only show menu on completions. Default: menu,preview.
if has('nvim')
  set inccommand=split
endif

" Cursor position highlighting
:nnoremap <silent> <Leader>ml :execute 'match Search /\%'.line('.').'l/'<CR>
:nnoremap <silent> <Leader>mc :execute '2match Search /\%'.virtcol('.').'v/'<CR>
:nmap <Leader>mx <Leader>ml <Leader>mc
:nnoremap <silent> <Leader>mn :match<CR>:2match<CR>

" Automatic window size adjustment
set winheight=5
set winminheight=5
set winheight=30
set winwidth=80

" Terminal interaction
set mouse=a             " Turn on mouse support
if !has('nvim')
  set ttymouse=xterm2   " This fixes window split dragging
endif
set ttimeoutlen=10      " Short timeout for keycodes, or <Esc> is slow to react

" Tmux sends these codes for C-Arrow combinations. As those combinations don't
" have keycode names we can map to directly, we map the keycode to unused
" F-keys, and map that key to our actual target. These codes start with an
" escape, which is why we don't want to map them directly: it would cause an
" annoying delay when trying to escape from insert mode.
if !('nvim') && &term == 'screen-256color'
  set <F26>=[1;5A
  map <F26> <C-Up>
  map! <F26> <C-Up>
  set <F27>=[1;5B
  map <F27> <C-Down>
  map! <F27> <C-Down>
  set <F28>=[1;5C
  map <F28> <C-Right>
  map! <F28> <C-Right>
  set <F29>=[1;5D
  map <F29> <C-Left>
  map! <F29> <C-Left>
endif

" Status Line
set laststatus=2
let &stl=""
let &stl.="%<%F "                 " File path
let &stl.="%(| %R%M | %)"         " Flags
let &stl.="%= "                   " Right-align
let &stl.="%(| %{fugitive#statusline()} %)"
let &stl.="%(| %{&filetype} %)"   " File type
let &stl.="| %l-%c/%L "           " Line/column number

" Dirvish
" Sort directories at the top
let g:dirvish_mode = ':sort _^.*[\/]_'

"ALE Options
let g:ale_sign_column_always = 1
let g:ale_linters = {
\  'ruby': ['rubocop', 'ruby'],
\  'typescript': ['tsserver']
\}
let g:ale_fixers = {
\  'elixir': ['mix_format'],
\  'ruby': ['rufo'],
\  'rust': ['rustfmt'],
\  'javascript': ['prettier', 'eslint']
\}
" let g:ale_fix_on_save = 1
noremap <silent> <Leader>af :ALEFix<CR>
noremap <silent> <Leader>ah :ALEHover<CR>
noremap <silent> <Leader>ad :ALEGoToDefinition<CR>
noremap <silent> <Leader>ar :ALEFindReferences<CR>

" Deoplete options
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" FZF (Fuzzy Find)
noremap <Leader>oc :BTags<CR>
noremap <Leader>ob :Buffers<CR>
noremap <Leader>of :Files<CR>
noremap <Leader>oh :Helptags<CR>
noremap <Leader>ol :BLines<CR>
noremap <Leader>ot :Tags<CR>
noremap <Leader>oz :Rg<Space>
imap <C-X><C-w> <plug>(fzf-complete-word)
imap <C-X><C-f> <plug>(fzf-complete-path)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "Conditional"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "Conditional"],
  \ "info":    ["fg", "Conditional"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "Conditional"],
  \ "marker":  ["fg", "Conditional"],
  \ "spinner": ["fg", "Conditional"],
  \ "header":  ["fg", "WildMenu"] }
autocmd! User FzfStatusLine setlocal statusline=[fzf]

" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#343434 ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#343434 ctermbg=darkgrey

" IndentWise
map [< <Plug>(IndentWisePreviousLesserIndent)
map [> <Plug>(IndentWisePreviousGreaterIndent)
map [= <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]< <Plug>(IndentWiseNextLesserIndent)
map ]> <Plug>(IndentWiseNextGreaterIndent)
map ]= <Plug>(IndentWiseBlockScopeBoundaryEnd)
map [+ <Plug>(IndentWisePreviousEqualIndent)
map ]+ <Plug>(IndentWiseNextEqualIndent)
" map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
" map ]_ <Plug>(IndentWiseNextAbsoluteIndent)

" Ack (Searching)
command -nargs=* Find :Ack! "<args>"
noremap <Leader>f :Find<Space>
noremap <Leader>x :cclose<CR>
let g:ackprg = 'rg --vimgrep --ignore-case'

" UltiSnips options
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-L>"
let g:UltiSnipsJumpBackwardTrigger = "<C-H>"

" gitgutter
let g:gitgutter_preview_win_floating = 0

" windowswap
let g:windowswap_map_keys = 0
nnoremap <silent> <leader>wx :call WindowSwap#EasyWindowSwap()<CR>

" vimwiki
let g:vimwiki_list = [{
\ 'path': '~/Nextcloud/Documents/Wiki/src',
\ 'syntax': 'markdown',
\ 'ext': '.md',
\ 'auto_export': 1,
\ 'path_html': '~/Nextcloud/Documents/Wiki/html',
\ 'custom_wiki2html': '~/.vim-config/vimwiki/wiki2html.sh',
\ 'template_path': '~/.vim-config/vimwiki/templates'
\ }]

" Gundo
let g:gundo_width = 25

" Quick-Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" remap j and k so that they move through display lines, rather than physical lines
noremap j gj
noremap <Down> gj
noremap k gk
noremap <Up> gk
" Visually select the text that was last edited / pasted
nmap gV '[V']
" Easy window switching
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>
" Easy viewport scrolling
noremap <A-j> <C-e>
noremap <A-k> <C-y>
noremap <A-h> zh
noremap <A-l> zl
" map Q to replay the 'q' macro
nnoremap Q @q
" I often accidentally hit F1 instead of ESC
map <F1> <ESC>
map! <F1> <ESC>

" Shortcuts
nnoremap <Leader>lt :TlistToggle<CR>
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>ale :ALEToggle<CR>
vmap <Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)

" End-of-line whitespace highlighting
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=#904040

" Remove all end-of-line whitespace
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
function! <SID>StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

" Bubble text up and down
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Easy buffer management
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
nnoremap <Leader>bc :Bdelete<CR>

" EasyMotion
nmap s         <Plug>(easymotion-s2)
xmap s         <Plug>(easymotion-s2)
omap z         <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
omap <Leader>z <Plug>(easymotion-sn)

" Auto-Pairs
let g:AutoPairsCenterLine = 0
" autocmd FileType *
"   \ let b:AutoPairs = AutoPairsDefine({
"     \ '<' : '>',
"     \ '<<' : '',
"     \ '<!--' : '-->',
"     \ '<%' : '%>',
"     \ '<%-' : '%>',
"     \ '<%=' : '%>'
"   \ })
" " Angle bracket pairing breaks auto-indentation of tags
" autocmd FileType html,xhtml,eruby,vue
"   \ let b:AutoPairs = AutoPairsDefine({}, ['<', '<<'])

" Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_mode='nv'

" Toggline
nmap <silent> <Leader>a, :call toggline#End(',')<CR>
nmap <silent> <Leader>a. :call toggline#With('[.]$', '', '[^.]$', '\0.')<CR>
nmap <silent> <Leader>a; :call toggline#End(';')<CR>

" Scratch buffers
function! ScratchBuffer(name)
  execute "visual " . a:name
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
endfun
command! -nargs=1 ScratchBuffer :call ScratchBuffer('<args>')

" Work around for eunich plugin
" See: https://github.com/tpope/vim-eunuch/issues/56
" NOTE: Get rid of suda when it's not needed any more
command! SudoWrite :w suda://%

" XML Formatting
command! PrettyXML %!xmllint --format -

" Place the cursor where it was when the file was last edited
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Auto-close Fugitive buffers after we're done with them
autocmd BufReadPost fugitive://* set bufhidden=delete

" Language-specific
autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.qml set filetype=qml smartindent
autocmd FileType * setlocal formatoptions-=o
autocmd FileType asciidoc setlocal wrap spell
autocmd FileType help setlocal nospell
autocmd FileType text setlocal formatprg=par\ -w80 fo=ant
autocmd FileType mail setlocal tw=75 formatprg=par\ -w75 cc=76 fo=ant
autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType markdown setlocal spell
autocmd FileType vue setlocal formatoptions-=t
let g:xml_syntax_folding=1

" Rust
let g:deoplete#sources#rust#racer_binary = $HOME . '/.asdf/shims/racer'
let g:deoplete#sources#rust#rust_source_path = $HOME . '/.asdf/installs/rust/stable/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

set secure   " Because exrc is set

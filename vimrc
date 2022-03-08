syntax on
filetype plugin indent on

" Install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/.vim/vim-plug')

" Plugin Utils
Plug 'nvim-lua/plenary.nvim'

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
Plug 'ncm2/float-preview'
Plug 'Shougo/echodoc'

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
Plug 'TiuSh/vim-toggline'
Plug 'lewis6991/gitsigns.nvim'

" Other
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'craigemery/vim-autotag'
Plug 'sheerun/vim-polyglot'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'

" LSP & Completion
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-lsp'

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

" Colourscheme Tweaks
highlight ColorColumn ctermbg=red ctermfg=white guibg=#404040
highlight DiagnosticError guifg=#DC657D
highlight DiagnosticWarn guifg=#D4B261
highlight DiagnosticUnderlineError gui=NONE guibg=#423538
highlight DiagnosticUnderlineWarn gui=NONE guibg=#413d35

set nowrap               " Don't wrap by default
set linebreak            " Wrap at word boundaries
set sidescroll=1         " Scroll 1 char at a time
set incsearch            " Incremental search
set ignorecase           " Ignore case when searching
set smartcase            " ...but only when lower-case
set scrolloff=5          " Show 5-line context when scrolling
set autoindent           " Automatic indentation
set showcmd              " Show incomplete commands
set number               " Line Number
set shiftwidth=2         " 2 spaces for indenting
set tabstop=2            " 2 spaces for tab
set softtabstop=2        " 2 spaces for backspace
set expandtab            " Spaces instead of tabs
set winminheight=0       " Helps when handling multiple files
set hidden               " Allow modified buffers to be hidden
set textwidth=80         " A good standard console width
set autoread             " Re-read unchanged buffers if they change on-disk
set spelllang=en_gb      " Set the spelling language
set colorcolumn=+1       " Highlight the column after textwidth
set signcolumn=yes       " Always show the sign column (no auto-hide)
set updatetime=100       " Default is 4000; lower since most plugins use async
set splitbelow           " When splitting, place cursor in bottom window
set splitright           " When splitting, place cursor in right-hand window
set noequalalways        " Don't resize all windows when closing one
set exrc                 " Run project-specific .vimrc / .nvimrc files
set completeopt-=preview " The float-preview plugin handles completion popups
set listchars+=precedes:<,extends:> " Mark invisible portion of lines
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
set winheight=25
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
" let &stl.="%(| %{fugitive#statusline()} %)"
let &stl.="%(| %{&filetype} %)"   " File type
let &stl.="| %l-%c/%L "           " Line/column number

" Dirvish
" Sort directories at the top
let g:dirvish_mode = ':sort _^.*[\/]_'

" Gitsigns
lua require("gitsigns").setup()

" LSP - Language Server Protocol
lua << EOF
local nvim_lsp = require('lspconfig')

local debounce = 150

-- Typescript
nvim_lsp['tsserver'].setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end,
  flags = {
    debounce_text_changes = debounce
  }
})

-- VueJS
nvim_lsp['vuels'].setup({
  flags = {
    debounce_text_changes = debounce
  }
})

-- Elixir
nvim_lsp['elixirls'].setup({
  cmd = { ".vim-config/elixir-ls/rel/language_server.sh" },
  flags = {
    debounce_text_changes = debounce
  }
})

-- Diagnostics and Formatting
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint.with({
      prefer_local = "node_modules/.bin"
    }),
    null_ls.builtins.diagnostics.credo,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin"
    })
  },
  flags = {
    debounce_text_changes = debounce
  }
})
EOF

" LSP bindings
" See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap <silent> <Leader>ag :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>ai :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>ah :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>af :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <Leader>aF :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <Leader>ar :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>aR :lua vim.lsp.buf.rename()<CR>

" Deoplete options
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" VimTest
let test#strategy = "neovim"
let test#neovim#term_position = ""
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tN :TestNearest<CR><C-o><C-w>_i
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>tF :TestFile<CR><C-o><C-w>_i
nmap <silent> <Leader>ta :TestSuite<CR>
nmap <silent> <Leader>tA :TestSuite<CR><C-o><C-w>_i
nmap <silent> <Leader>tt :TestLast<CR>
nmap <silent> <Leader>tT :TestLast<CR><C-o><C-w>_i
nmap <silent> <Leader>tg :TestVisit<CR>

" echodoc
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'

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
augroup FZF
  autocmd!
  autocmd! User FzfStatusLine setlocal statusline=[fzf]
augroup END

" Folding
noremap <Leader>zz :setlocal foldmethod=syntax<CR>
noremap <Leader>zi :setlocal foldmethod=indent<CR>
noremap <Leader>zm :setlocal foldmethod=manual<CR>

" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
augroup IndentGuides
  autocmd!
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#343434 ctermbg=darkgrey
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#343434 ctermbg=darkgrey
augroup END

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
noremap <Leader>x :cclose<CR>:pclose<CR>
let g:ackprg = 'rg --vimgrep --smart-case'

" UltiSnips options
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-L>"
let g:UltiSnipsJumpBackwardTrigger = "<C-H>"

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
let g:gundo_prefer_python3 = 1

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
vmap <Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)
nnoremap <Leader>ts :split +terminal<CR>i
nnoremap <Leader>tv :vsplit +terminal<CR>i

" Easier switch to Normal mode in terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" End-of-line whitespace highlighting
" http://sartak.org/2011/03/end-of-line-whitespace-in-vim.html
augroup EndOfLineWhitespace
  autocmd!
  autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
  autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
augroup END
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
" augroup AutoPairs
"   autocmd!
"   autocmd FileType *
"     \ let b:AutoPairs = AutoPairsDefine({
"       \ '<' : '>',
"       \ '<<' : '',
"       \ '<!--' : '-->',
"       \ '<%' : '%>',
"       \ '<%-' : '%>',
"       \ '<%=' : '%>'
"     \ })
"   " Angle bracket pairing breaks auto-indentation of tags
"   autocmd FileType html,xhtml,eruby,vue
"     \ let b:AutoPairs = AutoPairsDefine({}, ['<', '<<'])
" augroup END

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

" Work around for eunuch plugin
" See: https://github.com/tpope/vim-eunuch/issues/56
" NOTE: Get rid of suda when it's not needed any more
command! SudoWrite :w suda://%

" XML Formatting
command! PrettyXML %!xmllint --format -

augroup vimrc
  autocmd!

  " Place the cursor where it was when the file was last edited
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  " Auto-close Fugitive buffers after we're done with them
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " Auto-close preview window after completion
  autocmd InsertLeave * silent! pclose!

  " Auto-format on save
  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

  " Language-specific
  autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
  autocmd BufRead *.md set filetype=markdown
  autocmd BufRead *.qml set filetype=qml smartindent
  autocmd FileType asciidoc setlocal wrap spell
  autocmd FileType elixir setlocal textwidth=98 colorcolumn=99 formatoptions+=c foldlevel=1
  autocmd FileType help setlocal nospell
  autocmd FileType text setlocal formatoptions=ant
  autocmd FileType mail setlocal textwidth=75 colorcolumn=76 formatoptions=ant
  autocmd FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  autocmd FileType markdown setlocal wrap spell
  autocmd FileType typescript syntax sync fromstart
  autocmd FileType vue setlocal formatoptions-=t

  autocmd FileType * let &l:formatprg = "par -w" . &l:textwidth
augroup END

let g:xml_syntax_folding=1

" Rust
let g:deoplete#sources#rust#racer_binary = $HOME . '/.asdf/shims/racer'
let g:deoplete#sources#rust#rust_source_path = $HOME . '/.asdf/installs/rust/stable/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

set secure   " Because exrc is set

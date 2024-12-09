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
" Plug 'EdenEast/nightfox.nvim'
Plug 'KeitaNakamura/neodark.vim'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog'
Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'gfanto/fzf-lsp.nvim'
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish'
Plug 'francoiscabrol/ranger.vim'
Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'unblevable/quick-scope'
Plug 'bronson/vim-visual-star-search'
Plug 't9md/vim-choosewin'

" Buffers
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-obsession'
Plug 'simeji/winresizer'
Plug 'yssl/QFEnter'
Plug 'tommcdo/vim-lister'

" Editing
Plug 'andymass/vim-matchup'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'junegunn/vim-easy-align'
Plug 'michaeljsmith/vim-indent-object'
Plug 'windwp/nvim-autopairs'
Plug 'sirver/UltiSnips'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'glts/vim-textobj-comment'
" Plug 'suy/vim-context-commentstring'
Plug 'mattn/emmet-vim'
Plug 'christianrondeau/vim-base64'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'TiuSh/vim-toggline'
Plug 'lewis6991/gitsigns.nvim'
Plug 'RRethy/vim-illuminate'

" Other
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'craigemery/vim-autotag'
Plug 'sheerun/vim-polyglot'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'

" LSP & Completion
Plug 'neovim/nvim-lspconfig'
Plug 'elixir-tools/elixir-tools.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'dmitmel/cmp-cmdline-history'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/nvim-cmp'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'ziontee113/syntax-tree-surfer'
Plug 'RRethy/nvim-treesitter-endwise'

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
colorscheme neodark

" Colourscheme and highlighting

" red           #DC657D
" green         #84B97C
" yellow        #D4AE58
" blue          #639EE4
" purple        #B888E2
" orange        #E18254
" pink          #DC94A2
" teal          #4BB1A7
" golden_yellow #C99720
" light_blue    #72C7D1
" brown         #AE8785

highlight StatusLine               guifg=#bcbcbc guibg=#545454
highlight StatusLineNC             guifg=#8a8a8a guibg=#3a3a3a
highlight WinSeparator             guibg=#3a3a3a
highlight ColorColumn              ctermbg=red ctermfg=white guibg=#343434
highlight NormalFloat              guibg=#3a3a3a
set fillchars+=vert:\ 

highlight Error                    ctermbg=none guibg=none
highlight DiagnosticError          guifg=#DC657D guibg=#423538
highlight DiagnosticWarn           guifg=#D4AE58 guibg=#413d35
highlight DiagnosticInfo           guifg=#639EE4 guibg=#353b42
highlight DiagnosticUnderlineError gui=none guibg=#423538
highlight DiagnosticUnderlineWarn  gui=none guibg=#413d35
highlight DiagnosticUnderlineInfo  gui=none guibg=#353b42
highlight MatchParen               gui=none guibg=#404040 guifg=none
highlight Search                   guifg=none guibg=#484336 gui=none
highlight CurSearch                guifg=none guibg=#484336 gui=none
highlight IncSearch                guifg=none guibg=#484336 gui=bold
highlight Visual                   guifg=none guibg=#484336
highlight QuickFixLine             guifg=none guibg=#484336 gui=none

" highlight Identifier               guifg=#AE8785
highlight Constant                    guifg=#4BB1A7
highlight Special                     guifg=#DC657D
highlight @operator                   guifg=#84B97C
highlight @function.call              guifg=#84B97C
highlight @variable                   guifg=#AE8785
highlight @markup.raw.markdown_inline guifg=#E18254

" vim-illuminate
highlight IlluminatedWordText guibg=#433d3d
highlight IlluminatedWordRead guibg=#433d3d
highlight IlluminatedWordWrite guibg=#433d3d

" Rainbow Delimiters
highlight RainbowDelimiterA guifg=#D4AE58
highlight RainbowDelimiterB guifg=#84B97C
highlight RainbowDelimiterC guifg=#B888E2
highlight RainbowDelimiterD guifg=#639EE4
highlight RainbowDelimiterE guifg=#4BB1A7
highlight RainbowDelimiterF guifg=#E18254

lua << EOF
require("rainbow-delimiters.setup").setup({
  highlight = {
    'RainbowDelimiterA',
    'RainbowDelimiterB',
    'RainbowDelimiterC',
    'RainbowDelimiterD',
    'RainbowDelimiterE',
    'RainbowDelimiterF'
  }
})
EOF

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
set completeopt-=preview " The float-preview plugin handles completion popups
set listchars+=precedes:<,extends:> " Mark invisible portion of lines
set inccommand=split     " Preview effects of substitutions in real time
set wildmode=longest:full,full " More expected command-mode completion
set exrc

" Cursor position highlighting
:nnoremap <silent> <Leader>ml :execute 'match Search /\%'.line('.').'l/'<CR>
:nnoremap <silent> <Leader>mc :execute '2match Search /\%'.virtcol('.').'v/'<CR>
:nmap <Leader>mx <Leader>ml<Leader>mc
:nnoremap <silent> <Leader>mn :match<CR>:2match<CR>

" Automatic window size adjustment
set winheight=25
set winwidth=86
set winminheight=5
set winminwidth=15

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
let &stl = ""
let &stl .= "%<%F "                 " File path
let &stl .= "%(| %R%M | %)"         " Flags
let &stl .= "%= "                   " Right-align
" let &stl.="%(| %{fugitive#statusline()} %)"
let &stl .= "%(| %{&filetype} %)"   " File type
let &stl .= "| %l-%c/%L "           " Line/column number

" Dirvish
" Sort directories at the top
let g:dirvish_mode = ':sort _^.*[\/]_'
let g:dirvish_dovish_map_keys = 0
" See ftplugin/dirvish.vim

" choosewin
nmap _ <Plug>(choosewin)
" let g:choosewin_overlay_enable = 1

" Ranger
let g:ranger_map_keys = 0

" Matchup
let g:matchup_matchparen_offscreen = {'method': 'popup'}
command! WhereAmI :MatchupWhereAmI?

lua << EOF
local npairs = require("nvim-autopairs")
npairs.setup({})

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")
npairs.add_rule(
  Rule("fn ", " end", "elixir")
)
npairs.add_rule(
  Rule("->", " end", "elixir")
  :only_cr()
)
npairs.add_rule(
  Rule("fn", "end", "elixir")
  :end_wise(cond.not_after_regex(".*->", 50))
  :end_wise(cond.not_after_regex(".*end", 50))
)

require("gitsigns").setup()
require("colorizer").setup()

-- TreeSitter
require("nvim-treesitter.configs").setup({
  auto_install = true,
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<Tab>",
      node_decremental = "-"
    }
  },
  indent = {
    enable = true
  },
  endwise = {
    enable = true
  },
  refactor = {
    ---- Disabled due to excessive slow-down in long C++ files
    -- highlight_definitions = {
    --   enable = true,
    --   clear_on_cursor_move = false
    -- },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "<Leader>bR"
      }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<Leader>bg",
        list_definitions = "<Leader>br",
        list_definitions_toc = "gO",
        ---- Using vim-illuminate instead due to performance
        -- goto_next_usage = "]]",
        -- goto_previous_usage = "[[",
      }
    }
  }
})

-- vim-illuminate
vim.keymap.set("n", "[[", require('illuminate').goto_prev_reference)
vim.keymap.set("n", "]]", require('illuminate').goto_next_reference)
vim.keymap.set("n", "yom", require('illuminate').toggle)

-- TreeSitter Highlights - General
vim.api.nvim_set_hl(0, "@keyword", { link = "Define" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "Define" })

-- TreeSetter Highlights - Elixir
vim.api.nvim_set_hl(0, "@module.elixir", { link = "Type" })

-- Syntax Tree Surfer
require("syntax-tree-surfer").setup({})
local opts = { noremap = true, silent = true }

--   Normal Mode Swapping:
--   Swap The Master Node relative to the cursor with its siblings. Dot-repeatable.
vim.keymap.set("n", "<Leader>K", function()
	vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "<Leader>J", function()
	vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--   Swap Current Node at the Cursor with its siblings. Dot-repeatable.
vim.keymap.set("n", "<Leader>k", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "<Leader>j", function()
	vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
	return "g@l"
end, { silent = true, expr = true })

--   Visual Selection from Normal Mode
-- vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
-- vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)

--   Select Nodes in Visual Mode
vim.keymap.set("x", "gk", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "gj", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "gh", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "gl", '<cmd>STSSelectChildNode<cr>', opts)

--   Swapping Nodes in Visual Mode
vim.keymap.set("x", "<Leader>k", '<cmd>STSSwapPrevVisual<cr>', opts)
vim.keymap.set("x", "<Leader>j", '<cmd>STSSwapNextVisual<cr>', opts)

-- LSP - Language Server Protocol
local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Elixir
require("elixir").setup({
  capabilities = capabilities,
  nextls = {
    enable = true,
    cmd = "nextls",
    spitfire = true,
    init_options = {
      experimental = {
        completions = {
          enable = true
        }
      }
    }
  },
  elixirls = {
    enable = false,
    cmd = "elixir-ls"
  }
})
-- nvim_lsp['elixirls'].setup({
--   cmd = { os.getenv("HOME") .. "/.vim/elixir-ls/rel/language_server.sh" },
-- })

-- C/C++
nvim_lsp['clangd'].setup({
  capabilities = vim.tbl_deep_extend('force', capabilities, {
    -- https://github.com/neovim/nvim-lspconfig/issues/2184
    offsetEncoding = 'utf-16'
  })
})

-- Rust
nvim_lsp['rust_analyzer'].setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
})

-- Typescript
nvim_lsp['ts_ls'].setup({
  capabilities = capabilities,
})

-- VueJS
-- nvim_lsp['vuels'].setup({})
nvim_lsp['volar'].setup({
  capabilities = capabilities,
})

-- Python
nvim_lsp['pylsp'].setup({
  capabilities = capabilities,
})

-- Diagnostics and Formatting
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint.with({
      prefer_local = "node_modules/.bin"
    }),
    -- null_ls.builtins.diagnostics.credo,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin"
    }),
    null_ls.builtins.code_actions.gitsigns
  }
})

lsp_autoformat = function(opts)
  opts = opts or {}
  local async = opts["async"]
  async = (async == nil or async == true)
  local range = nil
  if opts["only_selected"] then
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">")
    }
  end
  vim.lsp.buf.format({
    async = async,
    range = range
  })
end
EOF

" LSP bindings
" See `:help vim.lsp.*` for documentation on any of the below functions
nnoremap <silent> <Leader>aa :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>ad :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>ag :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>ai :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>ah :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>af :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <Leader>aF :lua lsp_autoformat()<CR>
vnoremap <silent> <Leader>aF :lua lsp_autoformat({ only_selected = true})<CR>
nnoremap <silent> <Leader>ar :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>aR :lua vim.lsp.buf.rename()<CR>

" CMP
lua <<EOF
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<CR>'] = cmp.mapping.confirm(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'nvim_lsp_signature_help' },
    { name = 'ultisnips', keyword_length = 3 },
  }, {
    { name = 'buffer', keyword_length = 3 }
  })
})

for _, cmd_type in ipairs({'/', '?'}) do
  cmp.setup.cmdline(cmd_type, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'buffer', keyword_length = 3 }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
end

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path', keyword_length = 3 }
  }, {
    { name = 'cmdline_history', keyword_length = 3, max_item_count = 5 },
    { name = 'cmdline', keyword_length = 3, max_item_count = 5 },
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})
EOF

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

" BufExplorer
let g:bufExplorerShowRelativePath=1

" GitSigns
nnoremap <silent> <Leader>hp :Gitsigns preview_hunk<CR>
nnoremap <silent> [h :Gitsigns prev_hunk<CR>
nnoremap <silent> ]h :Gitsigns next_hunk<CR>
xnoremap ah :<C-U>Gitsigns select_hunk<CR>
onoremap ah :<C-U>Gitsigns select_hunk<CR>
xnoremap ih :<C-U>Gitsigns select_hunk<CR>
onoremap ih :<C-U>Gitsigns select_hunk<CR>

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
let g:fzf_colors = {
  \ "fg":      ["fg", "Normal"],
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
  \ "header":  ["fg", "WildMenu"]
  \ }
augroup FZF
  autocmd!
  autocmd! User FzfStatusLine setlocal statusline=[fzf]
augroup END
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
function! s:build_location_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-l': function('s:build_location_list')
  \ }

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
command! -nargs=* Find :Ack! -- <q-args>
noremap <Leader>f :Find<Space>
noremap <Leader>x :cclose<CR>:pclose<CR>
let g:ackprg = 'rg --vimgrep --smart-case -F'

" UltiSnips options
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-L>"
let g:UltiSnipsJumpBackwardTrigger = "<C-H>"

" windowswap
let g:windowswap_map_keys = 0
nnoremap <silent> <leader>wx :call WindowSwap#EasyWindowSwap()<CR>

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
noremap <Space> 3<C-e>
noremap <C-Space> 3<C-y>

" map Q to replay the 'q' macro
nnoremap Q @q

" I often accidentally hit F1 instead of ESC
map <F1> <ESC>
map! <F1> <ESC>

" Shortcuts
nnoremap <Leader>lt :TlistToggle<CR>
vmap <Leader>a <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)
nnoremap <Leader>ts :split +terminal<CR>i
nnoremap <Leader>tv :vsplit +terminal<CR>i
nnoremap <C-w>S :botright split<CR>
nnoremap <C-w>V :botright vsplit<CR>

" Toggle paragraph auto-formatting
function! s:toggle_autoformat()
  if &formatoptions =~ 'a'
    echo "Auto-format OFF"
    set formatoptions-=a
  else
    echo "Auto-format ON"
    set formatoptions+=a
  endif
endfunction
nnoremap <silent> yfa :call <SID>toggle_autoformat()<CR>

lua << EOF
local function split_line_normal()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  local before = line:sub(1, col)
  local after = line:sub(col + 1)
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { before, after })
  vim.api.nvim_feedkeys('Vj=j^', 'n', false)
end

local function split_line_visual()
  -- Ensure visual selection marks are set.
  local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, '<'))
  local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, '>'))
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row,  false)
  local new_lines = {}
  table.insert(new_lines, lines[1]:sub(1, start_col))
  if #lines == 1 then
    table.insert(new_lines, lines[1]:sub(start_col + 1, end_col + 1))
  else
    table.insert(new_lines, lines[1]:sub(start_col + 1))
    for i = 2, #lines - 1 do
      table.insert(new_lines, lines[i])
    end
    table.insert(new_lines, lines[#lines]:sub(1, end_col + 1))
  end
  table.insert(new_lines, lines[#lines]:sub(end_col + 2))
  vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
  vim.api.nvim_feedkeys(
    'V' .. (#new_lines - 1) .. 'j=' .. (#new_lines - 1) .. 'j^',
    'n', false
  )
end
vim.api.nvim_create_user_command(
  "SplitLineVisual", split_line_visual, { range = true }
)

vim.keymap.set({'n'}, '<Leader>S', split_line_normal)
vim.keymap.set({'v'}, '<Leader>S', ":SplitLineVisual<CR>")
EOF

" Git / Fugitive
nnoremap <Leader>gu :GundoToggle<CR>
nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gt :Flog -all<CR>
vnoremap <Leader>gt :Flog<CR>
nnoremap <Leader>gT :Flog -path=%<CR>
nnoremap <Leader>gca :G commit --amend<CR>
nnoremap <Leader>gcc :G commit<CR>
nnoremap <Leader>gco :G checkout<Space>
nnoremap <Leader>gcs :G show<Space>
nnoremap <Leader>gia :G add<Space>
nnoremap <Leader>gid :G diff --cached<CR>
nnoremap <Leader>gs :G stash<Space>
nnoremap <Leader>gwd :G diff<Space>

" Echo highlight group name under cursor
nnoremap <F8> :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>

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

" Easy window / buffer management
nnoremap <Leader>bc :Bdelete<CR>
nnoremap <Leader>qq :quit<CR>

" EasyMotion
nmap s         <Plug>(easymotion-s2)
xmap s         <Plug>(easymotion-s2)
omap z         <Plug>(easymotion-s2)
nmap <Leader>s <Plug>(easymotion-sn)
xmap <Leader>s <Plug>(easymotion-sn)
omap <Leader>z <Plug>(easymotion-sn)

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

" Shortcuts for entering scratch buffer
:nnoremap <silent> <Leader>cs :split<CR>:ScratchBuffer scratch<CR>
:nnoremap <silent> <Leader>cv :vsplit<CR>:ScratchBuffer scratch<CR>
:nnoremap <silent> <Leader>cS :botright :split<CR>:ScratchBuffer scratch<CR>
:nnoremap <silent> <Leader>cV :botright :vsplit<CR>:ScratchBuffer scratch<CR>
:vnoremap <silent> <Leader>cs y:split<CR>:ScratchBuffer scratch<CR>ggVGp
:vnoremap <silent> <Leader>cv y:vsplit<CR>:ScratchBuffer scratch<CR>ggVGp
:vnoremap <silent> <Leader>cS y:botright :split<CR>:ScratchBuffer scratch<CR>ggVGp
:vnoremap <silent> <Leader>cV y:botright :vsplit<CR>:ScratchBuffer scratch<CR>ggVGp

" Work around for eunuch plugin
" See: https://github.com/tpope/vim-eunuch/issues/56
" NOTE: Get rid of suda when it's not needed any more
command! SudoWrite :w suda://%

" XML Formatting
command! PrettyXML %!xmllint --format -

augroup vimrc
  autocmd!

  " https://neovim.io/doc/user/lua.html#vim.highlight
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=1000}

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
  " autocmd BufWritePre * lua lsp_autoformat({ async = false })

  " Language-specific
  autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
  autocmd BufRead *.md set filetype=markdown
  autocmd BufRead *.qml set filetype=qml smartindent
  autocmd FileType asciidoc setlocal wrap spell
  autocmd FileType elixir
    \ setlocal textwidth=98
             \ colorcolumn=99
             \ formatoptions+=c
             \ foldlevel=1
             \ formatexpr=
             \ indentkeys-=0{
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

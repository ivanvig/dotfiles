call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'folke/which-key.nvim'
Plug 'mhinz/vim-startify'
Plug 'lambdalisue/suda.vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete-file.vim'
"Plug 'prabirshrestha/asyncomplete-buffer.vim'
call plug#end()

" MISC
inoremap fd <Esc>
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80

set nocompatible
filetype plugin on
syntax on

" COLOR SCHEME
colorscheme gruvbox
set background=dark " use dark mode

" LEADER KEY / WHICHKEY
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

let g:vimwiki_map_prefix = '<Leader>k'

let NERDSpaceDelims=1
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
  local wk = require("which-key")
  local normal_mapping = {
        b = {
          name = "+buffer" ,
          d = {"<cmdd>bd<cr>"        , "Delete buffer"}   ,
          f = {"<cmd>bfirst<cr>"    , "First buffer"}    ,
          h = {"<cmd>Startify<cr>"  , "Home buffer"}     ,
          l = {"<cmd>blast<cr>"     , "Last buffer"}     ,
          d = {"<cmd>b#<bar>bd#<cr>", "Delete buffer"}     ,
          n = {"<cmd>bnext<cr>"     , "Next buffer"}     ,
          p = {"<cmd>bprevious<cr>" , "Previous buffer"} ,
          b = {"<cmd>Telescope buffers<cr>"   , "Search buffer"},
        },
        f = {
          name = "+file",
          f = { "<cmd>Telescope find_files<cr>",     "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>",       "Open Recent File" },
          n = { "<cmd>enew<cr>",                     "New File" },
          c = {'<cmd>e ~/.config/nvim/init.vim<cr>', 'Open config file'},
          E = {'<cmd>suda#write(@%)<cr>',                     'Sudo edit'},
          b = {'<cmd>Telescope file_browser<cr>',    'File browser'},
          f = {'<cmd>Telescope find_files<cr>',      'Open file'},
          s = {'<cmd>update<cr>',                             'Save file'},
          S = {'<cmd>wall<cr>',                               'Save all files'},
          -- C d 	'convert file from unix to dos encoding' ,
          -- C u 	'convert file from dos to unix encoding' ,
          -- l 	'open file literally in =fundamental mode=' ,
          -- L 	'Locate a file (using =locate=)' ,
          -- o 	'open a file using the default external program' ,
          -- R 	'rename the current file' ,
          -- t 	'toggle file tree side bar using [[https://github.com/jaypei/emacs-neotree][NeoTree]]' ,
          -- y 	'show current file absolute path in the minibuffer' ,
        },
        w = {
          name = '+windows' ,
          w     = {'<C-W>w',    'Other window'},
          d     = {'<C-W>c',    'Delete window'},
          ["-"] = {'<C-W>s',    'Split window below'},
          ["|"] = {'<C-W>v',    'Split window right'},
          ["2"] = {'<C-W>v',    'Layout double columns'},
          h     = {'<C-W>h',    'Window left'},
          j     = {'<C-W>j',    'Window below'},
          l     = {'<C-W>l',    'Window right'},
          k     = {'<C-W>k',    'Window up'},
          H     = {'<C-W>5<',   'Expand window left'},
          J     = {'resize +5', 'Expand window below'},
          L     = {'<C-W>5>',   'Expand window right'},
          K     = {'resize  5', 'Expand window up'},
          ["="] = {'<C-W>=',    'Balance window'},
          s     = {'<C-W>s',    'Split window below'},
          v     = {'<C-W>v',    'Split window below'},
        },
        s = {
          name = '+search' ,
          s  = {'<cmd>Telescope live_grep<cr>',	'Search string on current dir'},
        },
    }

  local visual_n_normal_mapping = {
      c = {
          name  = '+code'			,
          c     = {'<plug>NERDCommenterComment', 'Comment lines'},
          y     = {'<plug>NERDCommenterYank', 'Yank and comment'},
          i     = {'<plug>NERDCommenterInvert', 'Toggle comment individually'},
          u     = {'<plug>NERDCommenterUncomment', 'uncomment-lines'},
          A     = {'<plug>NERDCommenterAppend', 'Comment append'},
          a     = {'<cmd>Telescope lps_code_actions<cr>', 'code-actions'},
        --          r     = 'coc-rename-symbol'		,
        --          f     = 'coc-format-selected'		,
      },
      x = {
          name	= '+text',
          a		= {'<Plug>(EasyAlign)', 'Align'},
      },
  }
  wk.register(normal_mapping, {prefix = "<leader>"})
  wk.register(visual_n_normal_mapping, {prefix = "<leader>"})
  wk.register(visual_n_normal_mapping, {prefix = "<leader>", mode="v"})
EOF


"let g:which_key_map.c = {
			"\ 'name'	: '+code'			,
			"\ 'c'		: 'comment-lines'		,
			"\ 'n'		: 'comment-force-nesting'	,
			"\ ' '		: 'toggle-comment'		,
			"\ 'm'		: 'comment-minimal'		,
			"\ 'i' 		: 'toggle-comment-individually'	,
			"\ 's' 		: 'comment-sexy'		,
			"\ 'y' 		: 'yank-and-comment'		,
			"\ '$' 		: 'comment-from-cursor'		,
			"\ 'A' 		: 'comment-append'		,
			"\ 'a' 		: [':Telescope lps_code_actions', 'code-actions'],
			"\ 'l' 		: 'comment-align-left'		,
			"\ 'b' 		: 'comment-align-both'		,
			"\ 'u' 		: 'uncomment-lines'		,
			"\ 'r' 		: 'coc-rename-symbol'		,
			"\ 'f' 		: 'coc-format-selected'		,
			"\}

"let g:which_key_map.x = {
			"\ 'name'	: '+text',
			"\ 'a'		: ['<Plug>(EasyAlign)', 'align'],
			"\}

"let g:which_key_map.t = {
			"\ 'name'	: '+toggle',
			"\ 'n'		: [':set nu!', 'line-number'],
			"\ 'r'		: [':set rnu!', 'relative-line-number'],
			"\}

"let g:which_key_map.g = {
			"\ 'name'	: '+git',
			"\ 's'		: [':Telescope git_status', 'git-status'],
			"\ 'S'		: [':Telescope git_stash', 'git-stash'],
			"\ 'c'		: [':Telescope git_commits', 'git-commits'],
			"\ 'f'		: [':Telescope git_files', 'search-file'],
			"\ 'b'		: [':Telescope git_branches', 'git-branch'],
			"\ 'B'		: [':Telescope git_bcommits', 'buffer-commits'],
			"\}

" STARTIFY
let g:startify_custom_header = 'startify#center([
			\"                       s/    .-/-                 ",
			\"                       -m/`` ..-:/..`yo           ",
			\"                       -oh`         /o            ",
			\"                      :.  `::/:o` `/--/           ",
			\"                     `:  `hhhho.   :ydN-          ",
			\"                     /  `yydMMMm  :msMMMo         ",
			\"                     /`  yyNMMMN..omdMMMd         ",
			\"                    -d+   /yyyo. /-/yhd+`         ",
			\"                      s/ `      -.//  +           ",
			\"                   .yNMN.  `    soo: -.           ",
			\"      -/oo/`-/+ooymMMMMMy      -oo`hsN:           ",
			\"    /mMMMMMMMMMMMMMMMMMMo      /...yMMMN+         ",
			\"   +MMMMMMMMMMMMMMMMMMmMMdo-.  .+hMMMMMMM/        ",
			\"   NMMMMMMMMMMMMMMMMNdmhMMMMMMNNMMoMhMMMM/        ",
			\"   hMMMMMMMMMMMMMMMMMMmMMMMMMMMMMMydmMMMs         ",
			\"   `sMMMMMMmoMMMMMMMMMMMMMMMMMMMMMMMMMmo          ",
			\"     /+sNh-  NMMMMMMMMMMMMMMMMMMMMMMm-` :         ",
			\"    `: :My   sMMMMMMMMMMMMMMMMMMMMMN. .` -        ",
			\"    /` mMN.  `yMMMMMMMMMMMMMMMMMMMm-   -. -       ",
			\"   `: +MMMN.   :hNMMMMMMMMMMMMMMNo`    `+:/+      ",
			\"   /  hMMMm.   -. `-///++shdNdso+oosyhmMMMMMNy+.  ",
			\" `/mdmdMMMo::-+-.`  .+..--.`NMMMMMMMMMMMMMMMMMMNh+",
			\"mMMMMMMMMMMMMMMMMMm/`...````-:+oydNMMMhhhdmms`    ",
			\"odNMMMMMMMMMMMNNNy`..`.-/..``        `            ",
			\" .-::-yhyo/:.   ` -  :...```.`.`                  ",
			\"                                                  ",
			\"          Oh boy, here I go coding again          ",
			\])'

" PYTHON SPECIFIC KEYBINDINGS
"augroup pybindings
  "autocmd! pybindings
  "autocmd Filetype python nmap <buffer> <silent> <localleader>db Oimport pdb; pdb.set_trace()<Esc>
  "autocmd Filetype python let g:which_key_localmap.d = {'name' : '+debug'}
  "autocmd Filetype python let g:which_key_localmap.d.b = 'add-breakpoint'
"augroup end

" LIGHTLINE
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" VSNIP
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

""""""""""""  NerdCommenter
let g:NERDCreateDefaultMappings = 0

""""""""""""  Telescope
lua <<EOF
    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension "file_browser"
EOF

""""""""""""  NVIM LSP/CMP
set completeopt=menu,menuone,noselect

lua <<EOF

    vim.o.updatetime = 250
    vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['svlangserver'].setup {
    capabilities = capabilities,
    on_init = function(client)
      client.config.settings.systemverilog = {
        includeIndexing     = {"**/*.{sv,svh}"},
        excludeIndexing     = {},
        defines             = {},
        launchConfiguration = "verilator -sv -Wall --lint-only",
        formatCommand       = "verible-verilog-format"
      }
      client.notify("workspace/didChangeConfiguration")
      return true
    end
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }

  -- Neovim lsp

      -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, bufopts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    end

    -- Use a loop to conveniently call 'setup' on multiple servers and
    -- map buffer local keybindings when the language server attaches
    local servers = { 'pyright', 'svlangserver', 'clangd' }
    for _, lsp in pairs(servers) do
      require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    end
EOF



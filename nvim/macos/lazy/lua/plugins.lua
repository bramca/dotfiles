return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    init = function()
      require('mason').setup()
    end,
  },
  { -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable 'make' == 1
  },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    keys = {
        { '<leader>/',  '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer search', },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',                   desc = 'Buffers', },
        { '<leader>fc', '<cmd>Telescope git_commits<cr>',               desc = 'Commits', },
        { '<leader>ff', '<cmd>Telescope find_files<cr>',                desc = 'Find All Files', },
        { '<C-p>',      '<cmd>Telescope git_files<cr>',                 desc = 'Git files', },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',                 desc = 'Help', },
        { '<leader>fj', '<cmd>Telescope command_history<cr>',           desc = 'History', },
        { '<leader>fk', '<cmd>Telescope keymaps<cr>',                   desc = 'Keymaps', },
        { '<leader>fl', '<cmd>Telescope lsp_references<cr>',            desc = 'Lsp References', },
        { '<leader>fo', '<cmd>Telescope oldfiles<cr>',                  desc = 'Old files', },
        { '<leader>fr', '<cmd>Telescope live_grep<cr>',                 desc = 'Ripgrep', },
        { '<leader>fs', '<cmd>Telescope grep_string<cr>',               desc = 'Grep String', },
        { '<leader>ft', '<cmd>Telescope treesitter<cr>',                desc = 'Treesitter', },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            additional_args = function(_)
              return { "--hidden" }
            end
          },
          find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
          }

        },
        extensions = {
          "fzf"
        },
      })
      telescope.load_extension("fzf")
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
  },
  { -- LSP configuration
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
    config = function ()
      -- LSP settings.
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don"t have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end

          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- See `:help K` for why this keymap
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Lesser used LSP functionality
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      local servers = {
        -- clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        -- tsserver = {},
        lua_ls = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          }
        }
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }
    end,
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    opts = {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = require('cmp').mapping.preset.insert {
        ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
        ['<C-Space>'] = require('cmp').mapping.complete(),
        ['<CR>'] = require('cmp').mapping.confirm {
          behavior = require('cmp').ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  },
  { -- Treesitter: highlighting, edit and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'vim', 'http', 'javascript', 'astro' },
        ignore_install = { 'help' },

        highlight = { enable = true },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = false,
    dependencies = { 'nvim-treesitter' },
  },
  { -- Org mode
    'nvim-orgmode/orgmode',
    config = function()
      -- Load treesitter grammar for org
      require('orgmode').setup{}
    end,
  },
  { -- Table mode
    'dhruvasagar/vim-table-mode',
  },
  { -- CSV
    'cameron-wags/rainbow_csv.nvim',
    config = function()
      require 'rainbow_csv'.setup()
    end,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
  },
  { -- Icon Picker
    'nvim-telescope/telescope-symbols.nvim'
  },
  { -- REST Client
    'rest-nvim/rest.nvim',
    commit = '45b52200b4a7712a68579d9d13945427e2764725',
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = true,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  },
  { -- Float Terminal
    'voldikss/vim-floaterm',
  },
  { -- Lua Line time
    'archibate/lualine-time',
  },
  { -- DAP (Debug Adapter Protocol)
    'mfussenegger/nvim-dap',
  },
  { -- DAP UI stuff
    'nvim-neotest/nvim-nio',
  },
  { -- DAP Golang
    'leoluz/nvim-dap-go',
    lazy = false,
    config = function()
      require('dap-go').setup()
    end
  },
  { -- DAP UI
    'rcarriga/nvim-dap-ui',
    lazy = false,
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dapui = require("dapui")
      dapui.setup()
    end,
  },
  { -- Nvim tree
    'nvim-tree/nvim-tree.lua',
    opts = {
      disable_netrw = true,
      update_cwd = true,
      renderer = {
        icons = {
          show = {
            file = false,
            folder_arrow = false,
            git = false,
          },
          glyphs = {
            folder = {
              default = '>',
              open = 'v',
              empty = '>',
              empty_open = 'v',
            }
          },
        },
        indent_markers = {
          enable = true,
        }
      }
    }
  },
  { -- Yazi file manager
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Open the file manager in nvim's working directory" ,
      },
    },
    --- YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
    },
  },
  {
    'klen/nvim-test',
    config = function()
      require('nvim-test').setup()
    end,
  },
  { -- Test wrapper
    'nvim-neotest/neotest',
    dependencies = { 'nvim-neotest/neotest-go' },
    config = function()
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace('neotest')
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message =
            diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
            return message
          end,
        },
      }, neotest_ns)
      require('neotest').setup({
        -- your neotest config here
        adapters = {
          require('neotest-go')({
            recursive_run = true
          }),
        },
      })
    end,
  },
  { -- Auto change dir
    'airblade/vim-rooter',
  },
  { -- Autopair
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  { -- Git
    'tpope/vim-fugitive'
  },
  { -- Git
    'tpope/vim-rhubarb'
  },
  { -- Git
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require('gitsigns').setup()
    end,
  },
  { -- Git
    'idanarye/vim-merginal'
  },
  { -- Catppuccin Theme
    'catppuccin/nvim'
  },
  { -- Kanagawa Theme
    'rebelot/kanagawa.nvim'
  },
  { -- Nightfox Theme
    'EdenEast/nightfox.nvim',
    config = function ()
      require('nightfox').setup({
        options = {
          dim_inactive = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        }
      })
    end,
  },
  { -- Everforest Theme
    'sainnhe/everforest'
  },
  { -- OneDark Theme
    'navarasu/onedark.nvim',
    config = function ()
      require('onedark').setup {
        style = 'deep',
        -- toggle theme style ---
        toggle_style_key = '<leader>cb', -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = {'light', 'deep'}, -- List of styles to toggle between
      }
    end,
  },
  { -- Fancier statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path=1}},
        lualine_x = {'encoding', 'fileformat', 'filetype', 'ctime'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    },
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    version = "3.5.4",
    config = function()
      require('ibl').setup {
        exclude = {
          filetypes = { 'dashboard' },
        }
      }
    end
  },
  { -- 'gc' to comment visual regions/lines
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },
  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth'
  },
  { -- Hex colorizer
    'norcalli/nvim-colorizer.lua'
  },
  { -- Markdown Preview
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
  },
  { -- Homsecreen Dashboard
    'nvimdev/dashboard-nvim',
    lazy = false,
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        config = {
          week_header = {
            enable = true,
          },
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
}

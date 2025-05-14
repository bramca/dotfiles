-- LSP configuration
local M = {
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

    -- Completion
    'hrsh7th/cmp-nvim-lsp'
  },
}

function M.config()
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
        settings = servers[server_name],
      }
    end,
  }
end

return M

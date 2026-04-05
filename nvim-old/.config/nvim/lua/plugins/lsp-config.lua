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
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  local servers = {
    -- clangd = {},
    gopls = {
      capabilities = capabilities,
    },
    pyright = {
      capabilities = capabilities,
    },
    rust_analyzer = {
      capabilities = capabilities,
    },
    ts_ls = {
      capabilities = capabilities,
    },
    lua_ls = {
      capabilities = capabilities,
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
      }
    }
  }


  for server, settings in pairs(servers) do
     vim.lsp.config(server, {
      settings = {
        settings
      }
    })
  end

  -- Ensure the servers above are installed


   require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers),
  })

end

return M

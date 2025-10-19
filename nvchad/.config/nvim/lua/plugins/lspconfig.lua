return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Useful status updates for LSP
        "j-hui/fidget.nvim",

        -- Additional lua configuration, makes nvim stuff amazing
        "folke/neodev.nvim",
    },
    config = function()
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
            ts_ls = {},
            lua_ls = {
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


        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })
    end
}

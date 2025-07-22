return {
    {
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        opts = function()
            dofile(vim.g.base46_cache .. "mason")
            return {
                PATH = "skip",

                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = " ",
                        package_uninstalled = " ",
                    },
                },

                max_concurrent_installers = 10,
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "basedpyright",  -- Python LSP
                    "ruff",          -- Python linter and formatter
                    "fish_lsp",      -- Fish shell LSP
                    "gopls",         -- Go LSP
                    "rust_analyzer", -- Rust LSP
                    "volar",         -- Vue 3 LSP
                    "ts_ls",         -- TypeScript/JavaScript LSP
                    "lua_ls",        -- Lua LSP
                },
                automatic_installation = true,
            })
        end,
    }
}

local opts = {
    ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
        pcall(function()
            dofile(vim.g.base46_cache .. "syntax")
            dofile(vim.g.base46_cache .. "treesitter")
        end)
        return opts
    end,
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

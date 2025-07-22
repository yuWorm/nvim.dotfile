return {
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm" },
        opts = {
            size = 20,
            on_open = require("utils.nvimtree").set_nvimtree_when_open_term,
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "term")
            require("toggleterm").setup(opts)
            require "configs.term"
        end,
    },
    {
        "ryanmsnyder/toggleterm-manager.nvim",
        dependencies = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
        },
        config = true,
        lazy = false,
    },
}

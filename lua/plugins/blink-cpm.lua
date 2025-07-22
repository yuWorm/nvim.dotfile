local keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
    ["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
}
return {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },

    dependencies = {
        "nvchad/ui",
        "rafamadriz/friendly-snippets",
        {
            -- snippet plugin
            "L3MON4D3/LuaSnip",
            dependencies = "rafamadriz/friendly-snippets",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
                require("luasnip").config.set_config(opts)
                require "configs.luasnip"
            end,
        },

        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            },
        },
    },

    opts_extend = { "sources.default" },

    opts = function()
        -- dofile(vim.g.base46_cache .. "blink")
        local opts = require "nvchad.blink.config"
        opts.keymap = keymap
        return opts
    end,
}

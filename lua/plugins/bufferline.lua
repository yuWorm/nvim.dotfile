return {
    "akinsho/bufferline.nvim",
    version = "*",
    -- enabled=false,
    event = "VeryLazy",
    keys = {
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<leader>x", "<cmd>BufferClose<cr>", desc = "Prev buffer" },
    },
    opts = {
        options = {
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
                {
                    filetype = "snacks_layout_box",
                },
            },
        },
    },
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function(_, opts)
        dofile(vim.g.base46_cache .. "bufferline")
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}

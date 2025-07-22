-- 存放一些简单，无须什么配置的插件
return {
    "nvzone/volt",
    "nvzone/menu",
    "nvim-lua/plenary.nvim",
    { "nvzone/minty", cmd = { "Huefy", "Shades" } },
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        opts = function()
            dofile(vim.g.base46_cache .. "whichkey")
            return {}
        end,
    },
    "MunifTanjim/nui.nvim",
    -- AI
    { "augmentcode/augment.vim", event = "VeryLazy" },
}

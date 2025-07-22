return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    enabled=false,
    opts = function(_, opts)
        if not vim.g.trouble_lualine then
        end
    end,
}

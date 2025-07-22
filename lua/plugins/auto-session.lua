return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        -- Will use Telescope if installed or a vim.ui.select picker otherwise
        { "<leader>sr", "<cmd>SessionSearch<CR>", desc = "Session search" },
        { "<leader>ss", "<cmd>SessionSave<CR>", desc = "Save session" },
        { "<leader>sa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        -- log_level = 'debug',
        load_on_setup = true,
    },
}

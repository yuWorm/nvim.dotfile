local map = vim.keymap.set

local opts = {
    filters = { dotfiles = false },
    disable_netrw = true,
    hijack_cursor = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = false,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        width = 30,
        preserve_window_proportions = true,
    },
    renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
            glyphs = {
                default = "󰈚",
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                },
                git = { unmerged = "" },
            },
        },
    },
}

local on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    -- 默认映射（可选，保留默认快捷键）
    api.config.mappings.default_on_attach(bufnr)

    -- 自定义快捷键
    map("n", "<leader>e", api.tree.toggle, { desc = "Toggle Tree" }) -- 切换 nvim-tree
end

return {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    on_attach = on_attach,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            dofile(vim.g.base46_cache .. "devicons")
            return { override = require "nvchad.icons.devicons" }
        end,
    },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Tree" },
        { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "nvimtree toggle window" },
    },
    opts = function()
        dofile(vim.g.base46_cache .. "nvimtree")
        return opts
    end,
}

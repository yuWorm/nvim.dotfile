local M = {}

M.close_nvimtree_if_open = function()
    local nvim_tree = require "nvim-tree.api"
    nvim_tree.tree.close()
end

M.set_nvimtree_when_open_term = function(terminal)
    local nvimtree = require "nvim-tree"
    local nvimtree_view = require "nvim-tree.view"
    if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
        local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
        nvimtree.toggle()
        nvimtree_view.View.width = nvimtree_width
        nvimtree.toggle(false, true)
    end
end

return M

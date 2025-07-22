-- 创建常用终端的快捷方式
local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal

local fload_term = function(cmd, opts)
    opts = opts or {}
    local _opts = {
        cmd = cmd,
        direction = "float",
        float_opts = {
            border = "single",
        },
        -- 当终端打开时运行的函数
        on_open = function(term)
            vim.cmd "startinsert!"
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
    }

    for key, value in pairs(opts) do
        _opts[key] = value
    end

    return Terminal:new(_opts)
end

-- 创建一个 lazygit 终端
-- local lazygit = Terminal:new {
--     cmd = "lazygit",
--     dir = "git_dir",
--     direction = "float",
--     float_opts = {
--         border = "single",
--     },
--     -- 当终端打开时运行的函数
--     on_open = function(term)
--         vim.cmd "startinsert!"
--         vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
--     end,
-- }
local lazygit = fload_term("lazygit", { dir = vim.fn.getcwd() })

local function _lazygit_toggle()
    lazygit:toggle()
end

-- htop 终端
local htop = Terminal:new {
    cmd = "htop",
    direction = "float",
    on_open = function(term)
        vim.cmd "startinsert!"
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
}
local function _htop_toggle()
    htop:toggle()
end

-- 设置快捷键映射
map("n", "<leader>th", _htop_toggle, { desc = "打开htop" })
map("n", "<leader>tg", _lazygit_toggle, { desc = "打开lazygit" })

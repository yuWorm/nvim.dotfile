local autocmd = vim.api.nvim_create_autocmd

-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

        if not vim.g.ui_entered and args.event == "UIEnter" then
            vim.g.ui_entered = true
        end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
            vim.api.nvim_del_augroup_by_name "NvFilePost"

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})

                if vim.g.editorconfig then
                    require("editorconfig").config(args.buf)
                end
            end)
        end
    end,
})
-- 获取当前主题的颜色并应用到 ToggleTerm
local function setup_toggleterm_colors()
    local normal_bg = vim.fn.synIDattr(vim.fn.hlID "Normal", "bg")
    local normal_fg = vim.fn.synIDattr(vim.fn.hlID "Normal", "fg")

    require("toggleterm").setup {
        highlights = {
            Normal = {
                guibg = normal_bg or "#1e1e1e",
                guifg = normal_fg or "#ffffff",
            },
            NormalFloat = {
                guibg = normal_bg or "#1e1e1e",
            },
        },
    }
end

-- 在主题加载后调用
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = setup_toggleterm_colors,
})

-- 自动切换到当前文件所在目录
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.cmd "silent! lcd %:p:h"
    end,
})

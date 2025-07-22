-- 定义所有需要启用的语言服务器及其配置
local servers = {
    -- HTML语言服务器 - 使用默认配置
    html = {},

    -- CSS语言服务器 - 使用默认配置
    cssls = {},

    -- Python语言服务器（推荐使用basedpyright而不是pyright）
    basedpyright = {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    typeCheckingMode = "basic",
                    -- 启用自动导入
                    autoImportCompletions = true,
                },
            },
        },
    },

    -- Go语言服务器 - 使用默认配置
    gopls = {},

    -- Lua语言服务器 - 使用默认配置
    lua_ls = {},

    -- Rust语言服务器 - 使用默认配置
    rust_analyzer = {},

    -- TypeScript/JavaScript语言服务器 - 使用默认配置
    ts_ls = {},

    -- AWK语言服务器 - 使用默认配置
    awk_ls = {},

    -- Bash语言服务器 - 使用默认配置
    bashls = {},
}

-- 遍历所有服务器并启用配置
for server_name, server_opts in pairs(servers) do
    -- 启用语言服务器（需要Neovim v0.11.0或更高版本）
    vim.lsp.enable(server_name)

    -- 配置语言服务器选项（需要Neovim v0.11.0或更高版本）
    vim.lsp.config(server_name, server_opts)
end

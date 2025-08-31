local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map({ "n", "v" }, "m", "b", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>qq", ":qa<CR>")
map("n", "<leader>ww", ":w<CR>", { desc = "保存文件" })
map("n", "<leader>aa", "ggVG", { desc = "全选" })
map("n", "<S-u>", "<C-r>", { desc = "重做" })

-- 快速切换
-- map({ "n", "v" }, "J", "6j", { desc = "快速移动" })
-- map({ "n", "v" }, "K", "6k", { desc = "快速移动" })
map({ "n", "v" }, "<C-j>", "6j", { desc = "快速移动" })
map({ "n", "v" }, "<C-k>", "6k", { desc = "快速移动" })
map({ "n", "v" }, "<C-h>", "0", { desc = "移动到行首" })
map({ "n", "v" }, "<C-l>", "$", { desc = "移动到行尾" })

-- 重载配置
map("n", "<leader>rc", "<CMD>source ~/.config/nvim/init.lua<CR>", { desc = "重载配置" })

map("n", "<Esc>", ":nohl<CR>", { desc = "清除搜索高亮" })

-- Tab窗口相关内容

-- 缩进
map("v", ">", ">gv", { desc = "增加缩进" })
map("v", "<", "<gv", { desc = "减少缩进" })

-- 粘贴不替换寄存器
map("v", "p", '"_dP', { desc = "粘贴不替换寄存器" })
map("v", "P", "p", { desc = "普通粘贴" })

-- 代码折叠
map("n", "zc", "zc", { desc = "折叠代码块" })
map("n", "zo", "zo", { desc = "展开代码块" })
map("n", "zz", "za", { desc = "切换代码折叠" })

-- 保持选择状态下的缩进
map("v", "<", "<gv", { desc = "减少缩进并保持选择" })
map("v", ">", ">gv", { desc = "增加缩进并保持选择" })
map("n", "<leader>ta", ":tabclose<CR>", { desc = "关闭所有标签页" })

-- 快速保存和退出
map("n", "<C-s>", ":w<CR>", { desc = "快速保存" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "插入模式快速保存" })

-- -- 标签页切换
-- map("n", "<C-h>", function()
--     require("bufferline").cycle_prev()
-- end, { desc = "切换到上一个标签页" })
--
-- map("n", "<C-l>", function()
--     require("bufferline").cycle_next()
-- end, { desc = "切换到下一个标签页" })
--
-- map("n", "<leader>x", function()
--     require("bufferline").close_buffer()
-- end, { desc = "buffer close" })
--
-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Format
map({ "n", "x" }, "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map("n", "<leader>ts", function()
    require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

-- terminal
map("n", "<leader>tf", ":FloatermToggle<CR>", { desc = "打开浮动终端" })
map("n", "<leader>tm", ":Telescope toggleterm_manager<CR>", { desc = "打开终端管理器" })
map("n", "<leader>tt", function()
    require("utils.toggleterm").toggle()
end, { desc = "切换终端" })
map("n", "<leader>tnf", function()
    require("utils.toggleterm").new_float()
end, { desc = "创建新的浮动终端" })
map("n", "<leader>tnh", function()
    require("utils.toggleterm").new_horizontal()
end, { desc = "创建新的浮动终端" })
map("n", "<leader>tnv", function()
    require("utils.toggleterm").new_()
end, { desc = "创建新的浮动终端" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- 终端模式下的窗口切换快捷键
map("t", "<C-w>h", "<C-\\><C-n><C-w>h", { desc = "切换到左侧窗口" })
map("t", "<C-w>j", "<C-\\><C-n><C-w>j", { desc = "切换到下方窗口" })
map("t", "<C-w>k", "<C-\\><C-n><C-w>k", { desc = "切换到上方窗口" })
map("t", "<C-w>l", "<C-\\><C-n><C-w>l", { desc = "切换到右侧窗口" })

-- 更简洁的退出终端模式快捷键
map("t", "<Esc>", "<C-\\><C-n>", { desc = "退出终端模式" })
map("t", "jk", "<C-\\><C-n>", { desc = "退出终端模式" })

-- new terminals
map("n", "<leader>h", function()
    require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
    require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
    require("persistence").load()
end)

-- select a session to load
map("n", "<leader>qS", function()
    require("persistence").select()
end)

-- load the last session
map("n", "<leader>ql", function()
    require("persistence").load { last = true }
end)

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", function()
    require("persistence").stop()
end)

-- AI Code相关快捷键(Augment Code)
map("n", "<leader>ac", "<cmd>Augment chat<CR>", { desc = "AI Code chat" })
map("n", "<leader>an", "<cmd>Augment chat-new<CR>", { desc = "AI Code new chat" })
map("n", "<leader>at", "<cmd>Augment chat-toggle<CR>", { desc = "AI Code chat toggle" })

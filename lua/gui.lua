-- Neovide 毛玻璃效果配置
if vim.g.neovide then
  -- 基本设置
  vim.o.guifont = "Maple Mono NF CN:h20:Medium"
  vim.g.neovide_opacity = 0.9
  
  -- 启用背景模糊（毛玻璃效果）
  vim.g.neovide_window_blurred = true
  
  -- 浮动窗口模糊效果
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  
  -- 浮动窗口阴影
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
end

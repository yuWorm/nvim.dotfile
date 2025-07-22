local M = {}

M.terms = {}
M.current = nil

M.create_term = function (direction, opts)
  direction = direction or "horizontal"
  opts = opts or {}
  if opts.dir == nil then
    opts.dir = vim.fn.getcwd()
  end
  opts.direction = direction
  local term = require("toggleterm.terminal").Terminal:new(opts)
  term:open()
  M.terms[term.id] = term
  M.current = term.id
  return term.id
end

M.toggle = function (id)
  if id == nil then
    if M.current == nil then
      M.create_term()
    end
    id = M.current
  end
  if M.terms[id] == nil then
    return
  end
  M.terms[id]:toggle()
end

M.new_float = function (opts)
  return M.create_term("float", opts)
end

M.new_horizontal = function (opts)
  return M.create_term("horizontal", opts)
end

M.new_vertical = function (opts)
  return M.create_term("vertical", opts)
end

return M

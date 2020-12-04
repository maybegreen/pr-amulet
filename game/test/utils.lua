local w = require "graphics"
local M = {}

function M.attach(s)
  if w.scene == nil then
    w.scene = am.group{s}
  else
    local n = am.group(s)
    w.scene = w.scene:append(n)
  end
end

function M.detach(s)
  if s == nil or w.scene == nil then return
  else
    w.scene = w.scene:remove(s)
  end
end


return M

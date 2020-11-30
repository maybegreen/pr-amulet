local win = require "window"
local M = {}

M.hdl = function (_s)
   for i, v in ipairs(_s.kmap)
   do
      if win:key_pressed(v) then
         local arg = v
         _s.kfun[i](arg)
      end
   end
end

return M

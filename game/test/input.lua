local M = {}

M.hdl = function (_s,w)
   for i, v in ipairs(_s.kmap)
   do
      if w:key_pressed(v) then
         local arg = v
         _s.kfun[i](arg)
      end
   end
end

return M

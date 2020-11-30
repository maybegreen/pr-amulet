local w = require "window"
local M = {}

M.p_pool = {}
M.build = function (self, s, dp)
   local _g = {}
   for i = 0, w.width/s, 1 do
      for j = 0, w.height/s, 1 do
         self.p_pool[i] = vec2(i*s , j*s)
         --print(self.p_pool[i])
      end
   end
   for i = 1, #self.p_pool - 1 do
      local n = am.line(v, self.p_pool[i+1])
      g_[i] = n
   end
   return _g
end

return M



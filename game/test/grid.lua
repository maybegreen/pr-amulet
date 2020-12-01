local w = require "graphics"
local M = {}

local M = {}
function M:init(s)
   local A = {}
   local B = {}
   local C = {}
   local D = {}
   -- on y = w.height, from x = 0 to x = w.width
   local c = 0
   for x = -w.width, w.width, s do
      A[c] = vec2(x, w.height)
      B[c] = vec2(x, -w.height)
      c = c + 1   end
   c = 0
   for y = -w.height, w.height, s do
      C[c] = vec2(w.height, y)
      D[c] = vec2(-w.height, y)
      c = c + 1
   end
   M.l = am.translate(0, 0)
   M.k = am.translate(0, 0)
   M.thickness = 1
   M.color = vec4(.1, .1, .1, 1)
   for i, v in ipairs(A) do
      M.l:append(am.line(A[i], B[i], M.thickness, M.color)) end
   for i, v in ipairs(B) do
      M.k:append(am.line(C[i], D[i], M.thickness, M.color)) end
   M.node = am.group() ^ { M.l, M.k }
end

return M

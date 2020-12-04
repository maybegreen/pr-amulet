local w = require "graphics"
local db= require "debug"
local M = {}

local M = {}
function M:init(s, tckn, cl)
  local V = {} --vertical lines
  local H = {} -- horizontal lines
  -- from y = -w.height to w.height,
  --from x = -w.width to x = w.width and step = s = 16
  local c, d = 1, 1 --index count
  for y = -w.height, w.height, s do
    H[c]= vec2(-w.width, y)
    c = c + 1
  end
  for x = -w.width, w.width, s do
    V[d] = vec2(x, -w.height)
    d = d + 1
  end

  self.glines = am.translate(0, 0)
  self.thickness = tckn
  self.color = cl
  for i, v in ipairs(H) do
    local hline = am.line(v, v{x = -v.x}, self.thickness, self.color)
    local vline = am.line(V[i], V[i]{y = -V[i].y}, self.thickness, self.color)
    self.glines = self.glines:append(am.group{hline, vline})
  end
  self.node = self.glines
end

return M

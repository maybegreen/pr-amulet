local w = require "graphics"
local map = {
  data = {},
  ts = 16, --tile size
  nodes = am.translate(0, 0)
}

map.sym = {
  ["W"] = w.W,
  ["G"] = w.G,
  ["@"] = w.Start
 }

function map:make(path)
  local s = require(path)
  self.data = s.data

  local x, y = 0, 0
  for s in string.gmatch(self.data,"[^\r\n]+") do
    for w in string.gmatch(s, "(%a+)") do
      for k, v in pairs(map.sym) do
        if w == k then
          self.nodes:append(am.translate(vec2(x, y)) ^ v)
        end
      end
      x = x + 16
    end
    y = y - 16
    x = 0
  end
end

return map

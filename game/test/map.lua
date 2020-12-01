
local map = {
  name = "Test",
  width = 400,
  height = 400,
  data = {},
  ts = 16, --tile size
  nodes = am.translate(0, 0)
}

function map:make(path)
  self.data = loadfile(path)
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

local w = require "graphics"
local map = {
  data = {},
  ts = 16, --tile size
  nodes = am.translate(0, 0) ^ am.scale(1):tag"zoom"
}
local t = w.tiles
map.sym = {
  ["W"] = t.W,
  ["G"] = t.G,
  ["S"] = t.S
 }

 function map:fill(t)
   for k, v in pairs(map.sym) do
     if t == k then
       for y = -w.height, w.height*2/w.ts, 16 do
         for x = -w.width, w.width*2/w.ts, 16 do
           self.nodes:append(am.translate(vec2(x, y)) ^ v)
         end
       end
     end
   end
 end

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

function map:bind()
  local look = {
    ["left"] = vec2(16, 0),
    ["right"] = vec2(-16, 0),
    ["up"] = vec2(0, -16),
    ["down"] = vec2(0, 16)
  }
  map.action =
  function(self)
    for k, v in pairs(look) do
      if w:key_pressed(k) then
        self.position2d = self.position2d + v
      end
      if w:key_pressed("kp_plus") then
        self"zoom".scale2d = self"zoom".scale2d + .2
      end
    end
  end
  w.scene:action(map.action)
end

return map

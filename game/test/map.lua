--local grid = require "grid"
--local utils = require "utils"

-- local w = am.window({
--   title = "MapTest",
-- width = 400,
--   height = 400
-- })

-- w.scene = am.scale(1, 1)

local function attach(s)
  if w.scene == nil then
    w.scene = am.group{s}
  else
    local n = am.group{s}
    w.scene = w.scene:append(n)
  end
end

local function detach(s)
  w.scene = w.scene:remove(s)
end

local map = {
  name = "Test",
  width = 400,
  height = 400,
  data = {},
  ts = 16, --tile size
  nodes = am.translate(0, 0)
}

map.tiles = {
    W = am.rect(0,0,map.ts,map.ts, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,map.ts,map.ts, vec4(.2,.7,.3,1))
  }

map.sym = { ["W"] = map.tiles.W, ["G"] = map.tiles.G }

function map:init()
  self.data =
  [[
  W W W W W W
  W G G G G W
  W G G G G W
  W G G G G W
  W G G G G W
  W W W W W W
  ]]
end

function map:make()
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

map:init()
map:make()
local ts = 16
local look = {
  ["left"]  = vec2( ts, 0),
  ["right"] = vec2(-ts, 0),
  ["up"]    = vec2(0, -ts),
  ["down"]  = vec2(0,  ts)
}

local zoom = {
  ["kp_plus"]  =  .25,
  ["kp_minus"] = -.25
}
  w.scene:action(function(self)
    for k,v in pairs(look) do
      if w:key_pressed(k) then
        self"translate".position2d = self"translate".position2d + v
      end
    end
    for k,v in pairs(zoom) do
      if w:key_pressed(k) then
        --log("scale: " .. self.scale2d)
        self.scale2d = math.clamp(self.scale2d + v, 0.1, 10)
      end
    end
  end)

  attach(map.nodes)

local grid = require "grid"
local utils = require "utils"

local w = am.window({
  title = "MapTest",
  width = 400,
  height = 400
})

local function attach(s)
  if w.scene == nil then
    w.scene = s
  else
    w.scene = w.scene:append(s)
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
  node = am.translate(0,0),
}

map.tiles = {
    W = am.rect(0,0,map.ts,map.ts, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,map.ts,map.ts, vec4(.2,.7,.3,1))
  }

map.sym = { ["W"] = map.tiles.W, ["G"] = map.tiles.G }


function map:add (a, p)
  self.node:append(am.translate(p) ^ a)
end

function map:init()
  map.data =
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
          self:add(v, vec2(x, y))
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

grid:init(w, 16)
w.scene = am.translate(0, 0)
local look = {
  ["left"] = vec2(16, 0),
  ["right"] = vec2(-16, 0),
  ["up"] = vec2(0, -16),
  ["down"] = vec2(0, 16)}

  w.scene:action(function(self)
    for k,v in pairs(look) do
      if w:key_pressed(k) then
        self.position2d = self.position2d + v
      end
    end
  end)
  attach(map.node)
  attach(grid.node)

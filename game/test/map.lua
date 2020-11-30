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
  node = am.translate(0,0) ,
  data = {},
  name = "Test",
  width = 400,
  height = 400
}
map.sym = { ["W"] = W, ["G"] = G }

function map:add (a, p)
  self:append(
  am.group()
  ^ {am.translate(p) ^ a})
end

local W = am.rect(0,0,16,16, vec4(.2,.5,.8,1))
local G = am.rect(0,0,16,16, vec4(.2,.7,.3,1))

function map:init()
  local x, y = 0, 0
  map.data =
  [[
  W W W W W W
  W G G G G W
  W G G G G W
  W G G G G W
  W W W W W W
  ]]
end

function map:redraw()
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


-- function map:fill(t)
--    for i = -w.width, w.width, 16 do
--       for j = -w.height, w.height, 16 do
--          self:add(t, vec2(i, j))
--       end
--    end
-- end

function map:fill(t)
  local y = 0
  for i=1, w.width/16 * w.height/16, 1 do

    self.data = self.data .. t
  end
end

local isle = [[
GGGG
GGGG
GGGG
]]

map:init()
map:fill("W")
map:redraw()
--map:add(isle, vec2(0, 0))
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

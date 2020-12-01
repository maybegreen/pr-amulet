local grid = require "grid"
local utils = require "utils"
local map = require "map"

local w = am.window({
      title = "RogueTest",
      width = 400,
      height = 400
})

local tiles = {
    W = am.rect(0,0,map.ts,map.ts, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,map.ts,map.ts, vec4(.2,.7,.3,1))
  }

  map.sym = {
    ["W"] = tiles.W,
    ["G"] = tiles.G,
    ["@"] = tiles.Start
   }

map:make("entry")

local moves = {
   ["y"] = vec2(-1, 1), ["k"] = vec2(0, 1), ["u"] = vec2(1,1),
   ["h"] = vec2(-1, 0), ["r"] = vec2(0, 0), ["l"] = vec2(1,0),
   ["b"] = vec2(-1,-1), ["j"] = vec2(0,-1), ["n"] = vec2(1,-1)
}

local p = am.translate(0,0) ^ am.rect(0,0,16,16,vec4(.5,.2,.5, 1))
p:action(function(p)
      if w:key_pressed("escape") then
         w:close() end
      for _,v in pairs(moves) do
         if w:key_pressed(_) then
            p:move(v*map.ts) end
      end
end)


function p:move(d)
  self.position2d = self.position2d + d
end

p:append(am.translate(8,8) ^ am.text("@"))
p:action(function(p)
      p"text".text = "@" .. p.position2d end)

grid:init(w, 16)

utils.attach(w, map.nodes)
utils.attach(w, grid.node)
utils.attach(w, p)

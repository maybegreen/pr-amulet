local w = require "graphics"
local M = {}

function M:init()
  local moves = {
    ["y"] = vec2(-1, 1), ["k"] = vec2(0, 1), ["u"] = vec2(1,1),
    ["h"] = vec2(-1, 0), ["r"] = vec2(0, 0), ["l"] = vec2(1,0),
    ["b"] = vec2(-1,-1), ["j"] = vec2(0,-1), ["n"] = vec2(1,-1)
  }

  M.node = am.translate(0,0):tag"player" ^ w.player

  function M.node:move(d)
    self.position2d = self.position2d + d
    log("pos = " .. self.position2d)
  end

  M.node:action(function(p)
    for _,v in pairs(moves) do
      if w:key_pressed(_) then
        p:move(v * 16)
      end
    end
  end)
end




return M

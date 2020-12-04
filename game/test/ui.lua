local w = require "graphics"
local u = require "utils"
local ui = {}

function ui:init(p)
  self.text = " "
  self.position = vec2(-w.width* 7/8, w.height * 7/8)
  self.node = am.translate(0,0) ^ am.text(self.text, vec4(1, 1, 1, 1), "left", "top")

  self.node:action(function(self)
    self"text".text = "Blah"
  end)
  w.scene = self.node
end

return ui

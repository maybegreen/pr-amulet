st_ = require "lib.statemachine"
in_ = require "input"
local M = {}

-- Mode New Character Screen
M.new = function(self, spawn_p)
   self.ask =
      am.translate(0,150) ^
      am.text("Name: ")
   
   self.player = {health = 1000, position = spawn_p}
   self.player.node =
      am.translate(0, 0) ^
      am.scale(3) ^
      am.sprite("game/player/sprite.png")
   self.player.state = st_.create({
         initial = "none",
         events = {
            { name = "wakeup", from = "none", to = "idle" },
            { name = "move"  , from = "idle", to = "walk" },
            { name = "stop"  , from = "walk", to = "idle" },
            { name = "rest"  , from = "idle", to = "sleep"}
   }})
   self.ps = self.player.state -- binding
   
   self.ps.onstatechange = function (self, event, from, to)
      log("<Player> State from: " .. from .. " to: " .. to)
   end
   self.ps:wakeup()
   self.ps.onidle = function (self, e, f, t)
      local s
      local kmap = {"up", "down", "left", "right"}   
      local kfun = {
         self.move("up"),
         self.move("down"),
         self.move("left"),
         self.move("right")
      }
      
   end

   self.debug =
      am.translate(0,250)^
      am.text("X: " .. self.player.node.position2d.x)
end

M.move = function (d)
   
end
   
return M

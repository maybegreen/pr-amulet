local w_ = require "window"
local st = require "lib.statemachine"
local in_ = require "input"
local play = require "game.play"
local ut_ = require "utils"

local gs = st.create({
      events  = {
         { name = 'start', from = "none", to = "menu" },
         { name = 'play',  from = "menu", to = "game" },
         { name = 'quit',  from = "game", to = "menu" }
}})

gs.onstatechange = function (self, event, from, to)
   log("<Game> Changing state from: " .. from .. " to: " .. to)
end

gs.ongame = function (self, event, from, to, mode)
   play.new(play, vec2(0))
   local _s = am.group{play.player.node, play.debug, play.ask}
   local k = {}
   k.map = {"escape"}
   k.fun = {
      function () gs:quit() end,
   }
   ut_.attach(_s, k, w_.scene)
end

gs.onmenu = function (self, event, from, to)
   local choices = {"New", "Quit"}
   if from == "game" then
      table.insert(choices, 1, "Resume")
   end
   
   choices.selected = 1
   local menu_cycle = function (n)
      local nn
      if n > #choices then nn = 1
      elseif n < 1 then nn = #choices
      end
      return nn or n
   end
            
   local _c = {}
   local y = 0
   for i, v in ipairs(choices) do
      _c[i] =
         am.translate(0, y)
         ^ am.scale(2)
         ^ am.text(v, "left", "bottom")
      y = y - 64
   end

    local _p =
      am.translate(-256,0) ^
      am.rect(0,0,32,32)
      
   local _s =
      am.group(_c):append(_p)
   local sel = choices.selected
   local lines = am.line(vec2(_p.x, _p.y),
                         vec2(_c[sel].x,_c[sel].y), 1,
                         vec4(.3, .5, .3, 1))
   lines:action(function(lines)
         local sel = choices.selected
         lines.point1 = vec2(_p.x, _p.y)
         lines.point2 = vec2(_c[sel].x,_c[sel].y)
   end)

   _s = _s:append(lines)
   _s.name = "menu"

   local choice_pos = function (c)
      local pos = _c[c].position2d
      return pos{ x = -256 }
   end

   local move_select = function (d)
      local n = choices.selected
      local c = 0
      if d == "up" then c = -1
      elseif d == "down" then c = 1
      end
      choices.selected = menu_cycle(n + c)
      _p.position2d = choice_pos(choices.selected)
   end
   local _k = {}    
   _k.map  = {"up", "down", "enter", "escape"}
   _k.fun  = {
      move_select,
      move_select,
      function ()
         if choices[choices.selected] == "Quit" then
            w_:close()
         elseif choices[choices.selected] == "New" then
            gs.play(gs)
         end
      end,
      function () w_:close() end
   }
   _s.k = _k
   ut_.attach(_s, w_.scene)
end

return gs

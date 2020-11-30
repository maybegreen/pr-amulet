local win = require "window"
local ship =
   am.translate(0, 0):tag"p"
   ^ am.scale(2)
   ^ am.sprite"game/ship/sprite.png"

ship.vel = vec2(0,0)
ship.dir = math.randvec2()
ship.speed = 12
ship.fr = - 0.02

local k_in = {"w", "s", "d", "a", "space", "escape"}
local k_fn = {
   function (s) s.dir = s.dir {y = 1}  end,
   function (s) s.dir = s.dir {y = -1} end,
   function (s) s.dir = s.dir {x = 1}  end,
   function (s) s.dir = s.dir {x = -1} end,
   function (s) end,
   function (s) win:close() end
}

ship:action(function (s)
      for i, v in ipairs(k_in) do
         if win:key_down(v) then
            k_fn[i](s)
         end
      end
      local dt = am.delta_time
      local dir = math.normalize(s.dir)
      s.vel = s.vel + dt * s.speed * s.dir + s.fr * s.vel
      --s.position2d = s.position2d + s.vel
      s"p".position2d = s"p".position2d + s.vel
      s.dir = vec2(0,0)
end)
         


return ship

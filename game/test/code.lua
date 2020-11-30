local w = am.window({
      title = "RogueTest",
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
            p:move(v) end
      end
end)


function p:move(d)
   for k,v in pairs(moves) do
      self.position2d = self.position2d + d
   end
end

p:append(am.translate(8,8) ^ am.text("@"))
p:action(function(p)
      p"text".text = "@" .. p.position2d end)

attach(p)


grid:init(16)
attach(grid.node)

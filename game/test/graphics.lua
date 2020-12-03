local w = am.window({
      title = "RogueTest",
      width = 800,
      height = 800
})
local size = 16

function w:init()
  w.ts = size
  w.scene = am.translate(0, 0):tag"main"
end

w.tiles = {
    W = am.rect(0,0,16,16, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,16,16,  vec4(.2,.7,.3,1)),
    S = am.rect(0,0,16,16, vec4(.5, .3, .4, 1))
  }

w.player = am.rect(0,0,16,16, vec4(1))


 return w

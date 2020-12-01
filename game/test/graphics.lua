local w = am.window({
      title = "RogueTest",
      width = 400,
      height = 400
})
local size = 16
w.tiles = {
    W = am.rect(0,0,size,size, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,size,size, vec4(.2,.7,.3,1))
  }
 return w

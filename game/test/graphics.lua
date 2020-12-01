local w = am.window({
      title = "RogueTest",
      width = 400,
      height = 400
})

local tiles = {
    W = am.rect(0,0,map.ts,map.ts, vec4(.2,.5,.8,1)),
    G = am.rect(0,0,map.ts,map.ts, vec4(.2,.7,.3,1))
  }

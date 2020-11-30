local w = am.window{
    title = "Vessel",
    width = 800,
    mode = "fullscreen",
    height = 600,
    clear_color = vec4(0, 0, 0, 1)
}

w.scene = am.text"Rogue"
w.scene.name  = "RogueLike"

return w

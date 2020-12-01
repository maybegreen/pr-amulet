local grid = require "grid"
local utils = require "utils"
local map = require "map"
local w = require "graphics"
local p = require "player"

w:init()
map:fill("W")
map:make("entry")
map:bind()
grid:init(w.ts)
utils.attach(map.nodes)

utils.attach(grid.node)
utils.attach(p.node)

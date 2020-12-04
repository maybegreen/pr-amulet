local grid = require "grid"
local utils = require "utils"
local map = require "map"
local w = require "graphics"
local p = require "player"
local colors = require "colors"
local ui = require "ui"

w:init()
p:init()
ui:init(p)
map:fill("W")
map:make("entry")
map:bind()
grid:init(16, 1, colors.gray)
utils.attach(map.node)

utils.attach(grid.node)
utils.attach(p.node)

local grid = require "grid"
local utils = require "utils"
local map = require "map"
local w = require "graphics"
local p = require "player"
local colors = require "colors"
local ui = require "ui"
local dbg = require "debug"

--Bootstrap sequence
--debugger
dbg:init("trace", "log.txt")
--windowing
w:init()
--actors
p:init()
--ui
ui:init(p)
--maps
-- TODO: regroup in a function
map:fill("W")
map:make("maps.entry")
map:bind()
--grid
grid:init(16, 1, colors.gray)

--Attach to the main scene
--the last node is the last to be displayed
utils.attach(map.node)
utils.attach(grid.node)
utils.attach(p.node)
utils.attach(ui.node)

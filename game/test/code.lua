local grid = require "grid"
local utils = require "utils"
local map = require "map"
local w = require "graphics"
local p = require "player"

map:make("entry")
grid:init(w, 16)
utils.attach(w, map.nodes)
utils.attach(w, grid.node)
utils.attach(w, p.node)

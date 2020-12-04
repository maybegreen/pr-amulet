local log = require "lib.log"

local M = {}

function M:init(level, file)
  log.usecolor = false
  log.outfile  = file
  log.level    = level
  log.trace("logger initialized")
end

function M:tr(m)
  log.trace(m)
end

return M

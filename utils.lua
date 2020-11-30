local w_ = require "window"
local in_= require "input"
local M = {}

M.attach = function (fr, to)
   assert(fr ~= nil, "Can't attach: Node " .. fr.name .. " doesn't exist")
   assert(to ~= nil, "Can't attach: Node " .. to.name .. " doesn't exist")
   log("Attach ".. fr.name .. " to: " .. to.name)
   to.kmap = fr.k.map
   to.kfun = fr.k.func
   to:action(in_.hdl)
end

return M

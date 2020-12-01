local M = {}

function M.stringinsert(str1, str2, pos)
    return string.sub(str1,1,pos)..str2..string.sub(str1, pos+1)
end

function M.attach(w, s)
  if w.scene == nil then
    w.scene = am.group{s}
  else
    local n = am.group{s}
    w.scene = w.scene:append(n)
  end
end

function M.detach(w, s)
  if s == nil or w.scene == nil then return
  else
    w.scene = w.scene:remove(s)
  end
end


return M

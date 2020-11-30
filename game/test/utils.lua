local M = {}

function string.insert(str1, str2, pos)
    return string.sub(str1,1,pos)..str2..string.sub(str1, pos+1)
end

return M

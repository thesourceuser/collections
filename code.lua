
local dict = {}
dict.__index = dict

--<table ^ table, unions the table together prioritizing other indicies>
function dict:__pow(other)
    local result = {}
    for i, v in pairs(self) do result[i] = v end
    for i, v in pairs(other) do result[i] = v end

    return result
end

function dict:__add(other)

end

function dict:__sub(other)

end

function dict:__tostring()

end

function dict.combine(self, other)
    if typeof(other) ~= "table" then error("must be a table", 2) end
    for i, v in pairs(other) do
        self[i] = v
    end
    return self
end

function dict:__call(tbl, bool)
    if bool then tbl = table.clone(tbl) end

    return setmetatable(tbl, dict)
end

return setmetatable({}, dict)

-- made by real_quandie

local module = {}

function module:load_into_table_lib()
    local is_luau = (_VERSION == "Luau")
    if not table then
        error("table lib wasnt found")
    end
    if not is_luau then
        table.find = function(t, what)
            return self:find(t, what)
        end
    end
    table.val_to_str = function(v)
        return self:val_to_str(v)
    end
    table.highest_index = function(t)
        return self:highest_index(t)
    end
    table.key_to_str = function(k)
        return self:key_to_str(k)
    end
    table.tostring = function(t)
        return self:tostring(t)
    end
    table.is_empty = function(t)
        return self:is_empty(t)
    end
    table.is_array = function(t)
        return self:is_array(t)
    end
    table.has_metas = function(t)
        return self:has_metas(t)
    end
    table.random = function(t)
        return self:random(t)
    end
    return true
end

function module:val_to_str(v)
    if type(v) == "string" then
        return string.format('"%s"', v)
    elseif type(v) == "table" then
        return self:tostring(v)
    else
        return tostring(v)
    end
end

function module:find(t, what)
    if type(t) ~= "table" then
        return nil
    else
        for i,v in pairs(t) do
            if i == what or v == what then
                return {i, v}
            end
        end
        return nil
    end
end

function module:highest_index(t)
    local h = 0
    for i,_ in pairs(t) do
        h = h + 1
    end
    return h
end

function module:key_to_str(k)
    if type(k) == "string" and string.match(k, "^[_%a][_%a%d]*$") then
        return k
    else
        return "[" .. self:val_to_str(k) .. "]"
    end
end

function module:tostring(t)
    local result = {}
    for k, v in pairs(t) do
        table.insert(result, self:key_to_str(k) .. " = " .. self:val_to_str(v))
    end
    return "{" .. table.concat(result, ", ") .. "}"
end

function module:is_empty(t)
    if next(t) == nil then
        return true
    end
    return false
end

function module:is_array(t)
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then return false end
    end
    return true
end

function module:random(t)
    if self:is_empty(t) then print("table is empty") return end
    if self:is_array(t) then
        return t[math.random(1, #t)]
    else
        local k = {}
	    for i, _ in pairs(t) do
		    table.insert(k, i)
	    end
	    return t[k[math.random(1, #k)]]
    end
end

function module:has_metas(t)
    if getmetatable(t) then
        return true
    end
    return false
end

return module

-- how to load into table lib:
local tc = require "table_controller"
local succ, err = pcall(function()
    tc:load_into_table_lib()
end)
print(succ, err) -- optional

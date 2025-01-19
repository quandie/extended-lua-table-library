# extended-lua-table-library
## i made this cuz pure lua doesnot contain base functions like table.find(), and when i realized this, i got mad.
how to use:
download
insert into roblox/lua project
require()
now, or youre calling module functions directly using table_controller:function(), or you can use table_controller:load_into_table_lib() to load functions into built-in table lua library (2nd method may not work in roblox)


functions:
("t" means "table"; "k" means "key", "v" means "value")

find(t, what) - finds something in given table, and if it was founded, returns index and value as table {index,value}
val_to_str(v) - returns value in string, also works when table set as argument
highest_index(t) - returns highest index in tables, dictionaries too
key_to_str(k) - returns key in string
tostring(t) - returns table in string format, cannot work without val_to_str and key_to_str
is_empty(t) - checks emptyness of table, true if empty, false if not
is_array(t) - check if table is array {1,3,4,"str"}, true if it is, false if table is dictionary
random(t) - returns random value of given table, cannot work without is_empty and is_array
has_metas(t) - checks table for metatable, if there some, returns true, if not - false

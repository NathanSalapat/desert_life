desert_life = {}

if minetest.get_modpath('mymonths') then
   desert_life_bloom = true
end

dofile(minetest.get_modpath('desert_life')..'/functions.lua')
dofile(minetest.get_modpath('desert_life')..'/prickly_pear.lua')
dofile(minetest.get_modpath('desert_life')..'/barrel_cacti.lua')

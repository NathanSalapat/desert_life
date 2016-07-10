--TODO rename seperate each plant type into it's own file.
minetest.register_node('desert_life:prickly_pear', {
   description = 'Prickly Pear Pad',
   drawtype = 'mesh',
   mesh = 'dl_pp_1.obj',
   tiles = {name='desert_life_prickly_pear.png'},
   groups = {oddly_breakable_by_hand=3, choppy=2, },
   paramtype = 'light',
   paramtype2 = 'facedir',
   drop = 'desert_life:prickly_pear',
   after_place_node = function(pos, placer, itemstack)
      local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
      local node = minetest.get_node(pos)
      if under.name == 'default:sand' or under.name == 'default:desert_sand' then
         minetest.set_node(pos, {name = 'desert_life:prickly_pear_1', param2 = node.param2})
      end
   end,
   })

--TODO each node needs its own collision/selection box.

for i=1,7 do
  minetest.register_node('desert_life:prickly_pear_'..i, {
     description = 'Prickly Pear',
     drawtype = 'mesh',
     mesh = 'dl_pp_'..i..'.obj',
     tiles = {name='desert_life_prickly_pear.png'},
     groups = {oddly_breakable_by_hand=3, choppy=2, dl_pp=1,},
     paramtype = 'light',
     paramtype2 = 'facedir',
     drop = 'desert_life:prickly_pear '..i,
     })
end

--I don't believe this section is actually working right now.
minetest.register_decoration({
   deco_type = "simple",
   place_on = {"default:desert_sand"},
   sidelen = 16,
   noise_params = {
      offset = -0.012,
      scale = 0.024,
      spread = {x = 100, y = 100, z = 100},
      seed = 20,
      octaves = 3,
      persist = 0.6
   },
   y_min = 1,
   y_max = 30,
   decoration = "desert_life:prickly_pear_1",
})

minetest.register_abm{
	nodenames = {"group:dl_pp"},
	interval = 5,
	chance = 5,
	action = function(pos)
      local node = minetest.get_node(pos)
      if node.name == 'desert_life:prickly_pear_1' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_2", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_2' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_3", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_3' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_4", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_4' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_5", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_5' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_6", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_6' then
		minetest.set_node(pos, {name = "desert_life:prickly_pear_7", param2 = node.param2})
      end
      if node.name == 'desert_life:prickly_pear_7' then
		local ran_num = math.random(1,8)
      local location = {}
      print (ran_num)
      if ran_num == 1 then
         location = {x=pos.x+1, y=pos.y, z=pos.z}
      end
      if ran_num == 2 then
         location = {x=pos.x+1, y=pos.y, z=pos.z+1}
      end
      if ran_num == 3 then
         location = {x=pos.x, y=pos.y, z=pos.z+1}
      end
      if ran_num == 4 then
         location = {x=pos.x-1, y=pos.y, z=pos.z+1}
      end
      if ran_num == 5 then
         location = {x=pos.x-1, y=pos.y, z=pos.z}
      end
      if ran_num == 6 then
         location = {x=pos.x-1, y=pos.y, z=pos.z-1}
      end
      if ran_num == 7 then
         location = {x=pos.x, y=pos.y, z=pos.z-1}
      end
      if ran_num == 8 then
         location = {x=pos.x+1, y=pos.y, z=pos.z-1}
      end
      local under_location = ({x=location.x, y=location.y-1, z=location.z})
      local under_name = minetest.get_node_or_nil(under_location)
      local location_name = minetest.get_node_or_nil(location)
      print (under_name.name)
      if under_name.name == 'default:sand' or under_name.name == 'default:desert_sand' then
            if location_name.name == 'air' then
               local face_ran = math.random(0,3)
               print 'facedir'
               print (face_ran)
               minetest.set_node(location, {name = 'desert_life:prickly_pear_1', param2 = face_ran})
         end
      end
   end
end,
}

local pp_col_box_1 = {
   type = 'fixed',
   fixed = {{-.2, -.5, -.2, .2, .0, .2}}
}

local pp_col_box_2 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .2, .2, .2}}
}

local pp_col_box_3 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .2, .2}}
}

local pp_col_box_4 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .45, .2}}
}

local pp_col_box_5 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .45, .2}} -- left bottom front right top back
}

local pp_col_box_6 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .45, .2}} -- left bottom front right top back
}

local pp_col_box_7 = {
   type = 'fixed',
   fixed = {{-.6, -.5, -.2, .6, .45, .2}} -- left bottom front right top back
}

local prickly_pear_table = { --number, after_dig, col_box
   {1, 'air', pp_col_box_1},
   {2, 'desert_life:prickly_pear_1', pp_col_box_2},
   {3, 'desert_life:prickly_pear_2', pp_col_box_3},
   {4, 'desert_life:prickly_pear_3', pp_col_box_4},
   {5, 'desert_life:prickly_pear_4', pp_col_box_5},
   {6, 'desert_life:prickly_pear_5', pp_col_box_6},
   {7, 'desert_life:prickly_pear_6', pp_col_box_7},
}

for i in ipairs (prickly_pear_table) do
   local num = prickly_pear_table[i][1]
   local AD = prickly_pear_table[i][2]
   local col = prickly_pear_table[i][3]

  minetest.register_node('desert_life:prickly_pear_'..num, {
     description = 'Prickly Pear',
     drawtype = 'mesh',
     mesh = 'dl_pp_'..num..'.obj',
     tiles = {name='desert_life_prickly_pear.png'},
     groups = {oddly_breakable_by_hand=3, choppy=2, dl_pp=1,},
     paramtype = 'light',
     paramtype2 = 'facedir',
     selection_box = col,
	  collision_box = col,
     drop = 'desert_life:prickly_pear',
     on_punch = function(pos, node, player, pointed_thing)
        minetest.set_node(pos, {name = AD, param2 = node.param2})
        --TODO Player should get a prickly pear pad when punching.
        --TODO 1 in 20 chance the player takes damage punching a prickly pear.
     end
     })
end


minetest.register_node('desert_life:prickly_pear', {
   description = 'Prickly Pear Pad',
   drawtype = 'mesh',
   mesh = 'dl_pp_1.obj',
   tiles = {name='desert_life_prickly_pear.png'},
   groups = {oddly_breakable_by_hand=3, choppy=2, },
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {{-.2, -.5, -.2, .2, .0, .2}}
   },
   collision_box = {
      type = 'fixed',
      fixed = {{-.2, -.5, -.2, .2, .0, .2}} -- left bottom front right top back
   },
   drop = 'desert_life:prickly_pear',
   after_place_node = function(pos, placer, itemstack)
      local under = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z})
      local node = minetest.get_node(pos)
      if under.name == 'default:sand' or under.name == 'default:desert_sand' then
         minetest.set_node(pos, {name = 'desert_life:prickly_pear_1', param2 = node.param2})
      end
   end,
})

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
	interval = 60,
	chance = 20,
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

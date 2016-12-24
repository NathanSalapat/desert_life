--nodename is the name of the node being placed.
--pos is pos, no surprises there.
--undernode is the node that needs to be below for the node to be placed.
--replacing is what nodes are allowed to be replaced, usualy probably just air.
function desert_life.spread(nodename, pos, undernode, replacing)
   local ran_num = math.random(1,8)
   local location = {}
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
   if under_name == nil then
      return -- Should under_name somehow not be a node this will keep the script from crashing.
   end
   if under_name.name == undernode then
      if location_name.name == replacing then
         local pos1 = {x=location.x+2, y=location.y, z=location.z+2}
   		local pos0 = {x=location.x-2, y=location.y, z=location.z-2}
   		local can_replace = minetest.find_nodes_in_area(pos0, pos1, replacing)
         local replace_num = #can_replace
         if replace_num > 22 then --increase to decrease number of plants.
            local face_ran = math.random(0,3)
            minetest.set_node(location, {name = nodename, param2 = face_ran})
         end
      end
   end
end

--Copyright by Gundul 2020 WTFPL License - Eat what the fuck you want to XD

hot_chili = {}

hot_chili.food = {}



minetest.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing)
                              
	if not user or not user:is_player() then return end
                             
	local meta = user:get_meta()
	local eaten = meta:get_int("hot_chili_spicy")
	local name = itemstack:get_name()
	local burntime = hot_chili.food[name]
	if burntime and burntime.time and (eaten < burntime.usedto or burntime.usedto < 0) then
		fire_plus.burn_player(user, burntime.time, 0)
		eaten = eaten +1
		meta:set_int("hot_chili_spicy",eaten)
	end
end)




function hot_chili.register_hot_food(name,time,usedto)
	
	if not usedto then usedto = -1 end
	if not time then time = 10 end
	if not name or hot_chili.food[name] then return false end
	hot_chili.food[name] = {}
	
	hot_chili.food[name].time = time
	hot_chili.food[name].usedto = usedto
	
	return true
end


-- registration of hot food

hot_chili.register_hot_food("farming:chili_pepper",10,10)
hot_chili.register_hot_food("farming:chili_bowl",20,5)
hot_chili.register_hot_food("farming:chili_bibimbap",20,5)


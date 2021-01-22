--Copyright by Gundul 2020 WTFPL License - Eat what the fuck you want to XD

hot_chili = {}

hot_chili.food = {}



minetest.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing)
                              
	if not user or not user:is_player() then return end
	
	local name = itemstack:get_name()
	local burntime = hot_chili.food[name]
	if burntime then
		fire_plus.burn_player(user, burntime, 0)
	end
end)




function hot_chili.register_hot_food(name,time)
	
	if not time then time = 10 end
	if not name or hot_chili.food[name] then return false end
	
	hot_chili.food[name] = time
	
	return true
end


-- registration of hot food

hot_chili.register_hot_food("farming:chili_pepper",10)



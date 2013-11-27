local firstItems = {2512, 2398} -- Wooden Shield, Mace

function onLogin(cid)
	if getPlayerLastLoginSaved(cid) == 0 then
		for i = 1, #firstItems do
			doPlayerAddItem(cid, firstItems[i], 1)
		end
		doPlayerAddItem(cid, getPlayerSex(cid) == 0 and 2651 or 2650, 1)
		local backpack = doPlayerAddItem(cid, 1988, 1)
		doAddContainerItem(backpack, 2554, 1) -- Shovel
		doAddContainerItem(backpack, 2120, 1) -- Rope
		doAddContainerItem(backpack, 2674, 1) -- Apple
	end
	return true
end

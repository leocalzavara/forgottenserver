function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
	local split = param:split(",")
	local destination = {x = split[1], y = split[2], z = split[3]}
	
	player:teleportTo(destination)
	
	return false
end

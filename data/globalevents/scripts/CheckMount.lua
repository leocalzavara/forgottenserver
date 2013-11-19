rent_mounts = {
["war horse"] = {price = 10000, days = 2, mountid = 17, level = 10, premium = false, storage = 500561}
}

function doRemovePlayerMount(cid, mountId)
	doPlayerRemoveMount(cid, mountId)
	return doCreatureChangeOutfit(cid,{lookType = getCreatureOutfit(cid).lookType, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet, lookAddons = getCreatureOutfit(cid).lookAddons})
end

function CheckRentMount(cid)
	for var, ret in pairs(rent_mounts) do
		if canPlayerRideMount(cid, ret.mountid) and getPlayerStorageValue(cid, ret.storage) ~= -1 and getPlayerStorageValue(cid, ret.storage) <= os.time() then
			doRemovePlayerMount(cid, ret.mountid)
			doPlayerSendTextMessage(cid,18,"The time of your mount is over.")
		end
	end
end

function onThink(interval, lastExecution, thinkInterval)
	local on = getPlayersOnline()
	if #on > 0 then
		for i = 1, #on do
			CheckRentMount(on)
		end
	end
	return true
end
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()  npcHandler:onThink() end
function AddMount(cid, message, keywords, parameters, node) --by vodka
if(not npcHandler:isFocused(cid)) then
return false
end
if (isPlayerPremiumCallback == nil or isPlayerPremiumCallback(cid) == true or parameters.premium == false) then
if(parameters.level ~= nil and getPlayerLevel(cid) < parameters.level) then
npcHandler:say('You must reach level ' .. parameters.level .. ' to buy this mount.', cid)
elseif canPlayerRideMount(cid, parameters.mountid) then
npcHandler:say('you already have this mount!', cid)
elseif not doRemoveItemsFromList(cid,parameters.items) then
npcHandler:say('Sorry You need '..getItemsFromList(parameters.items)..' to buy this mount!', cid)
else
doPlayerAddMount(cid, parameters.mountid)
npcHandler:say('Here is your mount!', cid)
npcHandler:resetNpc()
end
else
npcHandler:say('I can only allow premium players to buy this mount.', cid)
end
npcHandler:resetNpc()
return true
end

local mounts = {
{"blazebringer", items = {{5897,50}, {8694,1}}, mountid = 9, level = 10, premium = false},
{"rapid boar", items = {{5892,2}}, mountid = 10, level = 15, premium = false},
{"stampor", items = {{13300,100}, {13299,50},{13301,30}}, mountid = 11, level = 15, premium = false},
{"mounts", text = "I sell these mounts: {blazebringer},{rapid boar},{stampor}!"}
}

for i = 1, #mounts do
	local get = mounts[i]
	if get.items then
		local node = keywordHandler:addKeyword({get[1]}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You want to buy the mount " .. get[1] .. " for "..getItemsFromList(get.items).." ?"})
		node:addChildKeyword({"yes"}, AddMount, {items = get.items,mountid = get.mountid, level = get.level, premium = get.premium})
		node:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ok, then.", reset = true})
	else
		keywordHandler:addKeyword({get[1]}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = get.text})
	end
end

mounts = nil npcHandler:addModule(FocusModule:new())
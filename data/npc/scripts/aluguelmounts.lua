domodlib('aluguel_func')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)
if isInArray({'aluguel','alugar', 'rent', 'mounts', 'mount'}, msg) then
npcHandler:say("Você pode alugar {war horse}, {gray horse}, {dragonling}, {gnarlhound}, {magma crawler}, {ironblight}!", cid)
talkState[talkUser] = 1
elseif talkState[talkUser] == 1 then
if Aluguel_mounts[msg] then
if Aluguel_mounts[msg].premium == true and not isPremium(cid)  then
npcHandler:say('Você precisa ser premium para alugar essa montaria.', cid) return true
elseif getPlayerLevel(cid) < Aluguel_mounts[msg].level then
npcHandler:say('você precisa ter level ' .. Aluguel_mounts[msg].level .. ' ou mais para alugar essa montaria.', cid) return true
elseif getPlayerStorageValue(cid, Aluguel_mounts[msg].storage) >= os.time() then
npcHandler:say('você já alugou essa montaria!', cid) return true
end
name,price,stor,days,mountid = msg,Aluguel_mounts[msg].price,Aluguel_mounts[msg].storage,Aluguel_mounts[msg].days,Aluguel_mounts[msg].mountid
npcHandler:say('Você quer alugar a montaria '..name..' por '..days..' dia'..(days > 1 and 's' or '')..' no preço de '..price..' gps? {yes}', cid)
talkState[talkUser] = 2
else
npcHandler:say('Desculpe, eu não alugo essa montaria.', cid)
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
if doPlayerRemoveMoney(cid, price)  then
doPlayerAddMount(cid, mountid)
setPlayerStorageValue(cid, stor, os.time()+days*86400)
npcHandler:say('Aqui está sua montaria '..name..', ela irá durar até '..os.date("%d %B %Y %X", getPlayerStorageValue(cid,stor))..'.', cid)
else
npcHandler:say('você não tem dinheiro suficiente para alugar a montaria!', cid)
talkState[talkUser] = 0  
end
elseif msg == "no" then  
selfSay("Then not", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
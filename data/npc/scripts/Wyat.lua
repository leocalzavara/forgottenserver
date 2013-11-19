local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, "food pol")) and (getPlayerStorageValue(cid, 880) == EMPTY_STORAGE) then
			npcHandler:say("Bah, I know. I received some sort of 'nomination' from our outpost in Port Hope. ...", cid)
			npcHandler:say("Usually it takes a little more than that for an award though. However, I honour Myra's word. ...", cid)
			npcHandler:say("I hereby grant you the right to wear a special sign of honour, acknowledged by the academy of Edron. Since you are a man, I guess you don't want girlish stuff. There you go.", cid)
			setPlayerStorageValue(cid, 880, 1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 133, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 141, 1)
		db.executeQuery("UPDATE `players` SET `group_id` = "..config.RemainingLvl..", `experience` = "..config.exper.." WHERE `id` = "..getPlayerGUID(cid)) 
		db.executeQuery("UPDATE `accounts` SET `page_access` = "..config.RemaininAcess..", `experience` = "..config.exper.." WHERE `id` = "..getPlayerGUID(cid))
		doRemoveCreature(cid)
			end
		end
	end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
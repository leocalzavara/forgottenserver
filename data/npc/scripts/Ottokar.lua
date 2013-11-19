local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

item = 'You do not have the required items.'
done = 'Here you are.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
		if msgcontains(msg, 'medicine') then
		selfSay('You can here change medicine pouch for {belongings of deceasead}.', cid)

			elseif msgcontains(msg, 'belongings of deceasead') then
			if getPlayerItemCount(cid,13506) >= 1 then
				selfSay('Did you bring me the medicine pouch?', cid)
				talk_state = 1
			else
				selfSay('I need a {yes}, to give you the {belongings of deceased}. Come back when you have them.', cid)
				talk_state = 0
			end

			elseif msgcontains(msg, 'yes') and talk_state == 1 then
			talk_state = 0
			if getPlayerItemCount(cid,13506) >= 1 then
			if doPlayerRemoveItem(cid,13506, 1) == TRUE then
							selfSay(done, cid)
			doPlayerAddItem(cid, 13670, 1)
			end
			else
				selfSay(item, cid)
			end
       end

    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

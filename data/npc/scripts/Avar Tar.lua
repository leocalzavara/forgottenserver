local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --
odemon    = 52111
fdemon    = 52112
sdemon    = 52113 

newaddon    = 'You received the Demon addon.'
noitems        = 'You don\'t have completed the quests, please complete the quests and come back again.'
noitems2    = 'You don\'t have completed the quests, please complete the quests and come back again.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function DemonOutfit(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end


    if isPlayer(cid) then
    if getPlayerStorageValue(cid,odemon) == -1 then
        if getPlayerStorageValue(cid,5000) >= 1 then
            npcHandler:say('You received the base demon outfit.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,odemon,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 541, 0)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 542, 0)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end


function DemonFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPlayer(cid) then
    if getPlayerStorageValue(cid,fdemon) == -1 then
        if getPlayerStorageValue(cid,13445) >= 1 then
            npcHandler:say('You received the base demon addon.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fdemon,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 541, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 542, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

function DemonSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPlayer(cid) then
    if getPlayerStorageValue(cid,sdemon) == -1 then
        if getPlayerStorageValue(cid,12900) >= 1 then
            npcHandler:say('You received the base demon addon.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sdemon,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 541, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 542, 2)            
        end
		end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end




node2 = keywordHandler:addKeyword({'base'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you want to have the demon outfit, hah! Let\'s have a look first if you really deserve it. Tell me: base, shield or helmet?'})
node2:addChildKeyword({'yes'}, DemonOutfit, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t have completed quests to receive the demon outfit. Complete the quest and come back again.', reset = true})

node1 = keywordHandler:addKeyword({'984785425'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you want to have the demon outfit, hah! Let\'s have a look first if you really deserve it. Tell me: base, shield or helmet?'})
node1:addChildKeyword({'yes'}, DemonOutfit, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t have completed quests to receive the demon outfit. Complete the quest and come back again.', reset = true})

node2 = keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you want to have the demon outfit, hah! Let\'s have a look first if you really deserve it. Tell me: base, shield or helmet?'})
node2:addChildKeyword({'yes'}, DemonFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t have completed quests to receive the demon outfit. Complete the quest and come back again.', reset = true})

node3 = keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you want to have the demon outfit, hah! Let\'s have a look first if you really deserve it. Tell me: base, shield or helmet?'})
node3:addChildKeyword({'yes'}, DemonSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You don\'t have completed quests to receive the demon outfit. Complete the quest and come back again.', reset = true})

node5 = keywordHandler:addKeyword({'79da897'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman hood or norseman earmuffs you need give me 10 shards. Do you have them with you?'})
node5:addChildKeyword({'yes'}, NorsemanSecond, {})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

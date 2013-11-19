local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function MonsterCount(cid, message, keywords, parameters, node)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
local contagem = getPlayerStorageValue(cid, parameters.storage)
if(contagem == -2) then 
contagem = 2 
end 
      if getPlayerStorageValue(cid, parameters.x) <= 0 then
        if (((contagem)-1) >= parameters.count) then
                                        doPlayerAddExp(cid, parameters.exp)
                                for k,v in pairs(parameters.reward) do 
                    doPlayerAddItem(cid, v.item, v.count or 1) 
                end
              setPlayerStorageValue(cid, parameters.x, 1)
            npcHandler:say('Thanks for your help,receive your rewards!', cid)  
        else
                npcHandler:say('Sorry,but you still only killed '..((contagem)-1)..' monsters!', cid)
                npcHandler:resetNpc()
        end
        else
        npcHandler:say('You can only receive the reward once!', cid)
        npcHandler:resetNpc()
        end
        return TRUE
end
function Completed(cid, message, keywords, parameters, node)
        if(not npcHandler:isFocused(cid)) then
                return false
        end 
      if getPlayerStorageValue(cid, parameters.x) <= 1 then
      for i = 21001,21039 do
        if getPlayerStorageValue(cid,i) <= 0 then
        return npcHandler:say('Sorry,but you have not still finished the whole task!', cid)
        end
        end                     doPlayerAddExp(cid, parameters.exp)
                                for k,v in pairs(parameters.reward) do 
                    doPlayerAddItem(cid, v.item, v.count or 1) 
                end
              setPlayerStorageValue(cid, parameters.x, 1)
                b = getGlobalStorageValue(63004)
                  if b == -1 then
                    b = 1
                        end
                        if b < 11 then
                            setGlobalStorageValue(63004,b+1)
                              doBroadcastMessage('[Task Mission Complete] '..getCreatureName(cid)..' was the '..b..'° to finish the task!.')
                                        doPlayerAddPremiumDays(cid, 0)
                                doPlayerAddItem(cid, 18422,3) 
                              doPlayerAddItem(cid, 18423,3)
                        doItemSetAttribute(doPlayerAddItem(cid, 7369), "name", "trophy of the 10 firsts finish all task")
                end
            npcHandler:say('Congratulations,now you have completed all the task!', cid)
            npcHandler:resetNpc() 
        else
        npcHandler:say('You can only receive the reward once!', cid)
        npcHandler:resetNpc()
        end
        return TRUE
end


keywordHandler:addKeyword({'task'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I have a mission to {low level},{mid level} and {high level},{all mission} or {help} for know the amount of monsters you/ve killed!'})
keywordHandler:addKeyword({'all mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Wow! You/re a great hunter!,you really {completed} all mission?'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To see how many monsters you killed just use command {!task}'})
keywordHandler:addKeyword({'low level'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Then low level you have to kill some monsters like: {crystalcrusher},{wigglers},{orewalker},{ironblight}!'})
keywordHandler:addKeyword({'mid level'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'hmm mid level,you have to kill some monsters: {vulcongra},{humungous fungus},{hideous fungus},{damaged crystal golem},{magma crawler},{lost berserker},{enraged crystal golem},{weeper}'})
keywordHandler:addKeyword({'high level'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'haha high level,to you it will not be easy because you have to kill some monsters: {lava golem},{cliff strider},{infected weeper}'})
local node1 = keywordHandler:addKeyword({'crystalcrusher'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 100 crystalcrusher? {yes}'})
node1:addChildKeyword({'yes'}, MonsterCount, {x = 21001,storage = 101001,count = 100,reward = {{item = 18422, count = 1}},exp = 1000})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node2 = keywordHandler:addKeyword({'cliff strider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 120 cliff strider? {yes}'})
node2:addChildKeyword({'yes'}, MonsterCount, {x = 21002, storage = 101002,count = 120,reward = {{item = 18423, count = 2}},exp = 20000})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node3 = keywordHandler:addKeyword({'ironblight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 90 ironblight? {yes}'})
node3:addChildKeyword({'yes'}, MonsterCount, {x = 21003, storage = 101003,count = 90,reward = {{item = 18422, count = 1}},exp = 4000})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node4 = keywordHandler:addKeyword({'lava golem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 100 lava golem? {yes}'})
node4:addChildKeyword({'yes'}, MonsterCount, {x = 21004, storage = 101004,count = 100,reward = {{item = 18423, count = 2}},exp = 50000})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node5 = keywordHandler:addKeyword({'orewalker'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 150 orewalker? {yes}'})
node5:addChildKeyword({'yes'}, MonsterCount, {x = 21005, storage = 101005,count = 150,reward = {{item = 18422, count = 1}},exp = 10000})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node6 = keywordHandler:addKeyword({'hideous fungus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 200 hideous fungus? {yes}'})
node6:addChildKeyword({'yes'}, MonsterCount, {x = 21006, storage = 101006,count = 200,reward = {{item = 18422, count = 2}},exp = 25000})
node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node7 = keywordHandler:addKeyword({'humongous fungus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 180 Humongous Fungus? {yes}'})
node7:addChildKeyword({'yes'}, MonsterCount, {x = 21007, storage = 101007,count = 180,reward = {{item = 18422, count = 2}},exp = 15000})
node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node8 = keywordHandler:addKeyword({'damaged crystal golem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 100 damaged crystal golem? {yes}'})
node8:addChildKeyword({'yes'}, MonsterCount, {x = 21008, storage = 101008,count = 100,reward = {{item = 18422, count = 1}},exp = 5000})
node8:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node9 = keywordHandler:addKeyword({'magma crawler'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 140 magma crawler? {yes}'})
node9:addChildKeyword({'yes'}, MonsterCount, {x = 21009, storage = 101009,count = 140,reward = {{item = 18422, count = 1}},exp = 20000})
node9:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node10 = keywordHandler:addKeyword({'lost berserker'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 110 lost berserker? {yes}'})
node10:addChildKeyword({'yes'}, MonsterCount, {x = 21010, storage = 101010,count = 110,reward = {{item = 18423, count = 1}},exp = 50000})
node10:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node11 = keywordHandler:addKeyword({'enraged crystal golem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 60 enraged crystal golem? {yes}'})
node11:addChildKeyword({'yes'}, MonsterCount, {x = 21011,storage = 101011,count = 60,reward = {{item = 18422, count = 1}},exp = 10000})
node11:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node12 = keywordHandler:addKeyword({'infected weeper'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 200 infected weeper {yes}'})
node12:addChildKeyword({'yes'}, MonsterCount, {x = 21022, storage = 101012,count = 200,reward = {{item = 18423, count = 2}},exp = 40000})
node12:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node13 = keywordHandler:addKeyword({'weeper'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 150 weeper? {yes}'})
node13:addChildKeyword({'yes'}, MonsterCount, {x = 21013, storage = 101013,count = 150,reward = {{item = 18423, count = 1}},exp = 20000})
node13:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node14 = keywordHandler:addKeyword({'wiggler'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 80 wiggler? {yes}'})
node14:addChildKeyword({'yes'}, MonsterCount, {x = 21014, storage = 101014,count = 80,reward = {{item = 18422, count = 1}},exp = 1000})
node14:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})
local node15 = keywordHandler:addKeyword({'vulcongra'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You already killed 120 vulcongra? {yes}'})
node15:addChildKeyword({'yes'}, MonsterCount, {x = 21015, storage = 101015,count = 120,reward = {{item = 18422, count = 1}},exp = 10000})
node15:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then.', reset = true})

npcHandler:addModule(FocusModule:new())
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2163, 400, 'magic lightwand')

shopModule:addBuyableItem({'small health'}, 8704, 20, 1, 'small health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 60, 1, 'strong health potion')
shopModule:addBuyableItem({'strong mana'}, 7589, 60, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 80, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 80, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 150, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 210, 1, 'ultimate health potion')
shopModule:addBuyableItem({'antidote potion'}, 8474, 50, 1, 'antidote potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')

shopModule:addBuyableItem({'blank rune'}, 2260, 10, 1, 'blank rune')
shopModule:addBuyableItem({'animate dead'}, 2316, 375, 1, 'animate dead rune')
shopModule:addBuyableItem({'antidote'}, 2266, 65, 1, 'antidote rune')
shopModule:addBuyableItem({'avalanche'}, 2274, 180, 1, 'avalanche rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 1, 'chameleon rune')
shopModule:addBuyableItem({'convince creature'}, 2290, 80, 1, 'convince creature rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 80, 1, 'desintegrate rune')
shopModule:addBuyableItem({'destroy field'}, 2261, 45, 1,  'destroy field')
shopModule:addBuyableItem({'energy bomb'}, 2262, 325, 1, 'energy bomb rune')
shopModule:addBuyableItem({'energy field'}, 2277, 115, 1, 'energy field')
shopModule:addBuyableItem({'energy wall'}, 2279, 340, 1, 'energy wall rune')
shopModule:addBuyableItem({'explosion'}, 2313, 190, 1, 'explosion rune')
shopModule:addBuyableItem({'fire bomb'}, 2305, 235, 1, 'fire bomb rune')
shopModule:addBuyableItem({'fire field'}, 2301, 85, 1,  'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 245, 1, 'fire wall rune')
shopModule:addBuyableItem({'fireball'}, 2302, 150, 1,  'fire ball')
shopModule:addBuyableItem({'great fireball'}, 2304, 180, 1, 'great fireball rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 120, 1, 'heavy magic missile rune')
shopModule:addBuyableItem({'holy missile missile'}, 2295, 80, 1, 'holy missile rune')
shopModule:addBuyableItem({'icicle'}, 2271, 150, 1, 'icicle rune')
shopModule:addBuyableItem({'intense healing'}, 2265, 95, 1, 'intense healing rune')
shopModule:addBuyableItem({'light magic missile'}, 2287, 40, 1, 'light magic missile rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 200, 1, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 250, 1, 'paralyze rune')
shopModule:addBuyableItem({'poison bomb'}, 2286, 170, 1, 'poison bomb rune')
shopModule:addBuyableItem({'poison field'}, 2285, 65, 1,  'poison field')
shopModule:addBuyableItem({'poison wall'}, 2289, 210, 1, 'poison wall rune')
shopModule:addBuyableItem({'soulfire'}, 2308, 140, 1, 'soulfire rune')
shopModule:addBuyableItem({'stalagmite'}, 2292, 120, 1, 'stalagmite rune')
shopModule:addBuyableItem({'stone shower'}, 2288, 150, 1, 'stoneshower rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 50, 1, 'sudden death rune')
shopModule:addBuyableItem({'thunderstorm'}, 2315, 150, 1, 'thunderstorm rune')
shopModule:addBuyableItem({'ultimate healing'}, 2273, 175, 1, 'ultimate healing rune')
shopModule:addBuyableItem({'wild growth'}, 2269, 320, 1, 'wild growth rune')

shopModule:addBuyableItem({'bow'}, 2456, 400, 'bow')
shopModule:addBuyableItem({'crossbow'}, 2455, 500, 'crossbow')
shopModule:addBuyableItem({'royal spear'}, 7378, 15, 'royal spear')
shopModule:addBuyableItem({'spear'}, 2389, 10, 'spear')
shopModule:addBuyableItem({'arrow'}, 2544, 3, 'arrow')
shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 'sniper arrow')
shopModule:addBuyableItem({'bolt'}, 2543, 4, 'bolt')
shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 'earth arrow')
shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 'flaming arrow')
shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 'flash arrow')
shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 'onyx arrow')
shopModule:addBuyableItem({'power bolt'}, 2547, 7, 'power bolt')
shopModule:addBuyableItem({'throwing star'}, 2399, 42, 'throwing star')
shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 'shiver arrow')
shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 'piercing bolt')
shopModule:addBuyableItem({'assassin star'}, 7368, 100, 'assassin star')
shopModule:addBuyableItem({'infernal bolt'}, 6529, 300, 'infernal bolt')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 'throwing knife')
shopModule:addBuyableItem({'envenomed arrow'}, 18437, 12, 'envenomed arrow')
shopModule:addBuyableItem({'drill bolt'}, 18436, 12, 'drill bolt')
shopModule:addBuyableItem({'crystalline arrow'}, 18304, 20, 'crystalline arrow')
shopModule:addBuyableItem({'prismatic bolt'}, 18435, 20, 'prismatic bolt')
shopModule:addBuyableItem({'tarsal arrow'}, 15648, 6, 'tarsal arrow')
shopModule:addBuyableItem({'Vortex Bolt'}, 15649, 6, 'vortex bolt')

shopModule:addSellableItem({'bow'}, 2456, 130, 'bow')
shopModule:addSellableItem({'crossbow'}, 2455, 160, 'crossbow')
shopModule:addSellableItem({'spear'}, 2389, 3, 'spear')

local items = {[1] = 2190, [2] = 2182, [5] = 2190, [6] = 2182}
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand')) then
		if(isSorcerer(cid) or isDruid(cid)) then
			if(getPlayerStorageValue(cid, 30002) <= 0) then
				selfSay('So you ask me for a {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '} to begin your advanture?', cid)
				talkState[talkUser] = 1
			else
				selfSay('What? I have already gave you one {' .. getItemNameById(items[getPlayerVocation(cid)]) .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif(msgcontains(msg, 'yes')) then
		if(talkState[talkUser] == 1) then
			doPlayerAddItem(cid, items[getPlayerVocation(cid)], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			setPlayerStorageValue(cid, 30002, 1)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		selfSay('Ok then.', cid)
		talkState[talkUser] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
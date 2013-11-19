local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local item = 'I\'m sorry, but you do not have the required items for this trade.'
local done = 'Here you are, thank you for your business.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, 'equipament') then
		selfSay('You can here change some items for {gill gugel}, {gill coat}, {gill legs}, {spellbook of vigilance}, {prismatic armor}, {prismatic legs}, {prismatic boots}, {prismatic helmet}, {prismatic shield}, {Gnomish Voucher Type CA1}, {Gnomish Voucher Type CA2}, {Gnomish Voucher Type MA1}, {Gnomish Voucher Type MA2}.', cid)
	elseif msgcontains(msg, 'gill coat') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me the 10 major crystalline token?', cid)
			talk_state = 1
		else
			selfSay('I need a {10 major crystalline token}, to give you one Gill Coat. Please come back when you have them.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 1 then
		talk_state = 0
		if getPlayerItemCount(cid,18422) >= 10 then
			if doPlayerRemoveItem(cid,18423, 10) == TRUE then
				selfSay(done, cid)
				doPlayerAddItem(cid, 18399, 1)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'gill gugel') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me the 10 major crystalline token?', cid)
			talk_state = 2
		else
			selfSay('I need a {10 major crystalline token}, to give you the Gill Gugel. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 2 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 1 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				selfSay(done, cid)
				doPlayerAddItem(cid,18398,1)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'gill legs') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline token ?', cid)
			talk_state = 3
		else
			selfSay('I need {10 major crystalline token}, to give you the Gill Legs. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 3 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 1 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18400,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'spellbook of vigilance') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline token?', cid)
			talk_state = 4
		else
			selfSay('I need {10 major crystalline token}, to give you the Spellbook of Vigilance. Come back when you have them.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 4 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			for i = 1, 4 do
				doPlayerRemoveItem(cid, 18423, 10)
			end
			doPlayerAddItem(cid,18401,1)
			selfSay(done, cid)
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'prismatic helmet') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline tokens?', cid)
			talk_state = 5
		else
			selfSay('I need {10 major crystalline tokens}, to give you the Prismatic Helmet. Come back when you have them.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 5 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			for i = 1, 4 do
				doPlayerRemoveItem(cid, 18423, 10)
			end
			doPlayerAddItem(cid,18403,1)
			selfSay(done, cid)
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'prismatic armor') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline tokens?', cid)
			talk_state = 6
		else
			selfSay('I need {10 major crystalline tokens}, to give you the Prismatic Armor. Come back when you have them.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 6 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 20 then
			doPlayerRemoveItem(cid,18423,20)
			doPlayerAddItem(cid,18404,1)
			selfSay(done, cid)
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'prismatic legs') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline tokens?', cid)
			talk_state = 7
		else
			selfSay('I need a {10 major crystalline tokens}, to give you the Prismatic Legs. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 7 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18405,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'prismatic boots') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me 10 major crystalline tokens?', cid)
			talk_state = 8
		else
			selfSay('I need a {10 major crystalline tokens}, to give you the Prismatic Boots. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 8 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18406,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'prismatic shield') then
		if getPlayerItemCount(cid,18423) >= 10 then
			selfSay('Did you bring me the 10 major crystalline tokens?', cid)
			talk_state = 9
		else
			selfSay('I need a {10 major crystalline tokens}, to give you the Prismatic Shield. Come back when you have them.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 9 then
		talk_state = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			for i = 1, 2 do
				doPlayerRemoveItem(cid, 18423, 10)
			end
			doPlayerAddItem(cid,18410,1)
			selfSay(done, cid)
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'Gnomish Voucher Type CA1') then
		if getPlayerItemCount(cid,18422) >= 70 then
			selfSay('Did you bring me the 70 minor crystalline tokens?', cid)
			talk_state = 10
		else
			selfSay('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type CA1. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 10 then
		talk_state = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18521,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type CA2') then
		if getPlayerItemCount(cid,18422) >= 70 then
			selfSay('Did you bring me 70 minor crystalline tokens?', cid)
			talk_state = 11
		else
			selfSay('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type CA2. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 11 then
		talk_state = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18522,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type MA1') then
		if getPlayerItemCount(cid,18422) >= 70 then
			selfSay('Did you bring me the 70 minor crystalline tokens?', cid)
			talk_state = 12
		else
			selfSay('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type MA1. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 12 then
		talk_state = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18518,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type MA2') then
		if getPlayerItemCount(cid,18422) >= 70 then
			selfSay('Did you bring me the 70 minor crystalline tokens?', cid)
			talk_state = 13
		else
			selfSay('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type MA2. Come back when you have it.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'yes') and talk_state == 13 then
		talk_state = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18519,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end

	elseif msgcontains(msg, 'suahudsak') then
		if getPlayerItemCount(cid,18423) >= 50 then
			selfSay('Did you bring me the 50 major crystalline tokens?', cid)
			talk_state = 14
		else
			selfSay('I need a {50 major crystalline tokens}, to give you the Gnomish Voucher Type MA2020202. Come back when you have it.', cid)
			talk_state = 0
		end

	elseif msgcontains(msg, 'yes') and talk_state == 14 then
		talk_state = 0
		if getPlayerItemCount(cid,0) >= 50 then
			if doPlayerRemoveItem(cid,0,50) == TRUE then
				doPlayerAddItem(cid,0,1)
				selfSay(done, cid)
			end
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'no') and talk_state >= 1 and talk_state <= 15 then
		selfSay('Well, then leave.')
		talk_state = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
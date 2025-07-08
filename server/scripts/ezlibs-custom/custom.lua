local ezmemory = require('scripts/ezlibs-scripts/ezmemory')
local helpers = require('scripts/ezlibs-scripts/helpers')
local player_using_card_bbs = {}
local sr = {}
print("[rank] Loaded medal/rank checker.")
-- This script will show a BBS containing a player's card collection if they press Left Shoulder

Net:on("object_interaction", function(event)
	--If A / Interact button pressed on object with class "Medal Count" then tells player how many medals they have. 

	local player_area = Net.get_player_area(event.player_id)
	local object = Net.get_object_by_id(player_area, event.object_id)
	if object.class ~= "Rank Medal Count" and object.type ~= "Rank Medal Count" then
		return
	end

  if event.button == 0 then -- press A
    local safe_secret = helpers.get_safe_player_secret(event.player_id)
    local player_memory = ezmemory.get_player_memory(safe_secret)
    local medals = 0
    for item_id, quantity in pairs(player_memory.items) do
        local item_info = ezmemory.get_item_info(item_id)
        if item_info.name == "Rank Medal" then 
          medals = quantity
        end 
    end
    if medals >= 10 then 
      --This is the message if the player has more than 10 rank medals.
      Net.message_player(event.player_id,"Mighty one, "..tostring(medals).. " rank medals you possess. Sacrifice ten to the Rank Master to my right for a Special Rank.")
    elseif medals == 0 then
      --This is the message if the player has no medals.
      Net.message_player(event.player_id,"You possess no rank medals. Only those with rank medals may seek my knowledge.")
    elseif medals == 1 then
      --This is the message if the player has one medal.
      Net.message_player(event.player_id,"Only one rank medal do you possess. Pitiful. Seek you 10 medals, then return to me.")
    else 
      --This is the message if the player has less than 10 rank medals.
      Net.message_player(event.player_id,"Weak one, only "..tostring(medals).." medals do you possess. Seek you 10 medals, then return to me.")

    end 
  end 
 
end)

local function compareByValue(key1, key2)
  return sr[key1]["q"] > sr[key2]["q"]
end

Net:on("object_interaction", function(event)
	--If A / Interact button pressed on object with class "Rank BBS" then opens BBS of ranks.

  if event.button == 0 then -- press A

  local player_area = Net.get_player_area(event.player_id)
	local object = Net.get_object_by_id(player_area, event.object_id)
  if object.class ~= "Special Rank BBS" and object.type ~= "Special Rank BBS" then
		return
	end
  local board_color = { r= 128, g= 255, b= 128 }
  local specialranks = {}
  local keys = {}
    local players = ezmemory.get_player_list()
      for secret,name in next,players do 
        local player_memory = ezmemory.get_player_memory(secret)
        if next(player_memory) ~= nil then 
          if next(player_memory.items) ~= nil then
            for item_id, quantity in next,player_memory.items do
                local item_info = ezmemory.get_item_info(item_id)
                if item_info.name == "Special Rank" then 
                  sr[secret] = { id=secret, q=quantity, read=true, title=name, author=tostring(quantity).." SRs" }
                end 
            end
          end 
        end 
      end 
      for k,info in next,sr do table.insert(keys,k) end 
      table.sort(keys, compareByValue)
      for i,nkey in next,keys do
        table.insert(specialranks,sr[nkey])
      end
    local bbs_name = "Special Ranks"
    Net.open_board(event.player_id, bbs_name, board_color, specialranks)
  end 
 
end)

return {}
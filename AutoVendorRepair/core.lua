--[[
####################
AutoVendorRepair: keivamp#
####################
]]--
local addonName, addon = ...
addon[1] = {} -- Gloable
addon[2] = {} -- Function
addon[3] = {} -- Config
addon[4] = {} -- Locale

local G, F, C, L = unpack(addon)

	local AutoVender = CreateFrame("Frame")
	AutoVender:SetScript("OnEvent", function()
	
			local c = 0
			for b = 0, 4 do
				for s = 1, GetContainerNumSlots(b) do
					local l = GetContainerItemLink(b, s)
					if l and (select(11, GetItemInfo(l)) ~= nil) and (select(2, GetContainerItemInfo(b, s)) ~= nil) then
						local p = select(11, GetItemInfo(l)) * select(2, GetContainerItemInfo(b, s))
						if select(3, GetItemInfo(l)) == 0 and p > 0 then
							UseContainerItem(b, s)
							PickupMerchantItem()
							c = c + p
						end
					end
				end
			end
			if c > 0 then

				print("|cff99CCFF".."Junk sold for: " .."|cffFFFFFF" .. GetCoinTextureString(c))

				
			end
		end)
	AutoVender:RegisterEvent("MERCHANT_SHOW")
	
	local AutoRepair = CreateFrame("Frame")
		AutoRepair:RegisterEvent("MERCHANT_SHOW")
		AutoRepair:SetScript("OnEvent", function()
		
			local cost = GetRepairAllCost()
				if cost > 0 then
					local money = GetMoney()
				if money > cost then
					RepairAllItems()
					print(format("|cff99CCFF".."Repair cost  ".."|r%s", GetMoneyString(cost)))
				else
					print("|cff99CCFF".."It's time to do some quest or go kill some mobs".."|r")
				end
			end
	end)
	
	local keivampLoginFrame=CreateFrame("Frame")
		keivampLoginFrame:RegisterEvent("PLAYER_LOGIN")
		keivampLoginFrame:RegisterEvent("CINEMATIC_STOP")
		keivampLoginFrame:SetScript("OnEvent", function(self, event) 											
		end)
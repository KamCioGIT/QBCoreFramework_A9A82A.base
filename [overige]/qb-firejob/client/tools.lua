-- Core export
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-firejob:truckTools')
AddEventHandler('qb-firejob:truckTools', function()
    local authorizedItems = {
        label = "Truck Tools",
        slots = 30,
        items = {}
    }
    local index = 1
    for _, armoryItem in pairs(Config.Items.items) do
        for i=1, #armoryItem.authorizedJobGrades do
            if armoryItem.authorizedJobGrades[i] == PlayerJob.grade.level then
                authorizedItems.items[index] = armoryItem
                authorizedItems.items[index].slot = index
                index = index + 1
            end
        end
    end
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "firefighter", authorizedItems)
end)

RegisterNetEvent('qb-firejob:scbaoptions', function(data)
	local Menu = {
		{
			header = "👨‍🚒 | SCBA Menu | 👨‍🚒",
			isMenuHeader = true
		},

		{
			header = "• Grab SCBA",
			txt = "Take SCBA out of Vehicle",
			params = {
				event = "consumables:client:grabscba",
				args = {}
			}
		},
		{
			header = "• Take off SCBA",
			txt = "Take off SCBA",
			params = {
				event = "consumables:client:takeoffscba",
				args = {}
			}
		},
		{
			header = "• Resupply SCBA",
			txt = "Resupply your SCBA to 100%",
			params = {
				event = "qb-firejob:client:resupply",
				args = {}
			}
		},
	}
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-firejob:rescuetools', function(data)
	local MenuRescue = {
		{
			header = "👨‍🚒 | Rescue Menu | 👨‍🚒",
			isMenuHeader = true
		},
		-- Spreaders from FireTools
		{
			header = "• Spreaders",
			txt = "Grab & Retrieve Spreaders",
			params = {
				event = "Client:toggleSpreaders",
				args = {}
			}
		},
		-- Truck Tools
		{
			header = "• Truck Tools",
			txt = "Grab & Retrieve Tools",
			params = {
				event = "qb-firejob:truckTools",
				args = {}
			}
		},
	}
	exports['qb-menu']:openMenu(MenuRescue)
end)
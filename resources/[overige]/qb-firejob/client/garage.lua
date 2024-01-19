-- Core export
local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
OnDuty = false

-----------------------------------
-- 	     Job Check 	  	 --
-----------------------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
end)

RegisterNetEvent('qb-firejob:garage', function(data)
 	if PlayerJob.name == Config.Job and PlayerJob.onduty then
 		exports['qb-menu']:openMenu({
 			{
 				header = "🚒 | Fire Vehicles | 🚒",
 				isMenuHeader = true
 			},
 			{
 				header = "• FireTuck",
 				txt = "Garage |  Motor: 100% | Body: 100% |Fuel: 100%",
 				params = {
 					event = "lsfd:garage",
 					args = {
 						vehicle = 'firetruk',
 					}
 				}
 			},
 			{
 				header = "• Engine",
 				txt = "Garage |  Motor: 100% | Body: 100% |Fuel: 100%",
 				params = {
 					event = "lsfd:garage",
 					args = {
 						vehicle = 'pengine',
 					}
 				}
 			},
             {
 				header = "• Rescue",
 				txt = "Garage |  Motor: 100% | Body: 100% |Fuel: 100%",
 				params = {
 					event = "lsfd:garage",
 					args = {
 						vehicle = 'prescue',
 					}
 				}
 			},
             {
 				header = "• Ladder",
 				txt = "Garage |  Motor: 100% | Body: 100% |Fuel: 100%",
 				params = {
 					event = "lsfd:garage",
 					args = {
 						vehicle = 'pladder',
 					}
 				}
 			},
 			{
 				header = "• Store Vehicle",
 				txt = "Store Vehicle Inside Garage",
 				params = {
 					event = "lsfd:storecar",
 					args = {}
 				}
 			},	
 			{
 				header = "Close (ESC)",
 				isMenuHeader = true
 			}
 		})
 		else
 		QBCore.Functions.Notify(Config.Locales['NotOnDuty'], "error")
 	end
end)



--New garage unfinished
RegisterNetEvent("lsfd:garage", function(vehicleInfo)
	local vehicle = vehicleInfo.vehicle
	local player = PlayerPedId()
    local coords = vector4(1200.57, -1507.19, 34.69, 356.35)
    QBCore.Functions.SpawnVehicle(vehicleInfo.vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "LSFD" .. tostring(math.random(10, 99)))
        SetEntityHeading(veh, coords.w)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(player, veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
		SetVehicleDirtLevel(veh, 0.1)
	end, coords, true)
end)

RegisterNetEvent('lsfd:storecar', function()
    QBCore.Functions.Notify(Config.Locales['VehicleStored'], "success")
	local ped = PlayerPedId()
    local car = GetVehiclePedIsIn(ped, true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

----------------------------
-- End Event registration --
----------------------------

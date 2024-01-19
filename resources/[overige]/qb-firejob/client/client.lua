-- Core export
local QBCore = exports['qb-core']:GetCoreObject()

-- Environment variables
local Flashlights = {}
PlayerJob = {}
OnDuty = false
Lightenabled = false
OxygenLevel = 100
OxygenUsageEnabled = false
Fireproof = false
Smokeproof = false
Blackedout = false

------------------------
-- Job Check --
------------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	if JobInfo.name == Config.Job then
		if PlayerJob.onduty then
			TriggerServerEvent("QBCore:ToggleDuty")
			OnDuty = false
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
	OnDuty = false
end)

RegisterNetEvent('Toggle:LSFDDuty')
AddEventHandler('Toggle:LSFDDuty', function()
	onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
end)

------------------------
-- Event registration --
------------------------
RegisterNetEvent("qb-firejob:FlightHandler", function(Lights)
	for _, player in pairs(QBCore.Functions.GetPlayers()) do
		Flashlights = Lights
	end
end)

-------------------
-- End of Events --
-- ============= --
--   Functions   --
-------------------

function IsWearingOxygenTank(ped)
	for i,item in pairs(Config.EupGear) do
		if item.component == "scba" then
			for i,index in pairs(item.indexes) do
				if GetPedDrawableVariation(ped, 8) == index then
					return true
				else 
					return false
				end
			end
		end
	end
end

function IsWearingFirePants(ped)
	for i,item in pairs(Config.EupGear) do
		if item.component == "suitpants" then
			for i,index in pairs(item.indexes) do
				if GetPedDrawableVariation(ped, 4) == index.index then
					return true, GetPedDrawableVariation(ped, 4)
				else 
					return false
				end
			end
		end
	end
end

function IsWearingFireTop(ped)
	for i,item in pairs(Config.EupGear) do
		if item.component == "suittop" then
			for i,index in pairs(item.indexes) do
				if GetPedDrawableVariation(ped, 11) == index.index then
					return true, GetPedDrawableVariation(ped, 11)
				else 
					return false
				end
			end
		end
	end
end

function IsWearingFullSuit(ped, witho2)
	if witho2 then
		local top = IsWearingFireTop(ped)
		local bottom = IsWearingFirePants(ped)
		local tank = IsWearingOxygenTank(ped)
		if top and bottom and tank then
			return true
		else
			return false, top, bottom, tank
		end
	else
		local top = IsWearingFireTop(ped)
		local bottom = IsWearingFirePants(ped)
		if top and bottom then
			return true
		else
			return false, top, bottom
		end
	end
end


local function ToggleOxygenUsage()
	if Config.PlaySoundEffects == true then
		if OxygenLevel > 0 then
			OxygenUsageEnabled = not OxygenUsageEnabled
			if OxygenUsageEnabled then
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "scott", 0.6)
			else
				TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.0)
			end
		else
			QBCore.Functions.Notify(Config.Locales['OxygenTankEmpty'], 'error')
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.0)
			--SetPedComponentVariation(ped, 8, 15, 0, 0) -- takes oxygent tank auto once it's empty
		end
	end
end


local function ToggleSuitLight()
	TriggerServerEvent("qb-firejob:ToggleSuitLight", not Lightenabled)
	Lightenabled = not Lightenabled

	if Config.PlaySoundEffects then
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "flashlight", 0.8)
	end

	Wait(1250)
end

local function SetSuitLightState(state)
	if state == "on" then
		TriggerServerEvent("qb-firejob:ToggleSuitLight", true)
		Lightenabled = true
	elseif state == "off" then
		TriggerServerEvent("qb-firejob:ToggleSuitLight", false)
		Lightenabled = false
	end
end

local function LoadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end

local function DoesFireExistAndIsInRadius(radius)
    local ped = PlayerPedId() 
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local isfire, coords = GetClosestFirePos(x, y, z)
	if isfire then
		local x1,y1,z1 = table.unpack(coords)
		if GetDistanceBetweenCoords(x, y, z, x1, y1, z1, false) <= radius then
			return true, GetDistanceBetweenCoords(x, y, z, x1, y1, z1, false)
		else
			return true, false
		end
	else
		return false, false
	end
end

local function SetProofs()
	local ped = PlayerPedId()
	local sleep = 2500

	if IsWearingFullSuit(ped, false) then
		SetEntityProofs(ped, false, true, false, false, false, false, Smokeproof, Smokeproof, false)
		Fireproof = true
	else
		SetEntityProofs(ped, false, false, false, false, false, false, Smokeproof, Smokeproof, false)
		Fireproof = false
	end


	if IsWearingOxygenTank(ped) and OxygenLevel > 0 and OxygenUsageEnabled then
		SetEntityProofs(ped, false, Fireproof, false, false, false, false, true, true, false)
		Smokeproof = true
	else
		SetEntityProofs(ped, false, Fireproof, false, false, false, false, false, false, false)
		Smokeproof = false
	end
	Wait(sleep)
end

------------------------
--  End Of Functions  --
-- ================== --
-- RegisterKeyMapping --
------------------------
RegisterKeyMapping('flash', 'Toggle Flashlight', 'KEYBOARD', 'E')
RegisterCommand('flash', function()
	local ped = PlayerPedId()

	if PlayerJob.name == Config.Job and IsPedInAnyVehicle(ped) then
		QBCore.Functions.Notify(Config.Locales['OutCar'], "error", 1000)
	else
		if IsWearingFireTop(ped) then

			if PlayerJob.name == Config.Job then
				QBCore.Functions.Notify(Config.Locales['FlashEnabled'], "success", 1000)
				ToggleSuitLight()
			elseif PlayerJob.name == Config.Job and not PlayerJob.onduty then
				QBCore.Functions.Notify(Config.Locales['NotOnDuty'], "error", 1000)
			else
				QBCore.Functions.Notify(Config.Locales['NotFD'], "error", 1000)
			end
		else
			if PlayerJob.name == Config.Job then

				QBCore.Functions.Notify(Config.Locales['NotUniform'], "error", 1000)

			end
		end
	end
end)

RegisterKeyMapping('scba', 'Toggle SCBA ', 'KEYBOARD', 'K')
RegisterCommand('scba', function()
	local ped = PlayerPedId()

	if PlayerJob.name == Config.Job and IsPedInAnyVehicle(ped) then
		QBCore.Functions.Notify(Config.Locales['OutCar'], "error", 1000)
	else
		if IsWearingOxygenTank(ped) then

			if PlayerJob.name == Config.Job then
				QBCore.Functions.Notify(Config.Locales['OxygenEnabled'], "success", 1000)
				ToggleOxygenUsage()
			elseif PlayerJob.name == Config.Job and not PlayerJob.onduty then
				QBCore.Functions.Notify(Config.Locales['NotOnDuty'], "error", 1000)
			else
				QBCore.Functions.Notify(Config.Locales['NotFD'], "error", 1000)
			end
		else
			if PlayerJob.name == Config.Job then
				QBCore.Functions.Notify(Config.Locales['NotUniform'], "error", 1000)
			end
		end
	end
end)


-------------------------------
-- End Of RegisterKeyMapping --
-- ========================= --
--       Script loops 		 --
-------------------------------
CreateThread(function()
	while true do
		Wait(0)
		PlayerJob = QBCore.Functions.GetPlayerData().job

		if LocalPlayer.state['isLoggedIn'] then
			local ped = PlayerPedId()
			local blt, fre, expl, cls, mle, stm, p7, drwn = GetEntityProofs(ped)
			local x,y,z = table.unpack(GetEntityCoords(ped))
	
			SetProofs()
	
			if not IsWearingOxygenTank(ped) then
				if Config.OxygenLevelType ~= "text" then
					SendNUIMessage({
						type = "hide"
					})
				end
			end
	
			if PlayerJob.name ~= Config.Job then
				if Config.OxygenLevelType ~= "text" then
					SendNUIMessage({
						type = "hide"
					})
				end
			end
	
			if PlayerJob.name == Config.Job and Config.ShowOxygenLevel and IsWearingOxygenTank(ped) then
				if Config.OxygenLevelType == true then
					SendNUIMessage({
						type = "set-show",
						value = OxygenLevel
					})
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		
		for player,_ in pairs(Flashlights) do
			local source = GetPlayerFromServerId(player)
			local ped = GetPlayerPed(source)

			if player and source and ped then
				local bonecoords = GetPedBoneCoords(ped, 23553, 0.0, 0.0, 0.0)
				DrawSpotLight(bonecoords, GetEntityForwardVector(ped), 255, 255, 255, 40.0, 2.0, 2.0, 10.0, 15.0)
			end
		end
	end
end)

CreateThread(function()
	while true do

		Wait(Config.OxygenUsageInterval * 1000)
		local ped = PlayerPedId()
		if IsWearingOxygenTank(ped) and OxygenUsageEnabled and OxygenLevel > 0 then
			OxygenLevel = OxygenLevel - 1
			if Config.ShowOxygenAlerts then
				for i,alert in pairs(Config.AlertWhen) do
					if OxygenLevel == alert.oxygen then
						QBCore.Functions.Notify(alert.text, "primary", 1000) -- [text] = message, [type] = primary | error | success, [length] = time till fadeout.
					end
				end
			end
			if OxygenLevel <= 0 then
				ToggleOxygenUsage()
			end
		end

	end
end)

CreateThread(function()
	while true do

		Wait(Config.SmokeInhalationDamageTime * 1000)
		local ped = PlayerPedId()
		local exists,inrange = DoesFireExistAndIsInRadius(7)
		if exists and inrange then
			if not OxygenUsageEnabled or OxygenLevel <= 0 then
				SetEntityHealth(ped, GetEntityHealth(ped) - Config.SmokeInhalationDamageInteger)
				SetPlayerHealthRechargeMultiplier(ped, 0.0)
				if Config.AlertOnSmokeInhalation then
					QBCore.Functions.Notify(Config.Locales['SmokeInhalation'], 'error')
				end
			else
				SetPlayerHealthRechargeMultiplier(ped, 1.0)
			end
		end
	end
end)

--------------------
-- End of Threads --
--------------------

RegisterNetEvent('qb-firejob:toolsmenu', function(data)
	local Menu = {
		{
			header = "👨‍🚒 | Tools Menu | 👨‍🚒",
			isMenuHeader = true
		},

		{
			header = "• Grab Attack Line",
			txt = "Water Variant",
			params = {
				event = "firejob:hose",
				args = {}
			}
		},
		{
			header = "• Grab Attack Line Foam",
			txt = "Foam Variant",
			params = {
				event = "firejob:foam",
				args = {}
			}
		},
		{
			header = "• SCBA Menu",
			text = "Open SCBA Menu",
			params = {
				event = "qb-firejob:scbaoptions",
				args = {}
			}
		},
		{
			header = "• Rescue Tools Menu",
			text = "Open Rescue Tools Menu",
			params = {
				event = "qb-firejob:rescuetools",
				args = {}
			}
		}
	}
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent("consumables:client:UseScba")
AddEventHandler("consumables:client:UseScba", function()
    local ped = PlayerPedId()
	if PlayerJob.name == Config.Job then

		QBCore.Functions.Progressbar("use_scba", "Puttin on SCBA..", 19000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "pon", 0.5)
		}, {}, {}, {}, function() -- Done
			QBCore.Functions.Notify(Config.Locales['ScbaEquiped'], 'success')
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["scott"], "remove")
			TriggerServerEvent("QBCore:Server:RemoveItem", "scott", 1)
			SetPedComponentVariation(ped, 8, 70, 0, 0)
			OxygenLevel = 100
		end)
	else
		QBCore.Functions.Notify(Config.Locales['NotFD'], 'error')
	end
end)

RegisterNetEvent("consumables:client:grabscba", function()
    local ped = PlayerPedId()
	if PlayerJob.name == Config.Job then

		QBCore.Functions.Progressbar("use_scba", "Putting on SCBA..", 19000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "pon", 0.5)
		}, {}, {}, {}, function() -- Done
			QBCore.Functions.Notify(Config.Locales['ScbaEquiped'], 'success')
			SetPedComponentVariation(ped, 8, 70, 0, 0)
			OxygenLevel = 100
		end)
	else
		QBCore.Functions.Notify(Config.Locales['NotFD'], 'error')
	end
end)

RegisterNetEvent("consumables:client:takeoffscba", function()
    local ped = PlayerPedId()
	if PlayerJob.name == Config.Job then

		QBCore.Functions.Progressbar("use_scba", "Taking off SCBA..", 19000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "pon", 0.5)
		}, {}, {}, {}, function() -- Done
			QBCore.Functions.Notify(Config.Locales['ScbaUnequiped'], 'error')
			SetPedComponentVariation(ped, 8, 91, 0, 0)
		end)
	else
		QBCore.Functions.Notify(Config.Locales['NotFD'], 'error')
	end
end)

RegisterNetEvent("qb-firejob:client:resupply", function()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.0)
	local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, ped, 0)
	local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
	if IsEntityAVehicle(vehicleHandle) == 1 then
		local vehicleModel = GetEntityModel(vehicleHandle)
		local vehicleHandle = NetworkGetNetworkIdFromEntity(vehicleHandle)
		 SetNetworkIdExistsOnAllMachines(vehicleHandle, true)
	end
	OxygenLevel = 100 -- Sets OxygenLevel to 100%
end)
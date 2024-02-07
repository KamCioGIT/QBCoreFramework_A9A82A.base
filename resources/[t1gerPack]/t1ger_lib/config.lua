Config = {
	Debug = true,	-- set to false to disable prints 

	Triggers = {
		['ESX'] = { -- update your triggers/event-names here if changed:
			resource = 'es_extended', -- esx resource name
			obj = 'esx:getSharedObject',
			load = 'esx:playerLoaded',
			job = 'esx:setJob'
		},
		['QB'] = { -- update your triggers/event-names here if changed:
			resource = 'qb-core', -- qb-core resource name
			obj = 'QBCore:GetObject',
			load = 'QBCore:Client:OnPlayerLoaded',
			job = 'QBCore:Client:OnJobUpdate',
			uObjCL = 'QBCore:Client:UpdateObject',
			uObjSV = 'QBCore:Server:UpdateObject',
			dutyToggle = 'QBCore:ToggleDuty',
		},
	},

	PoliceJobs = {['police'], ['lspd']}, -- whitelisted police jobs to fetch online police count

	PoliceNotification = 'default', -- 'default' is builtIn police alerts, 'cd_' for codesign, 'custom' to use another (implement function inside TriggerPoliceNotification in t1ger_lib/utils.lua)

	AcePermissions = {'command'}, -- (command is default gives admin access to all commands) add your ace permissions in here, used to check if player has perms/admin.

	UseFrameworkNotification = false, -- Use default ESX/QB notification or use your own custom from Lib.Notification
	
	VehicleKeys = 'default', -- use 'default' or 't1ger-keys' or 'custom'.  default natives to check locked/unlocked or t1ger_keys exports or custom (your own).
	
	Inventory = 'default', --[[
        'default' - default framework inventory, esx: menu based, qb-core: default qb-inventory
        'ox-inventory' - ox_inventory (free): https://github.com/overextended/ox_inventory
        'mf-inventory' - modfreakz inventory (paid): https://modit.store/products/mf-inventory
        'qs-inventory' - quasar inventory (paid): https://youtu.be/iO82BBU1hYw
    ]]

	TargetSystem = 'ox-target', --[[
		'ox-target' - ox_target (free): https://github.com/overextended/ox_target
		'qb-target' - qb_target (free): https://github.com/qbcore-framework/qb-target
		'meta-target' - meta_target (free): https://github.com/meta-hub/meta_target
	]]

	Garage = 'default', --[[ -- only support the below garage systems, please leave this at 'default'
		'default' - default esx_garage or default qb_garages
		't1ger-garage' - t1ger_garage: https://youtu.be/7qgiFW0Qi2Q
		'cd-garage' - cd_target: https://docs.codesign.pro/paid-scripts/garage
	]]

	VehicleMeta = { -- do not touch!
		Props = { ['mileage'] = true, ['service'] = true, ['health'] = true },
	},
}

Framework = GetResourceState(Config.Triggers['QB'].resource):find('started') and 'QB' or GetResourceState(Config.Triggers['ESX'].resource):find('started') and 'ESX'
Player_Vehicles_DB = {}

if not Framework then
	error('Unable to determine framework, resource was renamed.')
else
	print("Detected Framework: "..Framework)
	if Framework == 'ESX' then
		ESX = exports[Config.Triggers[Framework].resource]:getSharedObject()
		Player_Vehicles_DB = {table = 'owned_vehicles', owner = 'owner', stored = 'stored', props = 'vehicle', garage = 'parking'}
	elseif Framework == 'QB' then 
		QBCore = exports[Config.Triggers[Framework].resource]:GetCoreObject()
		Player_Vehicles_DB = {table = 'player_vehicles', owner = 'citizenid', stored = 'state', props = 'mods', garage = 'garage'}
	end

	if next(Player_Vehicles_DB) then
		if Config.Garage == 't1ger-garage' then
            Player_Vehicles_DB.stored = 'state'
            Player_Vehicles_DB.garage = 'garage'
        elseif Config.Garage == 'cd-garage' then
            Player_Vehicles_DB.stored = 'in_garage'
            Player_Vehicles_DB.garage = 'garage_id'
        end
	end
end

function GetLib()
	return Core, Config, Framework
end

function GetUtils()
	return Lib
end

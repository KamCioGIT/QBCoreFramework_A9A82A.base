Lib = {

	RandomNameId = 0,

	TargetLabels = {},
	
	TyresIndex = { -- Wheel index list according to the number of vehicle wheels.
		['2'] = {0, 4}, -- Bike and cycle.
		['3'] = {0, 1, 4, 5}, -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
		['4'] = {0, 1, 4, 5}, -- Vehicle with 4 wheels.
		['6'] = {0, 1, 2, 3, 4, 5} -- Vehicle with 6 wheels.
	},

	WheelBoneName = {
		['0'] = 'wheel_lf',
		['1'] = 'wheel_rf',
		['2'] = 'wheel_lm1',
		['3'] = 'wheel_rm1',
		['4'] = 'wheel_lr',
		['5'] = 'wheel_rr'
	},

	VehicleWheels = {
		['2'] = { -- Bike and cycle.
			['0'] = {label = 'Wheel Front', bone = 'wheel_lf', index = 0, wheelId = 0},
			['4'] = {label = 'Wheel Rear', bone = 'wheel_lr', index = 4, wheelId = 1},
		},
		['3'] = { -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['4'] = { -- Vehicle with 4 wheels.
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['6'] = { -- Vehicle with 6 wheels.
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['2'] = {label = 'Wheel Middle (L)', bone = 'wheel_lm1', index = 2, wheelId = 4},
			['3'] = {label = 'Wheel Middle (R)', bone = 'wheel_rm1', index = 3, wheelId = 5},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['8'] = { -- Vehicle with 6 wheels.
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['2'] = {label = 'Wheel Middle (L)', bone = 'wheel_lm1', index = 2, wheelId = 4},
			['3'] = {label = 'Wheel Middle (R)', bone = 'wheel_rm1', index = 3, wheelId = 5},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
	},

	VehicleDoors = {
		['0'] = {label = 'Door Front (L)', bone = 'door_dside_f', bone2 = 'seat_dside_f', index = 0},
		['1'] = {label = 'Door Front (R)', bone = 'door_pside_f', bone2 = 'seat_pside_f', index = 1},
		['2'] = {label = 'Door Rear (L)', bone = 'door_dside_r', bone2 = 'seat_dside_r', index = 2},
		['3'] = {label = 'Door Rear (R)', bone = 'door_pside_r', bone2 = 'seat_pside_r', index = 3},
		['4'] = {label = 'Hood', bone = 'bonnet', index = 4},
		['5'] = {label = 'Trunk', bone = 'boot', index = 5},
	},

	VehicleWindows = {
		['0'] = {label = 'Window Front (L)', bone = 'window_lf', index = 0},
		['1'] = {label = 'Window Front (R)', bone = 'window_rf', index = 1},
		['2'] = {label = 'Window Rear (L)', bone = 'window_lr', index = 2},
		['3'] = {label = 'Window Rear (R)', bone = 'window_rr', index = 3},
		['6'] = {label = 'Windscreen Front', bone = 'windscreen', index = 6},
		['7'] = {label = 'Windscreen Rear', bone = 'windscreen_r', index = 7},
	},

	-- Load Anim
	LoadAnim = function(animDict)
		RequestAnimDict(animDict); while not HasAnimDictLoaded(animDict) do Citizen.Wait(1) end
	end,
	
	
	-- Load Model
	LoadModel = function(model)
		if not HasModelLoaded(model) and IsModelInCdimage(model) then
			RequestModel(model)
	
			while not HasModelLoaded(model) do
				Wait(0)
			end
		end
	end,

	-- Load Ptfx
	LoadPtfxAsset = function(dict)
		RequestNamedPtfxAsset(dict); while not HasNamedPtfxAssetLoaded(dict) do Citizen.Wait(1) end
	end,

	-- Function to Display Help Text:
	DisplayHelpText = function(str)
		SetTextComponentFormat("STRING")
		AddTextComponentString(str)
		DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	end,
	
	-- Round Fnction:
	RoundNumber = function(num, numDecimalPlaces)
		local mult = 10^(numDecimalPlaces or 0)
		return math.floor(num * mult + 0.5) / mult
	end,
	
	-- Comma Function:
	CommaValue = function(n) -- credit http://richard.warburton.it
		local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
		return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
	end,

	FirstCharUpper = function(str)
		return (str:gsub("^%l", string.upper))
	end,

	-- Trim (for plates especially):
	Trim = function(input)
		if input then
			return (string.gsub(input, "^%s*(.-)%s*$", "%1"))
		else
			return nil
		end
	end,

	-- Table length:
	TableLength = function(t)
		local count = 0
		for entry in pairs(t) do 
			count = count + 1
		end
		return count
	end,

	-- Boolean to Number
	BooleanToNumber = function(bool)
		return bool and 1 or 0
	end,
	
	-- Draw 3D Text
	Draw3DText = function(x, y, z, text)
		local boolean, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
		SetTextScale(0.32, 0.32); SetTextFont(4); SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING"); SetTextCentre(1); AddTextComponentString(text)
		DrawText(_x, _y)
		local factor = (string.len(text) / 500)
		DrawRect(_x, (_y + 0.0125), (0.015 + factor), 0.03, 0, 0, 0, 80)
	end,
	
	-- Get Control of Entity:
	GetControlOfEntity = function(entity)
		local netTime = 100
		NetworkRequestControlOfEntity(entity)
		while not NetworkHasControlOfEntity(entity) and netTime > 0 do 
			NetworkRequestControlOfEntity(entity)
			Wait(1)
			netTime = (netTime - 1)
		end
	end,

	-- Standard Notification:
	Notification = function(data)
		if Config.UseFrameworkNotification then 
			Core.Notification(data.message)
		else
			lib.notify({
				title = data.title,
				description = data.message,
				type = data.type,
				position = 'top', 
			})
		end
	end,

	-- Advanced Notification:
	AdvancedNotification = function(textureDict, textureName, iconType, title, showInBrief, subtitle, message)
		RequestStreamedTextureDict(textureDict)
		BeginTextCommandThefeedPost("STRING")
		AddTextComponentSubstringPlayerName(message)
		EndTextCommandThefeedPostMessagetext(textureDict, textureName, false, iconType, title, subtitle)
		EndTextCommandThefeedPostTicker(false, showInBrief)
	end,

	PoliceNotification = function(coords, street, data)
		lib.notify({
			title = data.title,
			description = data.description,
			duration = data.duration,
			position = data.position,
			type = data.type,
			icon = data.icon,
		})
	end,

	TriggerPoliceNotification = function(coords, street, data)
		if Config.PoliceNotification == 'default' then
			TriggerServerEvent('t1ger_lib:server:policeNotification', coords, street, data)
		elseif Config.PoliceNotification == 'cd_' then
			local cd_playerInfo = exports['cd_dispatch']:GetPlayerInfo()
			local policeJobs = {}
			for k,v in pairs(Config.PoliceJobs) do
				table.insert(policeJobs, k)
			end
			TriggerServerEvent('cd_dispatch:AddNotification', {
				job_table = policeJobs, 
				coords = cd_playerInfo.coords,
				title = data.title,
				message = data.description, 
				flash = 0,
				unique_id = cd_playerInfo.unique_id,
				sound = 1,
				blip = {
					sprite = 431, 
					scale = 1.2, 
					colour = 3,
					flashes = false, 
					text = data.blipText,
					time = 5,
					radius = 0,
				}
			})
		elseif Config.PoliceNotification == 'custom' then
			-- coords (player coords)
			-- street (street name )
			-- data (table) containing: title, description, blipText, duration, position, type, icon
			-- to fetch other values inside the table, u need to find the TriggerPoliceNotification functions inside the resources and alter it there.
			-- add your own police event etc in here.
		end
	end,

	CreateObject = function(object, coords, heading, cb, networked)
		networked = networked == nil and true or networked
		if networked then
			Core.TriggerCallback('t1ger_lib:server:createObject', function(networkId)
				if cb then
					local obj = NetworkGetEntityFromNetworkId(networkId)
					local attempts = 0
					while not DoesEntityExist(obj) do
						obj = NetworkGetEntityFromNetworkId(networkId)
						Wait(0)
						attempts = attempts + 1
						if attempts > 100 then
							break
						end
					end
					cb(obj, networkId)
				end
			end, object, coords, heading)
		else 
			local model = type(object) == 'number' and object or joaat(object)
			local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
			Lib.LoadModel(model)
			local obj = CreateObject(model, vector.xyz, networked, false, true)
			if cb then
				cb(obj)
			end
		end
	end,

	NetworkGetEntity = function(netId)
		local entity = NetworkGetEntityFromNetworkId(netId)
		local attempts = 0
		while not DoesEntityExist(entity) do
			entity = NetworkGetEntityFromNetworkId(netId)
			Wait(0)
			attempts = attempts + 1
			if attempts > 100 then
				break
			end
		end
		return entity, attempts
	end,

	IsPlayerInsideVehicle = function(player)
		if IsPedInAnyVehicle(player, false) then
			local vehicle = GetVehiclePedIsIn(player, false)
			if vehicle ~= nil or vehicle ~= 0 then
				return true
			else
				return false
			end
		end
	end,

	GetClosestVehicle = function(coords, maxDistance, includePlayerVehicle)
		local vehicles = GetGamePool('CVehicle')
		local closestVehicle, closestCoords
		maxDistance = maxDistance or 2.0
	
		for i = 1, #vehicles do
			local vehicle = vehicles[i]
	
			if not cache.vehicle or vehicle ~= cache.vehicle or includePlayerVehicle then
				local vehicleCoords = GetEntityCoords(vehicle)
				local distance = #(coords - vehicleCoords)
	
				if distance < maxDistance then
					maxDistance = distance
					closestVehicle = vehicle
					closestCoords = vehicleCoords
				end
			end
		end
	
		return closestVehicle, closestCoords
	end,
	
	GetVehicleInDirection = function(pos)
		local ped = PlayerPedId()
		local plyCoords = pos or GetEntityCoords(ped)
		local direction = GetOffsetFromEntityInWorldCoords(ped, 0.0, 5.0, 0.0)
		local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(plyCoords, direction, 10, ped, 0)
		local numRayHandle, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
	
		if hit == 1 and GetEntityType(entityHit) == 2 then
			local entityCoords = GetEntityCoords(entityHit)
			return entityHit, entityCoords
		end
	
		return nil
	end,

	GetClosestPlayer = function(coords)
		return Lib.GetClosestEntity(Lib.GetPlayers(true, true), true, coords, nil)
	end,

	GetPlayersInArea = function(coords, maxDistance)
		return Lib.EnumerateEntitiesWithinDistance(Lib.GetPlayers(true, true), true, coords, maxDistance)
	end,

	GetPlayers = function(onlyOtherPlayers, returnKeyValue, returnPeds)
		local players, myPlayer = {}, PlayerId()
	
		for k, player in ipairs(GetActivePlayers()) do
			local ped = GetPlayerPed(player)
	
			if DoesEntityExist(ped) and ((onlyOtherPlayers and player ~= myPlayer) or not onlyOtherPlayers) then
				if returnKeyValue then
					players[player] = ped
				else
					players[#players + 1] = returnPeds and ped or player
				end
			end
		end
	
		return players
	end,

	GetClosestPlayer2 = function(coords, maxDistance, includePlayer)
		local players = GetActivePlayers()
		local closestId, closestPed, closestCoords
		maxDistance = maxDistance or 2.0
	
		for i = 1, #players do
			local playerId = players[i]
	
			if playerId ~= PlayerId() or includePlayer then
				local playerPed = GetPlayerPed(playerId)
				local playerCoords = GetEntityCoords(playerPed)
				local distance = #(coords - playerCoords)
	
				if distance < maxDistance then
					maxDistance = distance
					closestId = playerId
					closestPed = playerPed
					closestCoords = playerCoords
				end
			end
		end
	
		return closestId, closestPed, closestCoords
	end,

	GetClosestEntity = function(entities, isPlayerEntities, coords, modelFilter)
		local closestEntity, closestEntityDistance, filteredEntities = -1, -1, nil
	
		if coords then
			coords = vector3(coords.x, coords.y, coords.z)
		else
			local playerPed = PlayerPedId()
			coords = GetEntityCoords(playerPed)
		end
	
		if modelFilter then
			filteredEntities = {}
	
			for k, entity in pairs(entities) do
				if modelFilter[GetEntityModel(entity)] then
					filteredEntities[#filteredEntities + 1] = entity
				end
			end
		end
	
		for k, entity in pairs(filteredEntities or entities) do
			local distance = #(coords - GetEntityCoords(entity))
	
			if closestEntityDistance == -1 or distance < closestEntityDistance then
				closestEntity, closestEntityDistance = isPlayerEntities and k or entity, distance
			end
		end
	
		return closestEntity, closestEntityDistance
	end,

	EnumerateEntitiesWithinDistance = function(entities, isPlayerEntities, coords, maxDistance)
		local nearbyEntities = {}
	
		if coords then
			coords = vector3(coords.x, coords.y, coords.z)
		else
			local playerPed = PlayerPedId()
			coords = GetEntityCoords(playerPed)
		end
	
		for k, entity in pairs(entities) do
			local distance = #(coords - GetEntityCoords(entity))
	
			if distance <= maxDistance then
				nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
			end
		end
	
		return nearbyEntities
	end,

	RemoveCharacterFromString = function(s, char)
		local string = s:gsub('%'..char, '')
		return string
	end,

	KeybindToString = function(input)
		local keybindString = GetControlInstructionalButton(0, input, true):gsub('t_', '')
		return keybindString
	end,

	IsVehicleLocked = function(vehEntity)
		if Config.VehicleKeys == 'default' then
			local lockedStatus = GetVehicleDoorLockStatus(vehEntity)
			if lockedStatus == 1 or lockedStatus == 0 then 
				return false
			elseif lockedStatus == 2 or lockedStatus == 10 then 
				return true
			end
		elseif Config.VehicleKeys == 't1ger-keys' then
			local lockedStatus = exports['t1ger_keys']:GetVehicleLockedStatus(vehEntity)
			if lockedStatus == 1 or lockedStatus == 0 then 
				return false
			elseif lockedStatus == 2 or lockedStatus == 10 then 
				return true
			end
		elseif Config.VehicleKeys == 'custom' then
			-- add your own, make sure to return true/false
		end
	end,

	AddGlobalVehicle = function(args)
		if Config.TargetSystem == 'ox-target' then
			exports['ox_target']:addGlobalVehicle(args.options)
		elseif Config.TargetSystem == 'q-target' then
			print("f*cking get ox_target instead of this outdated shit, b*tch lol")
		elseif Config.TargetSystem == 'qb-target' then
			local newOptions = {}
			for k,v in pairs(args.options) do
				local NewFunction = nil
				if v.onSelect ~= nil then
					NewFunction = function(entity)
						local data = {entity = entity, coords = GetEntityCoords(entity)}
						v.onSelect(data)
					end
				end
				table.insert(newOptions, {num = v.num or nil, type = v.type, event = v.event or nil, icon = v.icon, label = v.label, action = NewFunction or nil, canInteract = v.canInteract})
			end
			exports['qb-target']:AddGlobalVehicle({
				options = newOptions,
				distance = args.distance,
				canInteract = args.canInteract,
			})
		elseif Config.TargetSystem == 'meta-target' then
			local newOptions = {}
			for k,v in ipairs(args.options) do
				local NewFunction = function(entity)
					local data = {entity = entity, coords = GetEntityCoords(entity)}
					if v.onSelect ~= nil then
						v.onSelect(data)
					else
						TriggerEvent(v.event, data)
					end
				end
				table.insert(newOptions, {label = v.label, index = k, onSelect = NewFunction})
			end
			Lib.RandomNameId = Lib.RandomNameId + 1
			local targetName = 'obj'..Lib.RandomNameId
			local canInteract = function(target, pos, ent)
				return args.canInteract(ent)
			end
			exports['meta_target']:addObject(targetName, 'Obj', 'fa-solid fa-globe', args.distance, false, newOptions, {}, GetInvokingResource(), canInteract)
		end	
	end,

	AddGlobalObject = function(args)
		if Config.TargetSystem == 'ox-target' then
			exports['ox_target']:addGlobalObject(args.options)
		elseif Config.TargetSystem == 'q-target' then
			print("f*cking get ox_target instead of this outdated shit, b*tch lol")
		elseif Config.TargetSystem == 'qb-target' then
			local newOptions = {}
			for k,v in pairs(args.options) do
				local NewFunction = nil
				if v.onSelect ~= nil then
					NewFunction = function(entity)
						local data = {entity = entity, coords = GetEntityCoords(entity)}
						v.onSelect(data)
					end
				end
				table.insert(newOptions, {num = v.num or nil, type = v.type, event = v.event or nil, icon = v.icon, label = v.label, action = NewFunction or nil, canInteract = v.canInteract})
			end
			exports['qb-target']:AddGlobalObject({
				options = newOptions,
				distance = args.distance,
				canInteract = args.canInteract,
			})
		elseif Config.TargetSystem == 'meta-target' then
			local newOptions = {}
			for k,v in ipairs(args.options) do
				local NewFunction = function(entity)
					local data = {entity = entity, coords = GetEntityCoords(entity)}
					if v.onSelect ~= nil then
						v.onSelect(data)
					else
						TriggerEvent(v.event, data)
					end
				end
				table.insert(newOptions, {label = v.label, index = k, onSelect = NewFunction})
			end
			Lib.RandomNameId = Lib.RandomNameId + 1
			local targetName = 'obj'..Lib.RandomNameId
			local canInteract = function(target, pos, ent)
				return args.canInteract(ent)
			end
			exports['meta_target']:addObject(targetName, 'Obj', 'fa-solid fa-globe', args.distance, false, newOptions, {}, GetInvokingResource(), canInteract)
		end	
	end,

	AddGlobalPed = function(args)
		if Config.TargetSystem == 'ox-target' then
			exports['ox_target']:addGlobalPed(args.options)
		elseif Config.TargetSystem == 'q-target' then
			local newOptions = {}
			for k,v in pairs(args.options) do
				table.insert(newOptions, {num = v.num or nil, action = v.onSelect or nil, event = v.event or nil, label = v.label, icon = v.icon, canInteract = v.canInteract})
			end
			exports['qtarget']:Ped({
				options = newOptions,
				distance = args.distance,
				canInteract = args.canInteract
			})
		elseif Config.TargetSystem == 'qb-target' then
			local newOptions = {}
			for k,v in pairs(args.options) do
				table.insert(newOptions, {num = v.num or nil, type = v.type, event = v.event or nil, icon = v.icon, label = v.label, action = v.onSelect or nil, canInteract = v.canInteract})
			end
			exports['qb-target']:AddGlobalPed({
				options = newOptions,
				distance = args.distance,
				canInteract = args.canInteract,
			})
		elseif Config.TargetSystem == 'meta-target' then
			local newOptions = {}
			for k,v in ipairs(args.options) do
				local NewFunction = function(target,option,entity)
					local args = {entity = entity}
					TriggerEvent(v.event, args)
				end
				table.insert(newOptions, {label = v.label, index = k, onSelect = NewFunction})
			end
			Lib.RandomNameId = Lib.RandomNameId + 1
			local targetName = 'ped'..Lib.RandomNameId
			local canInteract = function(target, pos, ent)
				return args.canInteract(ent)
			end
			exports['meta_target']:addPed(targetName, 'Ped', args.options[1].icon, args.distance, false, newOptions, {}, GetInvokingResource(), canInteract)
		end
	end,
	
	AddLocalEntity = function(entity, args)
		if Config.TargetSystem == 'ox-target' then
			exports['ox_target']:addLocalEntity(entity, args.options)
		elseif Config.TargetSystem == 'q-target' then
			if v.onSelect == nil then 
				local newOptions = {}
				for k,v in pairs(args.options) do
					table.insert(newOptions, {num = v.num or nil, action = v.onSelect or nil, event = v.event or nil, label = v.label, icon = v.icon})
				end
				exports.qtarget:AddTargetEntity(entity, {
					options = newOptions,
					distance = args.distance,
					canInteract = args.canInteract,
				})
			else
				print("f*cking get ox_target instead of this outdated shit, b*tch lol")
			end
		elseif Config.TargetSystem == 'qb-target' then
			local newOptions = {}
			for k,v in pairs(args.options) do
				local NewFunction = nil
				if v.onSelect ~= nil then
					NewFunction = function(entity)
						local data = {entity = entity, coords = GetEntityCoords(entity)}
						v.onSelect(data)
					end
				end
				table.insert(newOptions, {num = v.num or nil, type = v.type, event = v.event or nil, icon = v.icon, label = v.label, action = NewFunction or nil, canInteract = v.canInteract})
			end
			exports['qb-target']:AddTargetEntity(entity, {
				options = newOptions,
				distance = args.distance,
				canInteract = args.canInteract,
			})
		elseif Config.TargetSystem == 'meta-target' then
			local newOptions = {}
			for k,v in ipairs(args.options) do
				local NewFunction = function(entity)
					local data = {entity = entity, coords = GetEntityCoords(entity)}
					if v.onSelect ~= nil then
						v.onSelect(data)
					else
						TriggerEvent(v.event, data)
					end
				end
				table.insert(newOptions, {label = v.label, index = k, onSelect = NewFunction})
			end
			local canInteract = args.canInteract
			if canInteract then
				canInteract = function(target, pos, ent)
					return args.canInteract(ent)
				end
			end
			exports['meta_target']:addLocalEnt(args.options[1].name, 'NPC', args.options[1].icon, entity, args.distance, false, newOptions, {}, GetInvokingResource(), canInteract or nil)
		end
	end,

	RemoveLocalEntity = function(entity, args, label)
		if Config.TargetSystem == 'ox-target' then
			exports.ox_target:removeLocalEntity(entity, args)
		elseif Config.TargetSystem == 'q-target' then
			print("f*cking get ox_target instead of this outdated shit, b*tch lol")
		elseif Config.TargetSystem == 'qb-target' then
			exports['qb-target']:RemoveTargetEntity(entity, label)
		elseif Config.TargetSystem == 'meta-target' then
			exports['meta_target']:removeTarget(args)
		end
	end,
}

RegisterNetEvent('t1ger_lib:utils:notification')
AddEventHandler('t1ger_lib:utils:notification', function(msg)
    Lib.Notification(msg)
end)

RegisterNetEvent('t1ger_lib:utils:policeNotification')
AddEventHandler('t1ger_lib:utils:policeNotification', function(coords, street, msg)
    Lib.PoliceNotification(coords, street, msg)
end)

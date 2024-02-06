RegisterNetEvent('mechanicsystem:client:createShopBlips')
AddEventHandler('mechanicsystem:client:createShopBlips', function(shops)
    for id,data in pairs(shops) do
        if data.blip ~= nil then
            if data.blip.enable then
                CreateShopBlips(id, data.blip, data.name)
            end
        end
    end
end)

GetLabelFromItemName = function(itemName, category)
    if Config.Items[category] ~= nil then 
        for k,v in pairs(Config.Items[category]) do
            if itemName == v.name then
                return v.label
            end
        end
    else
        for cat, data in pairs(Config.Items) do
            for k,v in pairs(Config.Items[cat]) do
                if itemName == v.name then
                    return v.label
                end 
            end
        end
    end
    return itemName
end

CanInteractLift = function(entity)
    if playerMechId > 0 or isPlayerAdmin then
        local modelHash = GetEntityModel(entity)
        if modelHash == Config.Lift.Frame then
            return true
        end
    end
    return false
end

CanAdminInteractLift = function(entity)
    if isPlayerAdmin then
        local modelHash = GetEntityModel(entity)
        if modelHash == Config.Lift.Frame then
            return true
        end
    end
    return false
end

local lift = { using = false, stop = false,
    target = {
        options = {
            {
                name = 'mechanicsystem:lift:up',
                icon = Config.Lift.Target['up'].icon,
                label = Config.Lift.Target['up'].label,
                canInteract = CanInteractLift,
                distance = Config.Lift.Distance,
                onSelect = function(data)
                    LiftHandle(data, 'up')
                end
            },
            {
                name = 'mechanicsystem:lift:down',
                icon = Config.Lift.Target['down'].icon,
                label = Config.Lift.Target['down'].label,
                canInteract = CanInteractLift,
                distance = Config.Lift.Distance,
                onSelect = function(data)
                    LiftHandle(data, 'down')
                end
            },
            {
                name = 'mechanicsystem:lift:stop',
                icon = Config.Lift.Target['stop'].icon,
                label = Config.Lift.Target['stop'].label,
                canInteract = CanInteractLift,
                distance = Config.Lift.Distance,
                onSelect = function(data)
                    LiftHandle(data, 'stop')
                end
            },
            {
                name = 'mechanicsystem:lift:remove',
                event = 'mechanicsystem:client:removeLift',
                icon = Config.Lift.Target['remove'].icon,
                label = Config.Lift.Target['remove'].label,
                distance = Config.Lift.Distance,
                canInteract = CanAdminInteractLift
            },
        },
        distance = Config.Lift.Distance,
        canInteract = CanInteractLift,
    }
}

Lib.AddGlobalObject(lift.target)

LiftHandle = function(data, action)
    if IsPedInAnyVehicle(player, false) or IsPedInAnyVehicle(player, true) then 
        return
    end

    if action == 'stop' then 
        lift.stop = true
    else
        local arms = GetClosestObjectOfType(data.coords.x, data.coords.y, data.coords.z, 5.0, Config.Lift.Arms, false, false, false)
        local armsCoords = GetEntityCoords(arms)
        
        local vehicle = Lib.GetClosestVehicle(data.coords, 3.0, false)

        local physics = false
        if vehicle ~= nil and DoesEntityExist(vehicle) then
            physics = true
        end

        lift.using = true

        for i = 1, 600, 1 do

            if physics then 
                ActivatePhysics(vehicle)
            end

            if lift.stop == true then 
                lift.stop = false
                lift.using = false
                break
            end

            local dist = GetEntityHeightAboveGround(arms)

            if action == 'up' then
                if dist >= 2.1 then 
                    lift.using = false
                    break
                end
                armsCoords = GetEntityCoords(arms)
                SetEntityCoords(arms, armsCoords.x, armsCoords.y, armsCoords.z + 0.005, 0.0, 0.0, 0.0, false)
            elseif action == 'down' then
                if dist <= 0.005 then
                    lift.using = false
                    break
                end
                armsCoords = GetEntityCoords(arms)
                SetEntityCoords(arms, armsCoords.x, armsCoords.y, armsCoords.z - 0.005, 0.0, 0.0, 0.0, false)
            end
            
            Wait(10)
        end

        lift.using = false
    end
end

CreateTestVehicle = function(entity)
    local vehCoords = GetEntityCoords(entity)
    local vehicle = CreateVehicle(GetEntityModel(entity), vector3(vehCoords.x, vehCoords.y, vehCoords.z), GetEntityHeading(entity), false, false)
    FreezeEntityPosition(vehicle, true)
    SetEntityCollision(vehicle, false, false)
    SetEntityVisible(vehicle, false, false)
    return vehicle
end

DeleteTestVehicle = function(entity)
    SetEntityAsMissionEntity(entity, true, true)
    DeleteEntity(entity)
end

GetVehicleDefaultWheel = function(entity, wheelId, boneName)
    local vehicle = CreateTestVehicle(entity)
    local boneIndex = GetEntityBoneIndexByName(vehicle, boneName)
    local bonePos = GetEntityBonePosition_2(vehicle, boneIndex)
    local boneCoords = GetWorldPositionOfEntityBone(vehicle, boneIndex)
    DeleteTestVehicle(vehicle)
    return {pos = bonePos, coords = boneCoords, boneIdx = boneIndex}
end

IsVehicleOnCarJack = function(netId)
    local callback = nil
    Core.TriggerCallback('mechanicsystem:server:isVehOnCarJack', function(result)
        callback = result
    end, playerMechId, netId)
    while callback == nil do 
        Wait(1)
    end
    return callback
end

GetCarJackAttachPoints = function(entity)
    local numWheels = tostring(GetVehicleNumberOfWheels(entity))

    local entHeading = GetEntityHeading(entity)

    local wheelData = {
        ["0"] = {x = -0.10, y = -0.5, z = 0.0, heading = entHeading + 90.0},
        ["1"] = {x = 0.10, y = -0.5, z = 0.0, heading = entHeading - 90.0},
        ["2"] = {x = -0.10, y = 0.5, z = 0.0, heading = entHeading + 90.0},
        ["3"] = {x = 0.10, y = 0.5, z = 0.0, heading = entHeading - 90.0},
    }

    local points = {}

    for tyreIdx,v in pairs(Lib.VehicleWheels[numWheels]) do
        local index = tostring(v.wheelId)
        local wheel = GetVehicleDefaultWheel(entity, v.wheelId, v.bone)
        local offset = GetObjectOffsetFromCoords(wheel.pos.x, wheel.pos.y, wheel.pos.z, entHeading, wheelData[index].x, wheelData[index].y, wheelData[index].z)
        local groundBool, groundZ = GetGroundZFor_3dCoord(offset.x, offset.y, offset.z, false)
        local pos = vector3(offset.x, offset.y, groundZ)
        points[index] = {label = v.label, bone = v.bone, index = v.index, wheelId = v.wheelId, coords = pos, heading = wheelData[index].heading, marker = {}}
    end

    return points
end

IsNearCarJack = function(entity)
    local carjackCoords = GetEntityCoords(entity)
    local carjackDistance = #(coords - carjackCoords)
    
    if carjackDistance <= Config.CarJack.Target.dist then
        return true
    end

    return false
end

GetCarJack = function(netId)
    local carjack, canUse = nil, false
    Core.TriggerCallback('mechanicsystem:server:getCarJack', function(result)
        if result == nil then 
            carjack = false
        else
            if result.shopId == playerMechId then
                canUse = true
            end
            carjack = result
        end
    end, playerMechId, netId)
    while carjack == nil do 
        Wait(1)
    end
    return carjack, canUse
end

CarJackHandle = function(option, entity, wheelId)
    local pos = GetEntityCoords(entity)
    local rot = GetEntityRotation(entity)

    if option == 'raise' then
        local raiseValue = 0.0
        if wheelId == 1 or wheelId == 3 then 
            raiseValue = rot[2] - 1.0
            if raiseValue <= -Config.CarJack.MaxHeight then
                return Core.Notification({
                    title = '',
                    message = Lang['carjack_max_height'],
                    type = 'inform'
                })
            end
        elseif wheelId == 0 or wheelId == 2 then
            raiseValue = rot[2] + 1.0
            if raiseValue >= Config.CarJack.MaxHeight then
                return Core.Notification({
                    title = '',
                    message = Lang['carjack_max_height'],
                    type = 'inform'
                })
            end
        end
        local setCoords = vector3(pos.x, pos.y, pos.z + 0.01)
        TriggerServerEvent('mechanicsystem:server:carJackHandle', NetworkGetNetworkIdFromEntity(entity), raiseValue, GetEntityHeading(entity), setCoords)
    elseif option == 'lower' then
        local lowerValue = 0.0
        if wheelId == 1 or wheelId == 3 then 
            lowerValue = rot[2] + 1.0
            if lowerValue >= 1.0 then
                return Core.Notification({
                    title = '',
                    message = Lang['carjack_is_lowest'],
                    type = 'inform'
                })
            end
        elseif wheelId == 0 or wheelId == 2 then
            lowerValue = rot[2] - 1.0
            if lowerValue <= -1.0 then
                return Core.Notification({
                    title = '',
                    message = Lang['carjack_is_lowest'],
                    type = 'inform'
                })
            end
        end
        local setCoords = vector3(pos.x, pos.y, pos.z - 0.01)
        TriggerServerEvent('mechanicsystem:server:carJackHandle', NetworkGetNetworkIdFromEntity(entity), lowerValue, GetEntityHeading(entity), setCoords)
    end
end

RegisterNetEvent('mechanicsystem:client:carJackHandle', function(netId, value, heading, pos)
    local vehicle = Lib.NetworkGetEntity(netId)
    SetEntityAsMissionEntity(vehicle)
    SetEntityRotation(vehicle, 0.0, value, heading, 2, true)
    SetEntityCoordsNoOffset(vehicle, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
end)

ShouldEngineDisable = function(meta)
    for k,v in pairs(meta) do
        if v <= 0.0 then
            return true
        end
    end
    return false
end

DegradeAssociatedPart = function(part)
    local parts = GetAssociatedParts(part)
    if next(parts) ~= nil then 
        for k,v in pairs(parts) do
            if curVehicle.health ~= nil and next(curVehicle.health) then
                curVehicle.health[k] = curVehicle.health[k] - Config.Degradation.Associated
                if curVehicle.health[k] <= 0 then
                    curVehicle.health[k] = 0.0
                    parts[k] = nil
                end
            end
        end
    end
end

GetAssociatedParts = function(part)
    local associated_parts = {}
    for partName, partData in pairs(Config.Parts['health']) do
        for k,v in pairs(partData.service) do
            if v == part then
                associated_parts[partName] = part
                break
            end
        end
    end
    return associated_parts
end

GetRandomMalfunctionPart = function(parts)
    local faultyParts = {}
    local i = 1
    for k,v in pairs(parts) do
        if v <= Config.Degradation.Malfunction.worn.health then
            faultyParts[i] = k
            i = i + 1
        end
    end
    if next(faultyParts) ~= nil then
		math.randomseed(GetGameTimer())
        return faultyParts[math.random(#faultyParts)]
    else
        return false
    end
end

GetPartCondition = function(value)
    local callback, cfg = nil, Config.Degradation.Malfunction
    if value <= cfg.failure.health then
        callback = {type = 'failure', label = cfg.failure.label, health = cfg.failure.health, msg = cfg.failure.msg}
    elseif value <= cfg.defect.health then  
        callback = {type = 'defect', label = cfg.defect.label, health = cfg.defect.health, msg = cfg.defect.msg}
    elseif value <= cfg.worn.health then  
        callback = {type = 'worn', label = cfg.worn.label, health = cfg.worn.health, msg = cfg.worn.msg}
    elseif value <= cfg.good.health then 
        callback = {type = 'good', label = cfg.good.label, health = cfg.good.health}
    end
    return callback
end

PlayEffect = {
    ['radiator'] = function(vehicle, condition)
        local curTemp = GetVehicleEngineTemperature(vehicle)
        local engineHealth = GetVehicleEngineHealth(vehicle)
        local effects = {health = 50.0, time = 5000}
        if condition.type == 'defect' then 
            effects = {health = 25.0, time = 10000}
        end
        SetVehicleEngineTemperature(vehicle, 400.0)
        SetVehicleEngineHealth(vehicle, effects.health + 0.0)
        SetVehicleEngineOn(vehicle, false, true)
        Wait(1000)
        SetVehicleEngineOn(vehicle, true, false)
        Wait(effects.time)
        SetVehicleEngineTemperature(vehicle, curTemp)
        SetVehicleEngineHealth(vehicle, engineHealth + 0.0)
    end,
    ['fuel_pump'] = function(vehicle, condition)
        local curFuelLevel = Core.GetVehicleFuelLevel(vehicle)
        local effects = {count = 3, time = 4000}
        if condition.type == 'defect' then 
            effects = {count = 6, time = 5000}
        end
        for i = 1, effects.count do
            SetVehicleFuelLevel(vehicle, 1.0)
            Wait(300)
            SetVehicleEngineOn(vehicle, false, true)
            SetVehicleFuelLevel(vehicle, curFuelLevel)
            Wait(1000)
            SetVehicleEngineOn(vehicle, true, false)
            Wait(effects.time)
        end
        SetVehicleFuelLevel(vehicle, curFuelLevel)
    end,
    ['brakes'] = function(vehicle, condition)
        local curBrakeForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce')
        local effects = {force = 0.2, time = 10000}
        if condition.type == 'defect' then 
            effects = {force = 0.1, time = 25000}
        end
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', effects.force)
        Wait(effects.time)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fBrakeForce', curBrakeForce)
    end,
    ['drive_shaft'] = function(vehicle, condition)
        local fSteeringLock = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock')
        local effects = {steerLock = fSteeringLock * 0.35, time = 10000}
        if condition.type == 'defect' then 
            effects = {steerLock = fSteeringLock * 0.25, time = 25000}
        end
        local calculate = fSteeringLock * 0.25
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', effects.steerLock)
        Wait(effects.time)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSteeringLock', fSteeringLock)
    end,
    ['alternator'] = function(vehicle, condition)
        local effects = {time = 10000}
        if condition.type == 'defect' then 
            effects = {time = 20000}
        end
        isTempEngineDisabled[GetVehicleNumberPlateText(vehicle)] = true
        Wait(effects.time)
        isTempEngineDisabled[GetVehicleNumberPlateText(vehicle)] = false
    end,
    ['clutch'] = function(vehicle, condition)
        local rateScaleUpShift = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleUpShift')
        local rateScaleDownShift = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleDownShift')

        local effects = {rate = 0.1, time = 10000}
        if condition.type == 'defect' then 
            effects = {rate = 0.1, time = 20000}
        end

        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleUpShift', (rateScaleUpShift * effects.rate))
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleDownShift', (rateScaleDownShift * effects.rate))
        
        local scale = GetVehicleSteeringScale(vehicle)
        SetVehicleHandbrake(vehicle, true)
        for i = 1, 200 do
            SetVehicleSteeringScale(vehicle, i)
            Citizen.Wait(1)
        end
        SetVehicleHandbrake(vehicle, false)
        SetVehicleSteeringScale(vehicle, scale)

        Wait(effects.time)

        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleUpShift', rateScaleUpShift)
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleDownShift', rateScaleDownShift)
    end,
}

Citizen.CreateThread(function()
    while true do
        if curVehicle.entity ~= nil then
            if IsVehicleEngineDisabled(curVehicle.plate) then
                if IsVehicleEngineStarting(curVehicle.entity) then 
                    Wait(200)
                    SetVehicleEngineOn(curVehicle.entity, false, false, true)
                end
            else
                Wait(1000)
            end
        else
            Wait(1000)
        end
        Wait(100)
    end
end)

IsVehicleWheelRemoved = function(defaultBonePos, curBonePos)
    local boneDifference = #(defaultBonePos - curBonePos)
    if boneDifference >= 1.0 then
        return true
    else
        return false
    end
end

GetVehicleDoors = function(entity)
    local doors = {}
    local vehicle = CreateTestVehicle(entity)
    for doorId,v in pairs(Lib.VehicleDoors) do
        if GetIsDoorValid(vehicle, v.index) then
            local str = tostring(v.index)
            doors[str] = {
                label = Lib.VehicleDoors[str].label,
                bone = Lib.VehicleDoors[str].bone,
                index = Lib.VehicleDoors[str].index,
                pos = GetEntityBonePosition_2(vehicle, GetEntityBoneIndexByName(vehicle, Lib.VehicleDoors[str].bone)),
            }
            if Lib.VehicleDoors[str].bone2 ~= nil then
                doors[str].bone2 = Lib.VehicleDoors[str].bone2
                doors[str].pos2 = GetEntityBonePosition_2(vehicle, GetEntityBoneIndexByName(vehicle, Lib.VehicleDoors[str].bone2))
            end
        end
    end
    DeleteTestVehicle(vehicle)
    return doors
end

GetVehicleWindows = function(entity)
    local windows = {}
    local vehicle = CreateTestVehicle(entity)
    for k,v in pairs(Lib.VehicleWindows) do
        if IsVehicleWindowIntact(vehicle, v.index) then
            windows[tostring(k)] = {
                index = v.index,
                boneIndex = GetEntityBoneIndexByName(vehicle, v.bone),
                pos = GetEntityBonePosition_2(vehicle, GetEntityBoneIndexByName(vehicle, v.bone)),
                coords = GetEntityBonePosition_2(vehicle, GetEntityBoneIndexByName(vehicle, v.bone)),
                bone = v.bone,
                label = v.label
            }
            if v.index == 6 then
                local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
                windows[tostring(k)].pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (d2.y - 0.5), 0.0)
            elseif v.index == 7 then 
                local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
                windows[tostring(k)].pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (d1.y + 0.5), 0.0)
            end
        end
    end
    DeleteTestVehicle(vehicle)
    return windows
end

GetTravelDistance = function(pos, travelDistance)
	local distance = CalculateTravelDistanceBetweenPoints(coords.x, coords.y, coords.z, pos[1], pos[2], pos[3])
	if distance > travelDistance then
		return true
	else
		return false
	end
end

CreateJobBlip = function(pos, cfg)
    local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
    SetBlipSprite(blip, cfg.Blip.sprite)
    SetBlipColour(blip, cfg.Blip.color)
    AddTextEntry('MYBLIP', cfg.Blip.label)
    BeginTextCommandSetBlipName('MYBLIP')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)
    SetBlipScale(blip, cfg.Blip.scale)
    SetBlipAsShortRange(blip, true)
    SetBlipRoute(blip, cfg.Blip.route.enable)
    SetBlipRouteColour(blip, cfg.Blip.route.color)
    return blip
end

CreateJobVehicle = function(pos)
    local entity = nil
    ClearAreaOfVehicles(pos.x, pos.y, pos.z, 5.0, false, false, false, false, false)

    math.randomseed(GetGameTimer())
    local num = math.random(#Config.RoadSideRepairs.RandomVehicles)
    local model = Config.RoadSideRepairs.RandomVehicles[num]

    Core.SpawnVehicle(model, {x = pos[1], y = pos[2], z = pos[3]}, pos[4], function(vehicle)
        SetEntityCoordsNoOffset(vehicle, pos[1], pos[2], pos[3])
        SetEntityHeading(vehicle, pos[4])
        SetVehicleOnGroundProperly(vehicle)
        entity = vehicle
    end, true)

    while not DoesEntityExist(entity) do
        Wait(1)
    end

    return entity
end

CreateJobPedInVehicle = function(model, vehicle)
    local entity = nil

    Lib.LoadModel(model)

    entity = CreatePedInsideVehicle(vehicle, 1, model, -1, true, true)
    NetworkRegisterEntityAsNetworked(entity)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(entity), true)
    SetPedKeepTask(entity, true)
    SetPedDropsWeaponsWhenDead(entity, false)
    SetEntityInvincible(entity, false)
    SetEntityVisible(entity, true)
    
	while not DoesEntityExist(entity) do
		Wait(10)
	end

    return entity
end

CreateJobPed = function(model, pos, heading, scenario)
    local entity = nil
    local groundBool, groundZ = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z, false)

    SetPedRelationshipGroupHash(player, GetHashKey("PLAYER"))
	AddRelationshipGroup('NPC')

    Lib.LoadModel(model)

    entity = CreatePed(7, GetHashKey(model), pos.x, pos.y, groundZ, heading, 0, true, true)
    NetworkRegisterEntityAsNetworked(entity)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(entity), true)
    SetPedKeepTask(entity, true)
    SetPedDropsWeaponsWhenDead(entity, false)
    SetEntityInvincible(entity, false)
    SetEntityVisible(entity, true)
	TaskStartScenarioInPlace(entity, scenario, 0, false)
	FreezeEntityPosition(entity, true)

	SetPedRelationshipGroupHash(entity, GetHashKey("NPC"))	
	SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("NPC"))
	SetRelationshipBetweenGroups(0, GetHashKey("NPC"), GetHashKey("PLAYER"))
    
	while not DoesEntityExist(entity) do
		Wait(10)
	end

    return entity
end

GetRepairPoint = function(repairType, vehicle)
    if repairType == 'fuel' then
        local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))
        local entHeading = GetEntityHeading(vehicle)
        local wheelData = {x = -0.6, y = 0.0, z = 0.5, heading = entHeading - 90.0}
        for tyreIdx, v in pairs(Lib.VehicleWheels[numWheels]) do
            if tonumber(tyreIdx) == 4 then
                local wheel = GetVehicleDefaultWheel(vehicle, v.wheelId, v.bone)
                local offset = GetObjectOffsetFromCoords(wheel.pos.x, wheel.pos.y, wheel.pos.z, entHeading, wheelData.x, wheelData.y, wheelData.z)
                return {
                    coords = offset,
                    heading = wheelData.heading,
                    textUi = Config.RoadSideRepairs[repairType].textUi
                }
            end
        end
    elseif repairType == 'tire' then
        local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))
        local entHeading = GetEntityHeading(vehicle)
        local randomWheelId = math.random(1,4)

        local wheelData = {
            ["0"] = {x = -0.8, y = 0.0, z = 0.0, heading = entHeading - 90.0},
            ["1"] = {x = 0.8, y = 0.0, z = 0.0, heading = entHeading + 90.0},
            ["2"] = {x = -0.8, y = 0.0, z = 0.0, heading = entHeading - 90.0},
            ["3"] = {x = 0.8, y = 0.0, z = 0.0, heading = entHeading + 90.0},
        }

        for tyreIdx, v in pairs(Lib.VehicleWheels[numWheels]) do
            if randomWheelId == v.wheelId then 
                local wheel = GetVehicleDefaultWheel(vehicle, v.wheelId, v.bone)
                local offset = GetObjectOffsetFromCoords(wheel.pos.x, wheel.pos.y, wheel.pos.z, entHeading, wheelData[tostring(v.wheelId)].x, wheelData[tostring(v.wheelId)].y, wheelData[tostring(v.wheelId)].z)
                return {
                    coords = offset,
                    heading = wheelData[tostring(v.wheelId)].heading,
                    textUi = Config.RoadSideRepairs[repairType].textUi,
                    wheelId = v.wheelId,
                }
            end
        end

    elseif repairType == 'battery' then
        local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
        local entHeading = GetEntityHeading(vehicle)
        return {
            coords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, d2.y + 0.35, 0.0),
            heading = entHeading - 180.0,
            textUi = Config.RoadSideRepairs[repairType].textUi
        }
    end
end

GetVehicleInspectionPoints = function(vehicle)
    local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
    local cfg = Config.BodyRepair.Inspection.anims
    local points = {
        ['front'] = { pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (d2.y + 0.2), 0.0) },
        ['rear'] = { pos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (d1.y - 0.4), 0.0) },
        ['sideL'] = { pos = GetOffsetFromEntityInWorldCoords(vehicle, (d1.x - 0.2), 0.0, 0.0) },
        ['sideR'] = { pos = GetOffsetFromEntityInWorldCoords(vehicle, (d2.x + 0.3), 0.0, 0.0) },
	}
    for k,v in pairs(points) do
        points[k].heading = (GetEntityHeading(vehicle) + cfg[k].heading)
        points[k].anim = {dict = cfg[k].dict, name = cfg[k].name, blendIn = cfg[k].blendIn, blendOut = cfg[k].blendOut, flag = cfg[k].flag}
    end
    return points
end

FetchVehicleBodyReport = function(vehicle)
    local report = {wheels = {}, doors = {}, windows = {}}

    -- Get Wheels:
    local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))
    for tyreIdx,v in pairs(Lib.VehicleWheels[numWheels]) do
        local defaultWheel = GetVehicleDefaultWheel(vehicle, v.wheelId, v.bone)
        local bonePos = GetEntityBonePosition_2(vehicle, GetEntityBoneIndexByName(vehicle, v.bone))
        if IsVehicleWheelRemoved(defaultWheel.pos, bonePos) or IsVehicleTyreBurst(vehicle, v.index, false) or IsVehicleTyreBurst(vehicle, v.index, true) then
            report.wheels[tostring(tyreIdx)] = {wheelId = v.wheelId, index = v.index, label = v.label, bone = v.bone, default = defaultWheel}
        end
    end

    -- Get Doors:
    local carDoors = GetVehicleDoors(vehicle)
    for k,v in pairs(carDoors) do
        if IsVehicleDoorDamaged(vehicle, v.index) then
            report.doors[tostring(k)] = carDoors[k]
        end
    end

    -- Get Windows:
    local carWindows = GetVehicleWindows(vehicle)
    for k,v in pairs(carWindows) do
        if not IsVehicleWindowIntact(vehicle, v.index) then
            report.windows[tostring(v.index)] = {label = v.label, index = v.index, bone = v.bone, boneIndex = v.boneIndex, pos = v.pos, coords = v.coords}
        end
    end

    -- Others:
    report.cache = {
        engine = GetVehicleEngineHealth(vehicle),
        body = GetVehicleBodyHealth(vehicle),
        entity = vehicle,
        plate = Lib.Trim(GetVehicleNumberPlateText(vehicle))
    }

    return report
end

HasBodyRepairsToDo = function(damageReport)
    if next(damageReport) then
        for k,v in pairs(damageReport) do
            if k ~= 'cache' then
                if next(v) then
                    return true
                end
            end
        end
    end
    return false
end

SetVehicleBodyDamage = function(vehicle, damageReport)
    Citizen.CreateThreadNow(function()
        SetVehicleFixed(vehicle)
        ResetVehicleWheels(vehicle, true)
        SetVehicleAutoRepairDisabled(vehicle,true)
        for type, parts in pairs(damageReport) do
            if next(parts) then 
                if type == 'windows' then 
                    for k,v in pairs(parts) do
                        RemoveVehicleWindow(vehicle, v.index)
                    end
                elseif type == 'doors' then
                    for k,v in pairs(parts) do
                        SetVehicleDoorBroken(vehicle, v.index, true)
                    end
                elseif type == 'wheels' then
                    for k,v in pairs(parts) do
                        if Config.BodyRepair.WheelsDropIssue then 
                            SetVehicleTyreBurst(vehicle, v.index, true, 1000.0)
                        else
                            local leaveDebrisTrail, deleteWheel, unknownFlag, putOnFire, networkFlag = false, true, true, false, true
                            BreakOffVehicleWheel(vehicle, v.wheelId, leaveDebrisTrail, deleteWheel, unknownFlag, putOnFire, networkFlag)
                        end
                    end
                end
            end
        end
        SetVehicleEngineHealth(vehicle, damageReport.cache.engine + 0.0)
        SetVehicleBodyHealth(vehicle, damageReport.cache.body + 0.0)
    end)
end

SetVehicleBodyFixed = function(vehicle)
    local currentEngine = GetVehicleEngineHealth(vehicle)
    local cfg = Config.BodyRepair.SetFixed
    SetVehicleBodyHealth(vehicle, cfg.bodyHealth + 0.0)
    SetVehicleFixed(vehicle)
    if cfg.engineHealth ~= nil then
        SetVehicleEngineHealth(vehicle, cfg.engineHealth)
    else
        SetVehicleEngineHealth(vehicle, currentEngine + 0.0)
    end
    
    local isOnCarJack = IsVehicleOnCarJack(NetworkGetNetworkIdFromEntity(vehicle))
    if not isOnCarJack then
        FreezeEntityPosition(vehicle, false)
    end
end

RemovePlateFromReports = function(plate)
    if body_report[plate] ~= nil then
        body_report[plate] = nil
    end
end

CanInstallBodypart = function(entity)
    local vehCoords = GetEntityCoords(entity)
    local vehDistance = #(coords - vehCoords)
    
    if vehDistance <= Config.BodyRepair.Install.target.distance then
        return true
    end

    return false
end

GetVehicleClosestDoor = function(vehicle, maxDist, damagedDoors)
    local vehicleDoors = GetVehicleDoors(vehicle)
    local closestDoor = {}
    local lastDist = nil
    for k,v in pairs(damagedDoors) do
        if v.index ~= 4 and v.index ~= 5 then
            local distance = #(coords - vehicleDoors[tostring(v.index)].pos)
            local distance2 = #(coords - vehicleDoors[tostring(v.index)].pos2)
            if (distance < maxDist or distance2 < maxDist * 1.85) and (lastDist == nil or distance < lastDist) then
                lastDist = distance
                closestDoor = vehicleDoors[tostring(v.index)]
            end
        end
    end
    return closestDoor
end

GetVehicleClosestHood = function(vehicle)
    local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
    local hoodCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (d2.y + 0.2), 0.0)
    local hoodDistance = #(coords - hoodCoords)

    if hoodDistance < 1.5 then 
        return true
    end

    return false
end

GetVehicleClosestTrunk = function(vehicle)
    local d1,d2 = GetModelDimensions(GetEntityModel(vehicle))
    local trunkCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, d1.y, 0.0)
    local trunkDistance = #(coords - trunkCoords)

    if trunkDistance < 1.5 then 
        return true
    end

    return false
end

GetVehicleClosestWindow = function(vehicle, maxDist, damagedWindows)
    local vehicleWindows = GetVehicleWindows(vehicle)
    local closestWindow = {}
    local lastDist = nil
    for k,v in pairs(damagedWindows) do
        local maxDistance = maxDist
        if v.index == 6 or v.index == 7 then
            maxDistance = (maxDist * 1.8)
        end
        local distance = #(coords - vehicleWindows[tostring(k)].pos)
        if distance < maxDistance and (lastDist == nil or distance < lastDist) then
            lastDist = distance
            closestWindow = vehicleWindows[tostring(k)]
        end
    end
    return closestWindow
end

GetVehicleClosestWheel = function(vehicle, maxDist, damagedWheels)
    local closestWheel = {}
    
    local numWheels = tostring(GetVehicleNumberOfWheels(vehicle))
    for tyreIdx,v in pairs(Lib.VehicleWheels[numWheels]) do
        if damagedWheels[tostring(tyreIdx)] ~= nil then
            local defaultWheel = GetVehicleDefaultWheel(vehicle, v.wheelId, v.bone)
            local distance = #(coords - defaultWheel.pos)
            if distance < maxDist then
                maxDist = distance
                closestWheel = Lib.VehicleWheels[numWheels][tyreIdx]
            end
        end
    end

    return closestWheel
end

GetClosestBodyPart = function(vehicle, partName, damageReport)
    if partName == 'door' then 
        local door = GetVehicleClosestDoor(vehicle, 2.0, damageReport.doors)
        if next(door) then
            return 'door', door
        end
    elseif partName == 'hood' then
        if GetVehicleClosestHood(vehicle) then
            return 'hood'
        end
    elseif partName == 'trunk' then
        if GetVehicleClosestTrunk(vehicle) then
            return 'trunk'
        end
    elseif partName == 'window' then 
        local window = GetVehicleClosestWindow(vehicle, 2.0, damageReport.windows)
        if next(window) then
            return 'window', window
        end
    elseif partName == 'wheel' then
        local wheel = GetVehicleClosestWheel(vehicle, 2.0, damageReport.wheels)
        if next(wheel) then
            return 'wheel', wheel
        end
    end
    return false
end

TryInstallBodyPart = function(entity, partName, partData, partReport, partInfo)
    local heading = nil

    if partName == 'wheel' then
		TaskTurnPedToFaceCoord(player, partReport[tostring(partInfo.index)].default.coords.x, partReport[tostring(partInfo.index)].default.coords.y, partReport[tostring(partInfo.index)].default.coords.z, 0)
    elseif partName == 'window' then 
		TaskTurnPedToFaceCoord(player, partReport[tostring(partInfo.index)].coords.x, partReport[tostring(partInfo.index)].coords.y, partReport[tostring(partInfo.index)].coords.z, 0)
    elseif partName == 'door' then
        TaskTurnPedToFaceCoord(player, partReport[tostring(partInfo.index)].pos.x, partReport[tostring(partInfo.index)].pos.y, partReport[tostring(partInfo.index)].pos.z, 0)
    elseif partName == 'hood' then 
        heading = GetEntityHeading(entity) - 180.0
    elseif partName == 'trunk' then 
        heading = GetEntityHeading(entity)
    end

    if heading ~= nil then
        SetEntityHeading(player, heading)
    else
        Wait(1000)
    end

    if partData.anim ~= nil then
        if partName ~= 'window' then
            Lib.LoadAnim(partData.anim.dict)
            TaskPlayAnim(player, partData.anim.dict, partData.anim.name, partData.anim.blendIn, partData.anim.blendOut, partData.anim.duration, partData.anim.flags, 0, 0, 0, 0)
            Wait(500)
        end
    end
    local success = false
    if Config.BodyRepair.Install.skillcheck.enable == true then
        success = lib.skillCheck(Config.BodyRepair.Install.skillcheck.difficulty, Config.BodyRepair.Install.skillcheck.inputs)
    else
        success = true 
    end
    if success then
        if partName == 'window' then
            Lib.LoadAnim(partData.anim.dict)
            TaskPlayAnim(player, partData.anim.dict, partData.anim.name, partData.anim.blendIn, partData.anim.blendOut, partData.anim.duration, partData.anim.flags, 0, 0, 0, 0)
            Wait(500)
        end
        PlayUpgradeSound()
        return true
    else
        ClearPedTasks(player)
        local anim = Config.BodyRepair.Anim
        Lib.LoadAnim(anim.dict)
        TaskPlayAnim(player, anim.dict, anim.name, anim.blendIn, anim.blendOut, anim.duration, anim.flags, 0, 0, 0, 0)
        return false
    end
end

PropEmoteAnimation = function(type)
    local anim = Config.Emotes.Anim[type]
    Lib.LoadAnim(anim.dict)
	TaskPlayAnim(player, anim.dict, anim.name, anim.blendIn, anim.blendOut, anim.duration, anim.flags, 0, 0, 0, 0)
end

IsVehicleTowTruck = function(entity)
	for k,v in pairs(Config.FlatbedTowing.Trucks) do
		if GetHashKey(k) == GetEntityModel(entity) then
			return true
		end
	end
	return false
end

VehicleIsBlacklisted = function(entity)
	for k,v in pairs(Config.FlatbedTowing.Blacklisted) do
		if GetHashKey(k) == GetEntityModel(entity) then
			return true
		end
	end
	return false
end

-- Config.Mechanics
zone, boxzones = {}, {}
--- Create BoxZone
---@param id number
---@param x number
---@param y number
---@param z number
local function CreateBoxZone(id, x, y, z)
    boxzones["boxzone_" .. id] = {}
    boxzones["boxzone_" .. id].zone = BoxZone:Create(vector2(x, y), 5, 5, { minZ = z - 2, maxZ = z + 2, name = "boxzone_" .. id, debugPoly = false, heading = 20.0})
    boxzones["boxzone_" .. id].zonecombo = ComboZone:Create({boxzones["boxzone_" .. id].zone}, {name = "boxzone", debugPoly = false})
    boxzones["boxzone_" .. id].zonecombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            for k, v in pairs(Config.Mechanics) do
                if v.job == dusa.playerData.job.name then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId())
                    if vehicle ~= 0 then
                        zone[id] = true
                        dusa.textUI(Config.Translations[Config.Locale].etomechanic)
                    end
                end
            end
        else
            zone[id] = false
            dusa.hideUI()
        end
    end)
end

local function CreateBossZone(id, x, y, z)
    boxzones["boxzone_boss" .. id] = {}
    boxzones["boxzone_boss" .. id].zone = BoxZone:Create(vector2(x, y), 3, 3, { minZ = z, maxZ = z + 4, name = "boxzone_boss" .. id, debugPoly = false, heading = 20.0})
    boxzones["boxzone_boss" .. id].zonecombo = ComboZone:Create({boxzones["boxzone_boss" .. id].zone}, {name = "boxzone", debugPoly = false})
    boxzones["boxzone_boss" .. id].zonecombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            for k, v in pairs(Config.Mechanics) do
                if v.job == dusa.playerData.job.name then
                    zone["boss"..id] = true
                    dusa.textUI(Config.Translations[Config.Locale].etoboss)
                end
            end
        else
            zone["boss"..id] = false
            dusa.hideUI()
        end
    end)
end

local function CreateTowZone(id, x, y, z)
    boxzones["boxzone_flatbed" .. id] = {}
    boxzones["boxzone_flatbed" .. id].zone = BoxZone:Create(vector2(x, y), 10, 10, { minZ = z, maxZ = z + 4, name = "boxzone_flatbed" .. id, debugPoly = false, heading = 20.0})
    boxzones["boxzone_flatbed" .. id].zonecombo = ComboZone:Create({boxzones["boxzone_flatbed" .. id].zone}, {name = "boxzone", debugPoly = false})
    boxzones["boxzone_flatbed" .. id].zonecombo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            for k, v in pairs(Config.Mechanics) do
                if v.job == dusa.playerData.job.name then
                    zone["flatbed"..id] = true
                    local vehicle = GetVehiclePedIsIn(PlayerPedId())
                    if vehicle == 0 then
                        dusa.textUI(Config.Translations[Config.Locale].etotakeflatbed)
                    else
                        dusa.textUI(Config.Translations[Config.Locale].etoreturnflatbed)
                    end
                end
            end
        else
            zone["flatbed"..id] = false
            dusa.hideUI()
        end
    end)
end

local function OpenBoss(id)
    local playername = GetPlayerName(PlayerId())
    local rank = dusa.playerData.job.grade
    if dusa.framework == 'qb' then rank = dusa.playerData.job.grade.level playername = dusa.playerData.charinfo.firstname.." "..dusa.playerData.charinfo.lastname end
    if id == tonumber(dusa.playerMechanic.m_id) then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'boss',
            mechanic = dusa.playerMechanic,
            ranks = dusa.playerMechanic.ranks,
            closestPlayers = GetNeareastPlayers(),
            profile = {name = playername, rank = rank},
            translate = Config.Translations[Config.Locale]
        })
    end
end

CreateThread(function()
    for k, v in pairs(Config.Mechanics) do
        CreateBossZone(k, v.bossMenu.x, v.bossMenu.y, v.bossMenu.z)
        CreateTowZone(k, v.flatbed.coords.x, v.flatbed.coords.y, v.flatbed.coords.z)
        for zones, coords in pairs(Config.Mechanics[k].modify) do
            CreateBoxZone(k, coords.x, coords.y, coords.z)
        end
    end
end)

function TakeFlatbed(id)
    if id == tonumber(dusa.playerMechanic.m_id) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local vehicleModel = GetEntityModel(vehicle)
        local vehicleName = GetDisplayNameFromVehicleModel(vehicleModel)
        if vehicle == 0 then
            RequestModel(Config.Mechanics[id].flatbed.model)
            while not HasModelLoaded(Config.Mechanics[id].flatbed.model) do
                Citizen.Wait(10)
            end
            local spawnedVehicle = CreateVehicle(Config.Mechanics[id].flatbed.model, Config.Mechanics[id].flatbed.coords.x, Config.Mechanics[id].flatbed.coords.y, Config.Mechanics[id].flatbed.coords.z, Config.Mechanics[id].flatbed.heading, true, false)
            SetVehicleDirtLevel(spawnedVehicle, 0) -- ##GameCanPlay To stop vehicles from spawning in dirty 
            SetVehicleOnGroundProperly(spawnedVehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), spawnedVehicle, -1)
            SetVehicleNeedsToBeHotwired(spawnedVehicle, false)
            SetVehicleHasBeenOwnedByPlayer(spawnedVehicle, true)
            vehicle = spawnedVehicle
            SetNetworkIdExistsOnAllMachines(id, true)
            SetNetworkIdCanMigrate(id, true)
            SetModelAsNoLongerNeeded(Config.Mechanics[id].flatbed.model)
            dusa.integrateKey(vehicle, GetVehicleNumberPlateText(vehicle))
        else
            if string.lower(vehicleName) == Config.Mechanics[id].flatbed.model then
                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
            end
        end
    end
end

RegisterCommand("mechanic:interact", function()
    for i=1, 50, 1 do
        if zone[i] then
            OpenMechanic()
            dusa.hideUI()
        elseif zone["boss"..i] then
            OpenBoss(i)
            dusa.hideUI()
        elseif zone["flatbed"..i] then
            TakeFlatbed(i)
            dusa.hideUI()
        elseif zone["lift"..i] then
            InteractCarLift()
            dusa.hideUI()
        elseif zone["craft"..i] then
            InteractCraft()
            dusa.hideUI()
        end
    end
end)
RegisterKeyMapping('mechanic:interact', 'Interact', 'keyboard', "E")
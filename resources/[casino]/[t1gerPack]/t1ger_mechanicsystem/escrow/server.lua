InitializeResource = function()
    GetMechanicShops()
    if mech_shops and next(mech_shops) then
        for id, shop in pairs(mech_shops) do
            if next(shop.markers) then
                if shop.markers['storage'] ~= nil and next(shop.markers['storage']) then
                    local storage = shop.markers['storage'].storage
                    Core.RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner)
                end
            end
            -- Create QB Jobs:
            if Framework == 'QB' then
                local callback = Core.CreateJob(shop.job)
            end
            -- Spawn Lifts:
            SpawnCustomLifts(shop)
        end
    end

    TriggerClientEvent('mechanicsystem:client:updateShops', -1, mech_shops)
    TriggerClientEvent('mechanicsystem:client:createShopBlips', -1, mech_shops)

    Citizen.Wait(1000)
	RconPrint('T1GER Mechanic System Initialized\n')

    for id, data in pairs(Cfg.VehicleMeta.Props) do
        if id == 'mileage' then
            Core.VehicleMeta.SyncProperties(id, 0.0)
        else
            Core.VehicleMeta.SyncProperties(id, Config.Parts[id])
        end
    end
    
    Core.VehicleMeta.RegisterAll()
end

GetMechanicShops = function()
    local done = false
    MySQL.Async.fetchAll('SELECT * FROM '..database_table..'', {}, function(results)
        if results and next(results) then
            for i = 1, #results do
                mech_shops[results[i].id] = {
                    id = results[i].id,
                    name = results[i].name,
                    account = results[i].account,
                    boss = results[i].boss,
                    employees = json.decode(results[i].employees),
                    storage = json.decode(results[i].storage),
                    job = json.decode(results[i].job),
                    blip = json.decode(results[i].blip),
                    markers = json.decode(results[i].markers),
                    billing = json.decode(results[i].billing),
                    lifts = json.decode(results[i].lifts),
                    disabled = results[i].disabled
                }
            end
            done = true
        else
            done = true
        end
    end)

    while not done do 
        Citizen.Wait(100)
    end
end

SetupVehicleMetadata = function()
    local tb = {mileage = 0, health = {}, service = {}}

    for type, data in pairs(Config.Parts) do
        for key, part in ipairs(data) do
            local value = part.health or part.mileage
            tb[type][part.type] = Lib.RoundNumber(value, 2)
        end
    end

    local table = 'owned_vehicles'
    if Framework == 'QB' then
        table = 'player_vehicles'
    end

    MySQL.query('ALTER TABLE '..table..' ADD COLUMN IF NOT EXISTS t1ger_metadata LONGTEXT NOT NULL DEFAULT ?', {json.encode(tb)})
end

RegisterServerEvent('mechanicsystem:server:deleteEntity')
AddEventHandler('mechanicsystem:server:deleteEntity', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    DeleteEntity(entity)
    TriggerClientEvent('mechanicsystem:client:deleteEntity', -1, netId)
end)

SpawnCustomLifts = function(shop)
    if next(shop.lifts) then
        local cancel = false
        for i = 1, #shop.lifts do 
            for k,v in pairs(shop.lifts[i]) do 
                if cancel then break end
                local coords = type(v.coords) == "vector3" and v.coords or vector3(v.coords.x, v.coords.y, v.coords.z)
                local obj = CreateObject(v.model, coords, true, true)
                local attempts = 0
                while not DoesEntityExist(obj) and attempts < 50 do
                    Wait(1)
                    attempts = attempts + 1
                end
                if attempts >= 50 then 
                    cancel = true
                end
                SetEntityHeading(obj, v.heading)
                v.netId = NetworkGetNetworkIdFromEntity(obj)
            end
            if not cancel then
                mech_shops[shop.id].lifts_spawned = true
            end
        end
    end
end

CreateCustomLift = function(shopId, lift)
    for k,v in pairs(lift) do
        local coords = type(v.coords) == "vector3" and v.coords or vector3(v.coords.x, v.coords.y, v.coords.z)
        local obj = CreateObject(v.model, coords, true, true)
        local attempts = 0
        while not DoesEntityExist(obj) and attempts < 50 do
            Wait(1)
            attempts = attempts + 1
        end
        SetEntityHeading(obj, v.heading)
        v.netId = NetworkGetNetworkIdFromEntity(obj)
    end
end

ResetCustomLifts = function()
    for num,shop in pairs(mech_shops) do
        if next(shop.lifts) ~= nil then
            for id, lift in pairs(shop.lifts) do
                for model, data in pairs(lift) do
                    TriggerEvent('mechanicsystem:server:deleteEntity', data.netId)
                end
            end 
        end
    end
end

Core.RegisterCallback('mechanicsystem:createCarJackObject', function(src, cb, model, coords, heading)
    local coords = vector3(coords.x, coords.y, coords.z)
    local obj = CreateObject(model, coords, true, true)
    local attempts = 0
    while not DoesEntityExist(obj) and attempts < 50 do
        Wait(1)
        attempts = attempts + 1
    end
    SetEntityHeading(obj, heading)
    local netId = NetworkGetNetworkIdFromEntity(obj)
    cb(netId)
end)

Core.RegisterCallback('mechanicsystem:createBodyPartProp', function(src, cb, model, coords, heading)
    local coords = vector3(coords.x, coords.y, coords.z)
    local obj = CreateObject(model, coords, true, true)
    local attempts = 0
    while not DoesEntityExist(obj) and attempts < 50 do
        Wait(1)
        attempts = attempts + 1
    end
    SetEntityHeading(obj, heading)
    local netId = NetworkGetNetworkIdFromEntity(obj)
    cb(netId)
end)

Core.RegisterCallback('mechanicsystem:server:isVehOnCarJack', function(src, cb, shopId, vehNet)
    local callback = false
    if carjack[shopId] ~= nil and next(carjack[shopId]) then
        for k,v in pairs(carjack[shopId]) do
            if v.vehNet == vehNet then
                callback = true
                break
            end
        end
    end
    cb(callback)
end)

RegisterServerEvent('mechanicsystem:server:addCarJack')
AddEventHandler('mechanicsystem:server:addCarJack', function(shopId, objNet, vehNet, point)
    if carjack[shopId] == nil then
        carjack[shopId] = {}
    end
    carjack[shopId][objNet] = {shopId = shopId, objNet = objNet, vehNet = vehNet, wheelId = point.wheelId}
    TriggerClientEvent('mechanicsystem:client:addCarJack', -1, objNet, vehNet, point)
end)

Core.RegisterCallback('mechanicsystem:server:getCarJack', function(src, cb, shopId, objNet)
    if carjack[shopId] ~= nil and next(carjack[shopId]) then
        if carjack[shopId][objNet] ~= nil and next(carjack[shopId][objNet]) then 
            cb(carjack[shopId][objNet])
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

RegisterServerEvent('mechanicsystem:server:carJackHandle')
AddEventHandler('mechanicsystem:server:carJackHandle', function(netId, value, heading, coords)
    TriggerClientEvent('mechanicsystem:client:carJackHandle', -1, netId, value, heading, coords)
end)

RegisterServerEvent('mechanicsystem:server:removeCarJack')
AddEventHandler('mechanicsystem:server:removeCarJack', function(shopId, objNet)
    TriggerEvent('mechanicsystem:server:deleteEntity', objNet)
    local src = Core.Player.GetSource(source)
    Core.Player.AddItem(src, Config.Items['kits'][4].name, 1)
    TriggerClientEvent('mechanicsystem:client:removeCarJack', -1, objNet, carjack[shopId][objNet].vehNet)
    carjack[shopId][objNet] = nil
end)
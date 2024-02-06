Core = {

    Police = {Count = 0, Players = {}},

    Parts = {},

    Vehicles = {},

    RegisterCallback = function(name, cb)
        if ESX ~= nil then 
            ESX.RegisterServerCallback(name, cb)
        elseif QBCore ~= nil then
            QBCore.Functions.CreateCallback(name, cb)
        end
    end,
    
    UseableItem = function(item, cb)
        if ESX ~= nil then
            ESX.RegisterUsableItem(item, function(source)
                cb(source, item)
            end)
        elseif QBCore ~= nil then
            QBCore.Functions.CreateUseableItem(item, function(source, item)
                cb(source, item)
            end)
        end
    end,
    
    CreateStash = function(id, label, slots, weight, owner)
        if Config.Inventory == 'default' then
            -- do nothing or add whatever u want
        elseif Config.Inventory == 'ox-inventory' then
            Core.RegisterStash(id, label, slots, weight, owner)
        elseif Config.Inventory == 'mf-inventory' then
            exports["mf-inventory"]:createInventory(id, 'inventory', "housing", "house_storage", (weight/1.0), slots, {})
        end
    end,

    RegisterStash = function(id, label, slots, weight, owner)
        if Config.Inventory == 'default' then
            -- do nothing or add whatever u want
        elseif Config.Inventory == 'ox-inventory' then
            exports['ox_inventory']:RegisterStash(id, label, slots, weight, owner)
        end
    end,
    
    Notification = function(src, data)
        if Config.UseFrameworkNotification then 
            if ESX ~= nil then
                TriggerClientEvent('esx:showNotification', src, data.message)
            elseif QBCore ~= nil then
                TriggerClientEvent('QBCore:Notify', src, data.message)
            end
        else
            TriggerClientEvent('t1ger_lib:utils:notification', src, data)
        end
    end,

    GetOnlinePlayers = function()
        local players = {}
        if ESX ~= nil then
            local xPlayers = ESX.GetExtendedPlayers()
            for _, xPlayer in pairs(xPlayers) do
                table.insert(players, {
                    source = Core.Player.GetSource(xPlayer.source),
                    identifier = Core.Player.GetIdentifier(xPlayer.source),
                    name = Core.Player.GetName(xPlayer.source),
                    job = Core.Player.GetPlayerJob(xPlayer.source)
                })
            end
        elseif QBCore ~= nil then
            local xPlayers = QBCore.Functions.GetQBPlayers()
            for _, xPlayer in pairs(xPlayers) do
                table.insert(players, {
                    source = Core.Player.GetSource(xPlayer.PlayerData.source),
                    identifier = Core.Player.GetIdentifier(xPlayer.PlayerData.source),
                    name = Core.Player.GetName(xPlayer.PlayerData.source),
                    job = Core.Player.GetPlayerJob(xPlayer.PlayerData.source)
                })
            end
        end
        return players
    end,

    GetPoliceCount = function()
        return Core.Police.Count
    end,

    GetPolicePlayers = function()
        return Core.Police.Players
    end,

    CreateJob = function(tb)
        if ESX ~= nil then
            if not ESX.DoesJobExist(tb.name, 0) then
                ESX.CreateJob(tb)
                return true
            else
                if tb.offduty == true then
                    if not ESX.DoesJobExist('off'..tb.name, 0) then
                        ESX.CreateJob(tb)
                        return true
                    else
                        return ESX.Jobs[tb.name]
                    end
                else
                    return ESX.Jobs[tb.name]
                end
            end
        elseif QBCore ~= nil then
            if QBCore.Shared.Jobs[tb.name] then
                if Config.Debug then
                    print(tb.name.." job already added to QBCore.Shared.Jobs")
                end
                return QBCore.Shared.Jobs[tb.name]
            else
                local job_table = {label = tb.label, type = (tb.type or nil), defaultDuty = tb.defaultDuty or true, offDutyPay = tb.offDutyPay or false, grades = {}}
                for k,v in pairs(tb.grades) do
                    job_table.grades[tostring(v.grade)] = {name = v.label, payment = v.salary, isboss = (v.isboss or nil)}
                end
                exports[Config.Triggers['QB'].resource]:AddJob(tb.name, job_table)
                return true
            end
        end
    end,

    DeleteJob = function(name)
        if ESX ~= nil then
            if ESX.DoesJobExist(name, 0) then
                ESX.DeleteJob(name)
            end
        elseif QBCore ~= nil then
            if QBCore.Shared.Jobs[name] then
                QBCore.Shared.Jobs[name] = nil
            end
        end
    end,

    CreateSharedAccount = function(society, amount)
        if ESX ~= nil then
            exports['esx_addonaccount']:AddSharedAccount(society, amount)
        elseif QBCore ~= nil then
            exports[Config.Triggers['QB'].resource]:CreateManagement(society.name)
        end
    end,

    CreateSharedInventory = function(society)
        if ESX ~= nil then
            if GetResourceState('ox_inventory') == 'missing' then
                exports['esx_addoninventory']:AddSharedInventory(society)
            end
        elseif QBCore ~= nil then
        end
    end,

    GetPlayerVehicles = function()
        local result = MySQL.query.await('SELECT * from '..Player_Vehicles_DB.table)
        return result
    end,

    GetVehicleByPlate = function(plate)
        local vehicle, callback = false, 'plate: ['..plate..'] not found in database'

        local result = MySQL.query.await('SELECT * from '..Player_Vehicles_DB.table..' WHERE plate = ? OR plate = ?', {plate, Lib.Trim(plate)})
        if result[1] then
            vehicle = result[1]
            callback = 'plate: ['..plate..'] found in database'
        end
        
        return vehicle, callback
    end,

    CallbackVehicleByPlate = function(plate, cb)
        MySQL.query('SELECT * from '..Player_Vehicles_DB.table..' WHERE plate = ? OR plate = ?', {plate, Lib.Trim(plate)}, function(result)
            cb(result[1])
        end)
    end,

    ImpoundVehicle = function(src, plate, props)
        local plySource = Core.Player.GetSource(src)
        local db_ = Player_Vehicles_DB

        if ESX ~= nil then
            MySQL.Async.execute('UPDATE '..db_.table..' SET '..db_.stored..' = @stored, '..db_.props..' = @props, pound = @impound WHERE plate = @plate', {
                ['@plate'] = plate,
                ['@stored'] = 2,
                ['@props'] = json.encode(props),
                ['@impound'] = 'LosSantos'
            })
        elseif QBCore ~= nil then
            MySQL.Async.execute('UPDATE '..db_.table..' SET '..db_.stored..' = @stored, '..db_.props..' = @props WHERE plate = @plate', {
                ['@plate'] = plate,
                ['@stored'] = 2,
                ['@props'] = json.encode(props)
            })
        end

        print("impounded: ", plate, props.plate)
    end,
}

-- Player Functions:

Core.Player = {

    IsAdmin = function(src)
        local permissions = Config.AcePermissions
        for k,v in pairs(permissions) do
            if IsPlayerAceAllowed(src, v) then
                return true
            end
        end
        return false
    end,

    GetFromId = function(src)
        if ESX ~= nil then
            return ESX.GetPlayerFromId(src)
        elseif QBCore ~= nil then
            return QBCore.Functions.GetPlayer(src)
        end
    end,

    GetFromIdentifier = function(identifier)
        if ESX ~= nil then
            return ESX.GetPlayerFromIdentifier(identifier)
        elseif QBCore ~= nil then
            return QBCore.Functions.GetPlayerByCitizenId(identifier)
        end
    end,

    GetSource = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        while xPlayer == nil do
            Wait(500)
            xPlayer = Core.Player.GetFromId(tonumber(src))
        end
        if ESX ~= nil then
            return xPlayer.source
        elseif QBCore ~= nil then
            return xPlayer.PlayerData.source
        end
    end,

    GetSrcFromIdentifier = function(identifier)
        local xPlayer = Core.Player.GetFromIdentifier(identifier)
        if ESX ~= nil then
            return xPlayer ~= nil and xPlayer.source or nil
        elseif QBCore ~= nil then
            return xPlayer ~= nil and xPlayer.PlayerData.source or nil
        end
    end,

    GetIdentifier = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            return xPlayer.identifier
        elseif QBCore ~= nil then
            return xPlayer.PlayerData.citizenid
        end
    end,
    
    GetName = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            return xPlayer.getName()
        elseif QBCore ~= nil then
            return xPlayer.PlayerData.name
        end
    end,

    GetFullName = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            return xPlayer.getName()
        elseif QBCore ~= nil then
            return xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
        end
    end,

    GetInventory = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        local items, inv = {}, {}
    
        if ESX ~= nil then
            items = xPlayer.getInventory()
        elseif QBCore ~= nil then
            items = xPlayer.PlayerData.items
        end
    
        for k,v in pairs(items) do
            if (v.amount and v.amount > 0) or (v.count and v.count > 0) then
                table.insert(inv, {
                    name  = v.name, 
                    label = v.label,
                    count = (v.amount or v.count),
                    info  = (v.info or v.metadata or false),
                })
            end
        end
    
        return inv
    end,
        
    AddItem = function(src, item, amount)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)
        if ESX ~= nil then
            xPlayer.addInventoryItem(item, amount)
        elseif QBCore ~= nil then
            xPlayer.Functions.AddItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(item)], "add")
        end
    end,

    RemoveItem = function(src, item, amount)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)
        if ESX ~= nil then
            xPlayer.removeInventoryItem(item, amount)
        elseif QBCore ~= nil then
            xPlayer.Functions.RemoveItem(item, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[tostring(item)], "remove")
        end
    end,

    HasItem = function(src, item, amount)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        local inv = Core.Player.GetInventory(src)
        for k,v in pairs(inv) do
            if v.name == item then
                if v.count >= amount then
                    return true, v.count
                else
                    return false, v.count
                end
            end
        end
        return false, 0
    end,

    GetItem = function(src, item)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            local invItem = xPlayer.getInventoryItem(item)
            if invItem == nil then
                error('item: '..item..' does not exists in your database, please add it.')
                return nil
            else
                return {name = invItem.name, label = invItem.label, count = invItem.count}
            end
        elseif QBCore ~= nil then
            local findItem = QBCore.Shared.Items[item]
            if findItem == nil then
                error('item: '..item..' does not exists in your shared/items.lua, please add it.') 
                return nil
            else
                local invItem = xPlayer.Functions.GetItemByName(item)
                if invItem ~= nil then
                    return {name = invItem.name, label = invItem.label, count = invItem.amount}
                else
                    return nil
                end
            end
        end
    end,
    
    AddMoney = function(src, amount, account)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            if account == nil then
                xPlayer.addMoney(tonumber(amount))
            else
                xPlayer.addAccountMoney(account, tonumber(amount))
            end
        elseif QBCore ~= nil then
            if account == nil then
                xPlayer.Functions.AddMoney("cash", tonumber(amount))
            else
                xPlayer.Functions.AddMoney(tostring(account), tonumber(amount))
            end 
        end
    end,
    
    RemoveMoney = function(src, amount, account)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            if account == nil then
                xPlayer.removeMoney(tonumber(amount))
            else
                xPlayer.removeAccountMoney(account, tonumber(amount))
            end
        elseif QBCore ~= nil then
            if account == nil then
                xPlayer.Functions.RemoveMoney("cash", tonumber(amount))
            else
                xPlayer.Functions.RemoveMoney(tostring(account), tonumber(amount))
            end 
        end
    end,
    
    GetMoney = function(src, account)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            if account == nil then
                return xPlayer.getMoney()
            else
                return xPlayer.getAccount(account).money
            end
        elseif QBCore ~= nil then
            if account == nil then
                return xPlayer.Functions.GetMoney("cash")
            else
                return xPlayer.Functions.GetMoney(account)
            end
        end
    end,
    
    GetPlayerJob = function(src)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if not xPlayer then
            return {}
        end
        local job = {}
        if ESX ~= nil then
            job.name = xPlayer.job.name or xPlayer.getJob().name
            job.grade = xPlayer.job.grade or xPlayer.getJob().grade_name
        elseif QBCore ~= nil then
            job.name = xPlayer.PlayerData.job.name
            job.grade = xPlayer.PlayerData.job.grade.level
        end
        return job
    end,

    SetPlayerJob = function(src, job, grade)
        local xPlayer = Core.Player.GetFromId(tonumber(src))
        if ESX ~= nil then
            if ESX.DoesJobExist(job, grade) then
                xPlayer.setJob(job, grade)
            else
                error('[SetPlayerJob] invalid job and/or grade')
            end
        elseif QBCore ~= nil then
            if not QBCore.Shared.Jobs[job] or QBCore.Shared.Jobs[job] == nil then
                error('SetPlayerJob invalid job and/or grade')
            else
                xPlayer.Functions.SetJob(job, grade)
            end
        end
    end,

    GetAllVehicles = function(src)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)
        local vehicles, fetched = {}, false

        if not xPlayer then
            fetched = true
        end

        local SQL = 'SELECT * FROM '..Player_Vehicles_DB.table..' WHERE '..Player_Vehicles_DB.owner..' = @identifier'

        MySQL.Async.fetchAll(SQL, {['@identifier'] = Core.Player.GetIdentifier(src)}, function(results)
            if results and next(results) then
                for i = 1, #results do

                    vehicles[i] = {
                        plate = results[i].plate,
                        type = results[i].type or nil,
                        job = results[i].job or nil,
                        stored = results[i].stored or results[i].state or nil,
                        garage = results[i].garage or results[i].parking or nil,
                        impound = results[i].impound or results[i].pound or nil,
                        fuel = results[i].fuel or nil,
                        engine = results[i].engine or nil,
                        body = results[i].body or nil,
                        health = results[i].health or nil,
                        model = results[i].model or results[i].hash or nil,
                    }

                    if ESX ~= nil then
                        vehicles[i].props = results[i].vehicle
                    elseif QBCore ~= nil then
                        vehicles[i].props = results[i].mods
                    end

                    if Config.Garage == 't1ger-garage' then
                        vehicles[i].fuel = results[i].fuel
                        vehicles[i].seized = results[i].seized
                    end

                    if Config.Garage == 'cd-garage' then
                        vehicles[i].stored = results[i].in_garage
                        vehicles[i].garage = results[i].garage_id
                        vehicles[i].garage_type = results[i].garage_type
                        vehicles[i].job = results[i].job_personalowned
                        vehicles[i].property = results[i].property
                        vehicles[i].impound_data = results[i].impound_data
                        vehicles[i].stats = results[i].adv_stats
                    end

                end
                fetched = true
            else
                fetched = true
            end
        end)

        while not fetched do 
            Wait(100)
        end

        return vehicles

    end,

    UpdateOwnedVehicle = function(src, stored, garage, props)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)

        local db_ = Player_Vehicles_DB
        local SQL = 'UPDATE '..db_.table..' SET '..db_.stored..' = @stored, '..db_.props..' = @props, '..db_.garage..' = @garage WHERE plate = @plate AND '..db_.owner..' = @identifier'

        if stored == false then
            garage = nil
        end

        MySQL.Async.execute(SQL, {
            ['@identifier'] = Core.Player.GetIdentifier(src),
            ['@plate'] = props.plate,
            ['@stored'] = stored,
            ['@garage'] = garage,
            ['@props'] = json.encode(props)
        })

        if Config.Debug == true then 
            if stored == true or stored == 1 then
                print("vehicle stored")
            else
                print("vehicle spawned")
            end
        end
    end,

    PlusPoliceCount = function(src)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)
    
        if Core.Police.Players[src] == nil then
            Core.Police.Count = (Core.Police.Count + 1)
        end
        Core.Police.Players[src] = {identifier = Core.Player.GetIdentifier(src), source = src}
        TriggerClientEvent('t1ger_lib:client:updatePolice', -1, Core.Police.Count, Core.Police.Players)

        if Config.Debug == true then 
            print("PlusPoliceCount | Police Count: ", Core.Police.Count)
        end
    end,
    
    MinusPoliceCount = function(src)
        local src = Core.Player.GetSource(src)
        local xPlayer = Core.Player.GetFromId(src)
    
        if Core.Police.Players[src] ~= nil then
            Core.Police.Count = (Core.Police.Count - 1)
        end
        Core.Police.Players[src] = nil
        TriggerClientEvent('t1ger_lib:client:updatePolice', -1, Core.Police.Count, Core.Police.Players)

        if Config.Debug == true then 
            print("MinusPoliceCount | Police Count: ", Core.Police.Count)
        end
    end,

}

-- Registered Callbacks:

Core.RegisterCallback('t1ger_lib:hasItem', function(src, cb, item, amount, playerSrc)
    local src = Core.Player.GetSource(src)
    if playerSrc ~= nil then
        src = Core.Player.GetSource(playerSrc)
    end
    cb(Core.Player.HasItem(src, item, amount))
end)

Core.RegisterCallback('t1ger_lib:getMoney', function(src, cb, account)
    local src = Core.Player.GetSource(src)
    cb(Core.Player.GetMoney(src, account))
end)

Core.RegisterCallback('t1ger_lib:getOnlinePlayers', function(src, cb)
    cb(Core.GetOnlinePlayers())
end)

Core.RegisterCallback('t1ger_lib:getFullName', function(src, cb, targetId)
    local playerSrc = Core.Player.GetSource(targetId)
    cb(Core.Player.GetFullName(playerSrc))
end)

Core.RegisterCallback('t1ger_lib:getPlayerVehicles', function(src, cb)
    local src = Core.Player.GetSource(src)
    local vehicles = Core.Player.GetAllVehicles(src)
    cb(vehicles)
end)

Core.RegisterCallback('t1ger_lib:getPlayerInventory', function(src, cb)
    local src = Core.Player.GetSource(src)
    cb(Core.Player.GetInventory(src))
end)

Core.RegisterCallback('t1ger_lib:getVehicleByplate', function(src, cb, plate)
    local src = Core.Player.GetSource(src)
    cb(Core.GetVehicleByPlate(plate))
end)

-- Events

RegisterServerEvent('t1ger_lib:server:addItem')
AddEventHandler('t1ger_lib:server:addItem', function(item, amount, src)
    local playerSrc = source
    if src ~= nil then 
        playerSrc = src
    end
    Core.Player.AddItem(playerSrc, item, amount)
end)

RegisterServerEvent('t1ger_lib:server:removeItem')
AddEventHandler('t1ger_lib:server:removeItem', function(item, amount, src)
    local playerSrc = source
    if src ~= nil then 
        playerSrc = src
    end
    Core.Player.RemoveItem(playerSrc, item, amount)
end)

RegisterServerEvent('t1ger_lib:server:policeNotification')
AddEventHandler('t1ger_lib:server:policeNotification', function(coords, streetName, data)
    local police = Core.GetPolicePlayers()
    for id,player in pairs(police) do
        local src = Core.Player.GetSource(player.source)
        TriggerClientEvent('t1ger_lib:utils:policeNotification', src, coords, streetName, data)
    end
end)

RegisterServerEvent('t1ger_lib:server:srcNotification')
AddEventHandler('t1ger_lib:server:srcNotification', function(data, playerSrc)
    local src = Core.Player.GetSource(playerSrc)
    Core.Notification(src, data)
end)

RegisterServerEvent('t1ger_lib:server:updateOwnedVehicle')
AddEventHandler('t1ger_lib:server:updateOwnedVehicle', function(stored, garage, props)
    local src = Core.Player.GetSource(source)
    Core.Player.UpdateOwnedVehicle(src, stored, garage, props)
end)

RegisterServerEvent('t1ger_lib:server:impoundVehicle')
AddEventHandler('t1ger_lib:server:impoundVehicle', function(plate, props)
    local src = source
    Core.ImpoundVehicle(src, plate, props)
end)

RegisterServerEvent('t1ger_lib:server:playerLoaded')
AddEventHandler('t1ger_lib:server:playerLoaded', function()
    local src = Core.Player.GetSource(source)
    local job = Core.Player.GetPlayerJob(src)
    local isPolice = Config.PoliceJobs[job.name] or false

    if isPolice then
        Core.Player.PlusPoliceCount(src)
    end
end)

AddEventHandler('playerDropped', function()
    local src = Core.Player.GetSource(source)
    local xPlayer = Core.Player.GetFromId(src)
    if not xPlayer then
        return
    end
    local job = Core.Player.GetPlayerJob(src)
    local isPolice = Config.PoliceJobs[job.name] or false

    if isPolice then
        Core.Player.MinusPoliceCount(src)
    end
end)

RegisterServerEvent('t1ger_lib:server:setJob')
AddEventHandler('t1ger_lib:server:setJob', function(newJob)
    local src = Core.Player.GetSource(source)
    local job = Core.Player.GetPlayerJob(src)
    local isPolice = Config.PoliceJobs[newJob.name] or false

    if Core.Police.Players[src] == nil then
        if isPolice then 
            Core.Player.PlusPoliceCount(src)
        else
            Core.Player.MinusPoliceCount(src)
        end
    else
        if isPolice then
            Core.Player.PlusPoliceCount(src)
        else
            Core.Player.MinusPoliceCount(src)
        end
    end
end)

RegisterServerEvent('t1ger_lib:server:setJobOnIdentifier')
AddEventHandler('t1ger_lib:server:setJobOnIdentifier', function(job, grade, identifier)
    local src = Core.Player.GetSrcFromIdentifier(identifier)
    Core.Player.SetPlayerJob(src, job, grade)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    local players = Core.GetOnlinePlayers()
    for k,v in pairs(players) do
        local isPolice = Config.PoliceJobs[v.job.name] or false
        if isPolice then
            Core.Player.PlusPoliceCount(v.source)
        end
    end
    Core.Vehicles = CreateCoreVehicles()
end)

Core.VehicleMeta = {

    Props = {},
    Cache = {},

	SyncProperties = function(type, data)
        if Config.VehicleMeta.Props[type] == nil then
            error("props must be defined in t1ger_lib/config.lua - this is not defined: ["..type.."]")
        else
            Core.VehicleMeta.Props[type] = data
        end
	end,

    IsRegistered = function(str)
        local plate = Lib.Trim(str)
        if Core.VehicleMeta.Cache[plate] ~= nil then
            return true 
        else
            return false
        end
    end,

    CheckTypes = function(metadata)
        if metadata == nil then
            metadata = {}
        end
        for k,v in pairs(Core.VehicleMeta.Props) do
            if metadata[k] == nil then
                if Lib.Type(v) == 'table' then
                    metadata[k] = {}
                    for partName, partData in pairs(v) do
                        local value = partData.health or partData.mileage
                        metadata[k][partName] = Lib.RoundNumber(value, 2)
                    end
                else
                    metadata[k] = Lib.RoundNumber(v, 2)
                end
            end
        end
        return metadata
    end,

    ValidateProps = function(type, data, plate)
        if Core.VehicleMeta.Props[type] == nil then
            return nil
            --error("prop ["..type.."] not defined in t1ger_lib/config.lua (from plate: "..plate..")")
        else
            if Lib.Type(data) == 'table' then
                for k,v in pairs(Core.VehicleMeta.Props[type]) do
                    if data[k] == nil then
                        data[k] = v.health or v.mileage
                    end
                end
            else
                if data == nil then
                    data = Core.VehicleMeta.Props[type]
                end
            end
            return data
        end
        return nil
    end,

    RegisterAll = function()
        local vehicles = Core.GetPlayerVehicles()
        if type(vehicles) == 'table' and next(vehicles) ~= nil then 
            for i = 1, #vehicles do
                Core.VehicleMeta.RegisterPlate(vehicles[i].plate)
            end
            RconPrint('T1GER Library - REGISTERED ALL VEHICLE PLATES IN CORE.VEHICLEMETA\n')
            Core.VehicleMeta.SaveAll()
        end
    end,

    RegisterPlate = function(str)
        local vehicle, callback = Core.GetVehicleByPlate(str)
        if vehicle and next(vehicle) ~= nil then
            local plate = Lib.Trim(str)
            Core.VehicleMeta.Cache[plate] = {}
            local metadata = Core.VehicleMeta.CheckTypes(json.decode(vehicle.t1ger_metadata))
            for type, data in pairs(metadata) do
                local validation = Core.VehicleMeta.ValidateProps(type, data, str)
                if validation ~= nil then
                    data = validation
                    Core.VehicleMeta.Cache[plate][type] = validation
                else
                    Core.VehicleMeta.Cache[plate][type] = data
                end
            end
            return Core.VehicleMeta.Cache[plate]
        else
            if Config.Debug then
                print("Core.VehicleMeta.RegisterPlate | no vehicle found by plate: "..str)
            end
            return false
        end
    end,

    Create = function(str)
        local plate = Lib.Trim(str)
        Core.VehicleMeta.Cache[plate] = {}
        local metadata = Core.VehicleMeta.CheckTypes()
        for type, data in pairs(metadata) do
            local validation = Core.VehicleMeta.ValidateProps(type, data, str)
            if validation ~= nil then
                data = validation
                Core.VehicleMeta.Cache[plate][type] = validation
            else
                Core.VehicleMeta.Cache[plate][type] = data
            end
        end
        Core.VehicleMeta.Update(str, Core.VehicleMeta.Cache[plate])
        return Core.VehicleMeta.Cache[plate]
    end,

    Fetch = function(plate)
        if not Core.VehicleMeta.IsRegistered(plate) then
            return Core.VehicleMeta.RegisterPlate(plate)
        else
            return Core.VehicleMeta.Cache[Lib.Trim(plate)]
        end
    end,

    Update = function(plate, metadata)
        for k,v in pairs(metadata) do
            Core.VehicleMeta.Fetch(plate)[k] = v
        end
        MySQL.query('UPDATE '..Player_Vehicles_DB.table..' SET t1ger_metadata = ? WHERE plate = ? or plate = ?', {json.encode(Core.VehicleMeta.Cache[Lib.Trim(plate)]), plate, Lib.Trim(plate)})
    end,

    SavePlayerVehicles = function(src)
        local vehicles = Core.Player.GetAllVehicles(src)
        local parameters = {}
        for i = 1, #vehicles do
            local metadata = Core.VehicleMeta.Cache[Lib.Trim(vehicles[i].plate)]
            if metadata ~= nil and next(metadata) then
                parameters[#parameters+1] = {json.encode(metadata), vehicles[i].plate}
            end
        end
        if #parameters > 0 then
            MySQL.prepare('UPDATE '..Player_Vehicles_DB.table..' SET t1ger_metadata = ? WHERE plate = ?', parameters)
            if Config.Debug then
                RconPrint('T1GER Library - SAVED ALL PLAYER VEHICLE META\n')
            end
        end
    end,

    SaveAll = function()
        if Core.VehicleMeta.Cache ~= nil and next(Core.VehicleMeta.Cache) then
            local parameters = {}
            for k,v in pairs(Core.VehicleMeta.Cache) do
                if v ~= nil and next(v) ~= nil then
                    parameters[#parameters+1] = {json.encode(v), k}
                end
            end
            if #parameters > 0 then
                MySQL.prepare('UPDATE '..Player_Vehicles_DB.table..' SET t1ger_metadata = ? WHERE plate = ?', parameters)
                if Config.Debug then
                    RconPrint('T1GER Library - SAVED ALL VEHICLE META\n')
                end
            end
        end
    end,
}

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        CreateThread(function()
            Wait(50000)
            Core.VehicleMeta.SaveAll()
        end)
    end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
    Core.VehicleMeta.SaveAll()
end)

AddEventHandler('playerDropped', function(reason)
    local src = Core.Player.GetSource(source)
    local identifier = Core.Player.GetIdentifier(src)
    Core.VehicleMeta.SavePlayerVehicles(src)
end)

Core.RegisterCallback('t1ger_lib:vehiclemeta:fetch', function(src, cb, plate)
    local src = Core.Player.GetSource(src)
    cb(Core.VehicleMeta.Fetch(plate))
end)

RegisterServerEvent('t1ger_lib:vehiclemeta:update')
AddEventHandler('t1ger_lib:vehiclemeta:update', function(plate, metadata)
    Core.VehicleMeta.Update(plate, metadata)
end)

if Framework == 'QB' then
    RegisterNetEvent(Config.Triggers[Framework].uObjSV, function()
        if source ~= '' then return false end
        QBCore = exports[Config.Triggers[Framework].resource]:GetCoreObject()
    end)
end

CreateCoreVehicles = function()
    local results = {}
    if Framework == 'ESX' then
        results = MySQL.query.await('SELECT model, price FROM vehicles')
    elseif Framework == 'QB' then
        results = QBCore.Shared.Vehicles
    end

    local vehicles = {}
    if next(results) then 
        for k,v in pairs(results) do 
            local hash = joaat(v.model)
            vehicles[tostring(hash)] = {
                model = v.model,
                price = v.price,
                hash = hash
            }
        end
    end

    return vehicles 
end

Core.RegisterCallback('t1ger_lib:getCoreVehicles', function(src, cb)
    cb(Core.Vehicles)
end)

function CreateVehicleMeta(plate, src)
    local metadata = Core.VehicleMeta.Create(plate)
    if src ~= nil then 
        src = Core.Player.GetSource(src)
        TriggerClientEvent('t1ger_lib:vehiclemeta:create', src, plate, metadata)
    end 
end
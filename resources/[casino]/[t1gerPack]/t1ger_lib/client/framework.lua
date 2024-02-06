Core = {

    PlayerData = {},
    PlayerJob = {},
    Police = {Count = 0, Players = {}},

    Vehicles = {},
    
    FrameworkReady = function()
        if Framework == 'ESX' then
            while not ESX do Wait(500); end 
            while ESX.GetPlayerData().job == nil do
                Citizen.Wait(500)
            end
            Core.PlayerData = Core.GetPlayerData()
            return true
        elseif Framework == 'QB' then
            while not QBCore do Wait(500); end
            while not QBCore.Functions.GetPlayerData().job do Wait(500); end
            Core.PlayerData = Core.GetPlayerData()
            return true
        end
        return true
    end,

    TriggerCallback = function(name, cb, ...)
        if ESX ~= nil then
            ESX.TriggerServerCallback(name, cb, ...)
        elseif QBCore ~= nil then
            QBCore.Functions.TriggerCallback(name, cb, ...)
        end
    end,
    
    Notification = function(data)
        if Config.UseFrameworkNotification then
            if ESX ~= nil then
                ESX.ShowNotification(data.message, false, true, nil)
            elseif QBCore ~= nil then
                QBCore.Functions.Notify(data.message)
            end
        else
            Lib.Notification(data)
        end
    end,
    
    GetPlayerData = function()
        if Framework == 'ESX' then
            Core.PlayerData = ESX.GetPlayerData()
            Core.SetPlayerJob()
            return ESX.GetPlayerData()
        elseif Framework == 'QB' then
            Core.PlayerData = QBCore.Functions.GetPlayerData()
            Core.SetPlayerJob()
            return QBCore.Functions.GetPlayerData()
        end
    end,

    GetFullName = function(src)
        local fullName, done = nil, false
        Core.TriggerCallback('t1ger_lib:getFullName', function(name)
            fullName = name
            done = true
        end, src)
        while not done do
            Wait(1)
        end
        return fullName
    end,
    
    SetPlayerJob = function()
        local table = {}
        while not Core.PlayerData.job do 
            Wait(200)
        end
        if Framework == 'ESX' then
            table.name = Core.PlayerData.job.name
            table.label = Core.PlayerData.job.label
            table.grade = Core.PlayerData.job.grade
            table.gradeLabel = Core.PlayerData.job.grade_label
            table.isPolice = Config.PoliceJobs[Core.PlayerData.job.name] or false
            if Config.Debug then
                print("Job Updated: ", table.name, table.label, table.isPolice, table.grade, table.gradeLabel)
            end
        elseif Framework == 'QB' then
            table.name  = Core.PlayerData.job.name
            table.label = Core.PlayerData.job.label
            table.grade  = Core.PlayerData.job.grade.level
            table.onDuty  = Core.PlayerData.job.onduty or nil
            table.isPolice = Config.PoliceJobs[Core.PlayerData.job.name] or false
            if Config.Debug then
                print("Job Updated: ", table.name, table.label, table.onDuty, table.isPolice, table.grade)
            end
        end
        Core.PlayerJob = table
        TriggerEvent('t1ger_lib:onJobUpdate', Core.PlayerJob)
    end,

    GetJob = function()
        return Core.PlayerJob
    end,

    ToggleDuty = function()
        if Framework == 'QB' then
            TriggerServerEvent(Config.Triggers['QB'].dutyToggle)
        end
    end,

    HasItem = function(item, amount, cb)
        Core.TriggerCallback('t1ger_lib:hasItem', function(result)
            cb(result)
        end, item, amount)
    end,

    GetPlayerMoney = function(cb, account)
        Core.TriggerCallback('t1ger_lib:getMoney', function(money)
            cb(money)
        end, account or nil)
    end,

    OpenStash = function(id, label, slots, weight, owner)
        if Config.Inventory == 'default' then
            if ESX ~= nil then
                -- no default stash
                if Config.Debug == true then
                    print('stash for default esx_addoninventory is not supported.')
                end
            elseif QBCore ~= nil then
                TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
                    maxweight = weight,
                    slots = slots
                })
                TriggerEvent('inventory:client:SetCurrentStash', id)
            end
        elseif Config.Inventory == 'ox-inventory' then
            exports.ox_inventory:openInventory('stash', {id = id})
        elseif Config.Inventory == 'mf-inventory' then
            exports['mf-inventory']:openOtherInventory(id)
        elseif Config.Inventory == 'qs-inventory' then
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
                maxweight = weight,
                slots = slots
            })
            TriggerEvent('inventory:client:SetCurrentStash', id)
        end
    end,

	SpawnVehicle = function(model, coords, heading, cb, networked)
        if ESX ~= nil then
            ESX.Game.SpawnVehicle(model, coords, heading, cb, networked)
        elseif QBCore ~= nil then
            QBCore.Functions.SpawnVehicle(model, cb, coords, networked)
        end
	end,

    DeleteVehicle = function(vehicle)
        if ESX ~= nil then
            ESX.Game.DeleteVehicle(vehicle)
        elseif QBCore ~= nil then
            QBCore.Functions.DeleteVehicle(vehicle)
        end
    end,

    SetVehicleProperties = function(vehicle, props)
        if ESX ~= nil then
            ESX.Game.SetVehicleProperties(vehicle, props)
        elseif QBCore ~= nil then
            QBCore.Functions.SetVehicleProperties(vehicle, props)
        end
    end,

    GetVehicleProperties = function(vehicle)
        if ESX ~= nil then
            return ESX.Game.GetVehicleProperties(vehicle)
        elseif QBCore ~= nil then
            return QBCore.Functions.GetVehicleProperties(vehicle)
        end
    end,

    GetVehicleFuelLevel = function(vehicle)
        return GetVehicleFuelLevel(vehicle)
    end,

    ImpoundVehicle = function(vehicle, plate)
        local props = Core.GetVehicleProperties(vehicle)
        if Config.Garage == 'default' then
            TriggerServerEvent('t1ger_lib:server:impoundVehicle', plate, props)
        elseif Config.Garage == 't1ger-garage' then
			exports['t1ger_garage']:SetVehicleImpounded(vehicle, false)
        elseif Config.Garage == 'cd-garage' then
			print('insert your impound event/function in here, to update state of the vehicle')
            -- put cd garage impound function here
        end
        Core.DeleteVehicle(vehicle)
    end,

    GetPoliceCount = function()
        return Core.Police.Count
    end,

    GetPolicePlayers = function()
        return Core.Police.Players
    end,

    GetVehicles = function(model, cb)
        local vehicle = nil

        if Core.Vehicles[tostring(model)] == nil or next(Core.Vehicles[tostring(model)]) == nil then
            Core.TriggerCallback('t1ger_lib:getCoreVehicles', function(result)
                Core.Vehicles = result
                if Core.Vehicles[tostring(model)] ~= nil and next(Core.Vehicles[tostring(model)]) then
                    vehicle = Core.Vehicles[tostring(model)]
                else
                    vehicle = false
                end
            end)
        else
            vehicle = Core.Vehicles[tostring(model)]
        end

        while vehicle == nil do
            Wait(1)
        end

        cb(vehicle)
    end,
}

RegisterNetEvent(Config.Triggers[Framework].load)
AddEventHandler(Config.Triggers[Framework].load, function(xPlayer)
    Core.PlayerData = Core.GetPlayerData()
    Core.SetPlayerJob()
    if Core.GetJob().isPolice == true then
        TriggerServerEvent('t1ger_lib:server:playerLoaded')
    end
end)

RegisterNetEvent(Config.Triggers[Framework].job)
AddEventHandler(Config.Triggers[Framework].job, function(job)
    Core.PlayerData.job = job
    Core.SetPlayerJob()
    TriggerServerEvent('t1ger_lib:server:setJob', job)
end)

if Framework == 'QB' then
    RegisterNetEvent(Config.Triggers[Framework].uObjCL, function()
        QBCore = exports[Config.Triggers[Framework].resource]:GetCoreObject()
    end)
end

RegisterNetEvent('t1ger_lib:client:updatePolice')
AddEventHandler('t1ger_lib:client:updatePolice', function(count, players)
    Core.Police.Count = count
    Core.Police.Players = players
end)

Core.VehicleMeta = {
    Fetch = function(plate)
        local metadata = nil
        Core.TriggerCallback('t1ger_lib:vehiclemeta:fetch', function(result)
            metadata = result
        end, plate)
        while metadata == nil do
            Wait(1)
        end
        return metadata
    end,

    Update = function(plate, metadata)
        TriggerServerEvent('t1ger_lib:vehiclemeta:update', plate, metadata)
    end,
}


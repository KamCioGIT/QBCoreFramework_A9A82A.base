if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
dusa = {}
dusa.framework, dusa.playerLoaded, dusa.playerData, dusa.inventory, dusa.playerMechanic = 'qb', nil, {}, 'qb', {}

AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
    if value then
        dusa.playerData = QBCore.Functions.GetPlayerData()
    else
        table.wipe(dusa.playerData)
    end
    dusa.playerLoaded = value
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then return end
    dusa.playerData = QBCore.Functions.GetPlayerData()
    TriggerServerEvent('dusa_mechanic:sv:reload')
    TriggerServerEvent("dusa_carlift:server:onjoin")
    ClearAllElevatorAreas()
    Wait(2000)
    CheckPlayerMechanic()
    dusa.serverCallback('dusa_mechanic:cb:getAllMechanics', function(all)
        for k, v in pairs(all) do
            SetBlips(v)
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    dusa.playerData = QBCore.Functions.GetPlayerData()
    dusa.playerLoaded = true
    TriggerServerEvent('dusa_mechanic:sv:reload')
    TriggerServerEvent("dusa_carlift:server:onjoin")
    ClearAllElevatorAreas()
    CheckPlayerMechanic()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    dusa.playerData.job = job
    CheckPlayerMechanic()
end)

---@diagnostic disable: duplicate-set-field

function dusa.showNotification(text, type)
	SendNUIMessage({
        action = 'notification',
        type = type,
        text = text,
        translate = Config.Translations[Config.Locale]
    })
end

RegisterNetEvent('dusa_mechanic:cl:notify', function(text, type)
    dusa.showNotification(text, type)
end)

function dusa.serverCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb,  ...)
end

function dusa.getClosestPlayer()
	return QBCore.Functions.GetClosestPlayer()
end

function dusa.getClosestObject(coords)
	return QBCore.Functions.GetClosestObject(coords)
end

function dusa.getClosestVehicle(coords)
    return QBCore.Functions.GetClosestVehicle(coords)
end

function dusa.getPlayersInArea(coords, dist)
    return QBCore.Functions.GetPlayersFromCoords(coords, dist)
end

function dusa.textUI(label)
    return exports['qb-core']:DrawText(label, 'right')
end

function dusa.keyPressed()
    return exports['qb-core']:KeyPressed()
end

function dusa.hideUI()
    return exports['qb-core']:HideText()
end

function dusa.isPlayerDead()
    dusa.playerData = QBCore.Functions.GetPlayerData()
    return dusa.playerData.metadata.isdead
end

function dusa.progressBar(name, label, duration, disMovement, disCarMovement, disMouse, disCombat, doneFunc)
    QBCore.Functions.Progressbar(name, label, duration, false, true, {
        disableMovement = disMovement,
        disableCarMovement = disCarMovement,
        disableMouse = disMouse,
        disableCombat = disCombat,
    }, {}, {}, {}, doneFunc)
end

function dusa.integrateKey(vehicle, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehiclehandler), flatbed)
    --
end

dusa.HashString = function(str)
    local format = string.format
    local upper = string.upper
    local gsub = string.gsub
    local hash = joaat(str)
    local input_map = format("~INPUT_%s~", upper(format("%x", hash)))
    input_map = gsub(input_map, "FFFFFFFF", "")

    return input_map
end

function dusa.registerInput(command_name, label, input_group, key, on_press, on_release)
    RegisterCommand(on_release ~= nil and "+" .. command_name or command_name, on_press)
    dusa.Input[command_name] = on_release ~= nil and dusa.HashString("+" .. command_name) dusa.HashString(command_name)
    if on_release then
        RegisterCommand("-" .. command_name, on_release)
    end
    RegisterKeyMapping(on_release ~= nil and "+" .. command_name or command_name, label, input_group, key)
end
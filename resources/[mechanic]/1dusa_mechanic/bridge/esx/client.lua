if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
dusa = {}
dusa.framework, dusa.playerLoaded, dusa.playerData, dusa.inventory, dusa.playerMechanic = 'esx', nil, {}, 'default', {}
local isDead

RegisterNetEvent('esx:playerLoaded', function(xPlayer, isNew, skin)
	while not ESX.IsPlayerLoaded() do
        Wait(100)
    end
	dusa.playerData = xPlayer
    dusa.playerLoaded = true
    TriggerServerEvent('dusa_mechanic:sv:reload')
    Wait(500)
    TriggerServerEvent("dusa_carlift:server:onjoin")
    ClearAllElevatorAreas()
    CheckPlayerMechanic()
end)

AddEventHandler('esx:onPlayerSpawn', function()
    isDead = nil
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	dusa.playerData.job = response
    CheckPlayerMechanic()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not ESX.PlayerLoaded then return end
    dusa.playerData = ESX.GetPlayerData()
    dusa.playerLoaded = true
    TriggerServerEvent('dusa_mechanic:sv:reload')
    TriggerServerEvent("dusa_carlift:server:onjoin")
    ClearAllElevatorAreas()
    Wait(2000)
    CheckPlayerMechanic()
    dusa.serverCallback('dusa_mechanic:cb:getAllMechanics', function(all)
        for k, v in pairs(all) do
            TriggerServerEvent('dusa_mechanic:sv:syncBlips', v)
        end
    end)
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
    ESX.TriggerServerCallback(name, cb,  ...)
end

function dusa.getClosestPlayer()
	return ESX.Game.GetClosestPlayer()
end

function dusa.getClosestObject(coords)
	return ESX.Game.GetClosestObject(coords)
end

function dusa.getClosestVehicle(coords)
	return ESX.Game.GetClosestVehicle(coords)
end

function dusa.getPlayersInArea(coords, dist)
    return ESX.Game.GetPlayersInArea(coords, dist)
end

function dusa.textUI(label)
    return lib.showTextUI(label)
end

function dusa.hideUI()
    return lib.hideTextUI()
end

function dusa.isPlayerDead()
    return isDead
end

function dusa.registerInput(command_name, label, input_group, key, on_press, on_release)
    return ESX.RegisterInput(command_name, label, input_group, key, on_press, on_release)
end

function dusa.integrateKey(vehicle, plate)
    --
end

function dusa.progressBar(name, label, duration, disMovement, disCarMovement, disMouse, disCombat, doneFunc)
    if lib.progressCircle({
        duration = duration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = disCarMovement,
        },
        anim = {},
        prop = {},
    }) then 
        doneFunc()
    end
end
if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
dusa = {}
dusa.framework, dusa.playerLoaded, dusa.playerData = 'esx', nil, {}
local isDead

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    dusa.playerData = xPlayer
    dusa.playerLoaded = true
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not ESX.PlayerLoaded then return end
    dusa.playerData = ESX.GetPlayerData()
    dusa.playerLoaded = true
end)

---@diagnostic disable: duplicate-set-field

function dusa.getClosestVehicle()
    ESX.Game.GetClosestVehicle()
end

function dusa.showNotification(msg, _type)
    ESX.ShowNotification(msg)
end

function dusa.serverCallback(name, cb, ...)
    ESX.TriggerServerCallback(name, cb,  ...)
end
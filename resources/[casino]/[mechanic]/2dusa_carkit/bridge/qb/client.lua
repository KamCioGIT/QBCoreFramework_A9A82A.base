if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
dusa = {}
dusa.framework, dusa.playerLoaded, dusa.playerData = 'qb', nil, {}

AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
    if value then
        dusa.playerData = QBCore.Functions.GetPlayerData()
        TriggerEvent('dusa:playerLoaded', dusa.playerData)
    else
        table.wipe(dusa.playerData)
    end
    dusa.playerLoaded = value
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then return end
    dusa.playerData = QBCore.Functions.GetPlayerData()
    dusa.playerLoaded = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    dusa.playerLoaded = true
end)

---@diagnostic disable: duplicate-set-field

function dusa.getClosestVehicle()
    return QBCore.Functions.GetClosestVehicle()
end

function dusa.showNotification(msg, type)
    QBCore.Functions.Notify(msg, type)
end

function dusa.serverCallback(name, cb, ...)
    QBCore.Functions.TriggerCallback(name, cb,  ...)
end
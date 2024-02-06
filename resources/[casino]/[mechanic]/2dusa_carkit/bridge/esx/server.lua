if GetResourceState('es_extended') ~= 'started' then return end
ESX = exports['es_extended']:getSharedObject()
dusa = {}
dusa.framework = 'esx'

---@diagnostic disable: duplicate-set-field

function dusa.getPlayer(source)
    return ESX.GetPlayerFromId(source)
end

function dusa.registerCallback(name, cb)
    ESX.RegisterServerCallback(name, cb)
end

function dusa.addItem(source, item, count, slot, metadata)
    local player = dusa.getPlayer(source)
    return player.addInventoryItem(item, count, metadata, slot)
end

function dusa.removeItem(source, item, count, slot, metadata)
    local player = dusa.getPlayer(source)
    player.removeInventoryItem(item, count, metadata, slot)
end

function dusa.registerUsableItem(item, cb)
    ESX.RegisterUsableItem(item, cb)
end
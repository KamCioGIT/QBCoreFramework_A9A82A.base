if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
dusa = {}
dusa.framework = 'qb'

---@diagnostic disable: duplicate-set-field

function dusa.getPlayer(source)
    return QBCore.Functions.GetPlayer(source)
end

function dusa.registerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function dusa.addItem(source, item, count, slot, metadata)
    local player = dusa.getPlayer(source)
    if not player then return end
    local giveItem = player.Functions.AddItem(item, count, slot, metadata)
    item = player.Functions.GetItemByName(item)
    if item?.count then item.count = count elseif item?.amount then item.amount = count end
    TriggerClientEvent('inventory:client:ItemBox', source,  item, 'add')
    return giveItem
end

function dusa.removeItem(source, item, count, slot, metadata)
    local player = dusa.getPlayer(source)
    player.Functions.RemoveItem(item, count, slot, metadata)
end

function dusa.registerUsableItem(item, cb)
    QBCore.Functions.CreateUseableItem(item, cb)
end
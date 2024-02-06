if GetResourceState('qb-core') ~= 'started' then return end
QBCore = exports['qb-core']:GetCoreObject()
dusa = {}
dusa.framework = 'qb'
dusa.inventory = 'qb'
dusa.mechanic = {}
dusa.AllMechanics = {}
dusa.AllVehicles = {}

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
end)
  

---@diagnostic disable: duplicate-set-field

function dusa.getPlayer(source)
    return QBCore.Functions.GetPlayer(source)
end

function dusa.getName(player)
    if not player then return false end
    return player.PlayerData.charinfo.firstname.. " "..player.PlayerData.charinfo.lastname
end

function dusa.registerCallback(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

function dusa.getIdentifier(source)
    local player = dusa.getPlayer(source)
    return player.PlayerData.citizenid
end

function dusa.getPlayerFromIdentifier(identifier)
    local player = QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not player then return false end
    return player
end

function dusa.playerSrc(player)
    local source = player.PlayerData.source
    if not source then return false end
    return source
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

function dusa.getItem(source, item)
    local player = dusa.getPlayer(source)
    if not player then return end
    item = player.Functions.GetItemByName(item)
    if item?.count then item.count = item.count elseif item?.amount then item.amount = item.amount end
    return item
end

function dusa.removeItem(source, item, count, slot, metadata)
    local player = dusa.getPlayer(source)
    player.Functions.RemoveItem(item, count, slot, metadata)
end

function dusa.registerUsableItem(item, cb)
    QBCore.Functions.CreateUseableItem(item, cb)
end

function dusa.addMoney(source, type, amount)
    if type == 'card' then type = 'bank' end
    local player = dusa.getPlayer(source)
    player.Functions.AddMoney(type, amount)
end

function dusa.removeMoney(source, type, amount)
    if type == 'card' then type = 'bank' end
    local player = dusa.getPlayer(source)
    player.Functions.RemoveMoney(type, amount)
end

function dusa.getMoney(source, type)
    if type == 'card' then type = 'bank' end
    local player = dusa.getPlayer(source)
    return player.Functions.GetMoney(type)
end

function dusa.getJob(source)
    local player = dusa.getPlayer(source)
    return player.PlayerData.job
end

function dusa.setJob(source, job, grade)
    local player = dusa.getPlayer(source)
    player.Functions.SetJob(job, grade)
end

function dusa.getJobs()
    return QBCore.Shared.Jobs
end
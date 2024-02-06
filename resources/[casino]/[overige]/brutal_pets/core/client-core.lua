Core = nil
if Config['Core']:upper() == 'ESX' then
    local _esx_ = 'new' -- 'new' / 'old'

    if _esx_ then
        Core = exports['es_extended']:getSharedObject()
    else
        while Core == nil do
            TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
            Citizen.Wait(0)
        end
    end

    LoadedEvent = 'esx:playerLoaded'
    TSCB = Core.TriggerServerCallback

    function PlayerJobFunction()
        return Core.GetPlayerData().job.name
    end

elseif Config['Core']:upper() == 'QBCORE' then
    Core = exports['qb-core']:GetCoreObject()

    LoadedEvent = 'QBCore:Client:OnPlayerLoaded'
    TSCB = Core.Functions.TriggerCallback

    function PlayerJobFunction()
        return Core.Functions.GetPlayerData().job.name
    end

end
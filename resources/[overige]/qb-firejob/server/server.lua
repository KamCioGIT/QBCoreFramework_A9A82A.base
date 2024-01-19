-- Core export
local QBCore = exports['qb-core']:GetCoreObject()

local Flashlights = {}

------------------------------------
-- Ah please do i have to explain --
------------------------------------
AddEventHandler("playerDropped", function ()
    if Flashlights[source] then Flashlights[source] = nil end

    TriggerClientEvent("qb-firejob:FlightHandler", -1, Flashlights)
end)

------------------
--  FlashLight  --
------------------
RegisterNetEvent("qb-firejob:ToggleSuitLight", function(bool, player)
    if bool then
        Flashlights[source] = {player}
    else
        Flashlights[source] = nil
    end

    TriggerClientEvent("qb-firejob:FlightHandler", -1, Flashlights)
end)

-------------------
--      Hose     --
-------------------
RegisterNetEvent('qb-firejob:hose:startParticleEffect', function()
	TriggerClientEvent('qb-firejob:hose:startParticleEffect', -1, source)
end)

RegisterNetEvent('qb-firejob:hose:stopParticleEffect', function()
	TriggerClientEvent('qb-firejob:hose:stopParticleEffect', -1, source)
end)

----------
-- Item --
----------
QBCore.Functions.CreateUseableItem("scott", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:UseScba", source)
end)


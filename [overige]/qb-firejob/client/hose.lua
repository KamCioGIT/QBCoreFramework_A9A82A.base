-- Core export
local QBCore = exports['qb-core']:GetCoreObject()

local dict = "core"
local particle = "water_cannon_jet"
local ped = nil

local x, y, z = nil
local xx, yy, zz = nil

local ActiveEffects = {}
local hoseNozzle = nil
local pressed = false

-- local SupplyLine = nil | soon
local IsPlayerConnected = false 
local ConnectedHyID = nil

local hasFireHose = false
local FireHoseAmmo = 0
local weaponHash = GetHashKey("WEAPON_HOSE")

if Config.Hose == true then
    RegisterNetEvent("firejob:hose", function()
        local playerPed = PlayerPedId()
        if IsPlayerConnected and not hoseNozzle then
            if HasPedGotWeapon(playerPed, weaponHash, false) then
                SetCurrentPedWeapon(playerPed, weaponHash, true)
                hasExtinguisher = true
                extinguisherAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
            else
                GiveWeaponToPed(playerPed, weaponHash, 2000, true, true)
            end
            hoseNozzle = CreateObject(GetHashKey('prop_fire_hose'), 0, 0, 0, true, true, true)
            AttachEntityToEntity(hoseNozzle, playerPed, GetPedBoneIndex(playerPed, 57005), 0.12, 0.14, -0.03, 20.0, 260.0, 70.0, true, false, false, true, 1, true)
        else
            DeleteEntity(hoseNozzle)
            hoseNozzle = nil
            SetPedCurrentWeaponVisible(playerPed, true, false, false, false)
            SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
            if hasExtinguisher then
                hasExtinguisher = false
                SetPedAmmo(playerPed, weaponHash, extinguisherAmmo)
                extinguisherAmmo = 0
                if IsPlayerConnected then
                    RemoveWeaponFromPed(playerPed, weaponHash)
                else
                    QBCore.Functions.Notify(Config.Locales['NotConnected'], "error", 1000)
                    RemoveWeaponFromPed(playerPed, weaponHash)
                end
            end
        end
    end)
else
    print("You have the hose disabled in Config.lua")
end

RegisterNetEvent('qb-firejob:Disconnect')
AddEventHandler('qb-firejob:Disconnect', function()
    local ped = PlayerPedId()
    local check = GetHashKey("weapon_wrench") -- change tool
    local haswrench = HasPedGotWeapon(ped, check, false)

    if IsPlayerConnected then
        if haswrench then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("open_hydrant", "Closing Hydrant..", 6500, false, true, {
			    disableMovement = true,
			    disableCarMovement = true,
			    disableMouse = false,
			    disableCombat = true,
		    }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify(Config.Locales['Disconnected'], "success", 1000)
		    end)
        else
            QBCore.Functions.Notify("You don't have the right tool for that! Rookie mistake", "error", 1000)
        end

        IsPlayerConnected = false
        ConnectedHyID = nil
    else
        QBCore.Functions.Notify(Config.Locales['NotConnected'], "error", 1000)
    end
end)

RegisterNetEvent('qb-firejob:Connect')
AddEventHandler('qb-firejob:Connect', function()
    local ped = PlayerPedId()
    local check = GetHashKey("weapon_wrench") -- change tool
    local haswrench = HasPedGotWeapon(ped, check, false)

    if IsPlayerConnected then
		QBCore.Functions.Notify(Config.Locales['AlreadyConnected'], "error", 1000)
	else
        if haswrench then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("open_hydrant", "Opening Hydrant..", 6500, false, true, {
			    disableMovement = true,
			    disableCarMovement = true,
			    disableMouse = false,
			    disableCombat = true,
		    }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify(Config.Locales['Connected'], "success", 1000)
		    end)

		    local hydrant = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()))
	
		    local hydrantModel = GetEntityModel(hydrant)

		    local hydrantNetworkID = NetworkGetNetworkIdFromEntity(hydrant)

		    IsPlayerConnected = true
		    ConnectedHyID = hydrantNetworkID
        else
            QBCore.Functions.Notify("You don't have the right tool for that! Rookie mistake", "error", 1000)
        end
	end
end)

Citizen.CreateThread(function()
    RequestNamedPtfxAsset(dict)

    while not HasNamedPtfxAssetLoaded(dict) do
        Citizen.Wait(0)
    end
        
    while true do
        Citizen.Wait(1)
        if hoseNozzle then
            if pressed then
                Citizen.Wait(100)
                SetParticleFxShootoutBoat(true)
                local entity = GetCurrentPedWeaponEntityIndex(ped)
                local multiplier = GetGameplayCamRelativePitch(ped) - GetEntityPitch(entity)
                local distance = 10
                if multiplier < 0 then
                    distance = distance + (-9 * (multiplier / -52.0))
                elseif multiplier >= 0 and multiplier < 15 then
                    distance = distance + (10 * multiplier / 15)
                else
                    distance = distance + (-9 * (multiplier - 15) / 45)
                end
                local off = GetOffsetFromEntityInWorldCoords(
                    entity,
                    distance,
                    -0.5,
                    0.0
                )
                local x = off.x
                local y = off.y
                local offZ = off.z

                if offZ > GetEntityCoords(entity).z then
                    offZ = off.z - 2.0
                end

                local _, z = GetGroundZFor_3dCoord(x, y, offZ)
                Citizen.Wait(distance * 10)
                PlayEffect("core", "water_cannon_spray", x, y, z)
            else
                Citizen.Wait(0)
            end
        end
    end
end)

Citizen.CreateThread(function()
    local particleEffect = 0

    while true do
        Citizen.Wait(1)
        if hoseNozzle then
            if ped == nil then
                ped = PlayerPedId()
            end
            local selectedWeapon = GetSelectedPedWeapon(ped)
            if selectedWeapon == weaponHash and (IsControlJustPressed(0, 24) or IsDisabledControlPressed(0, 24)) and not pressed then
                ped = PlayerPedId()
                pressed = true
                UseParticleFxAssetNextCall(dict)
                particleEffect = StartParticleFxLoopedOnEntity(
                    particle,
                    GetCurrentPedWeaponEntityIndex(ped),
                    0.30, 
                    -0.02, 
                    -0.33,
                    0.0,
                    0.0,
                    -90.0,
                    1.0,
                    false,
                    false,
                    false
                )
                TriggerServerEvent('qb-firejob:hose:startParticleEffect')
            end
            
            if selectedWeapon == weaponHash then
                DisablePlayerFiring(PlayerId(), true)
                DisableControlAction(0, 24, true)
                if pressed then
                    SetParticleFxLoopedOffsets(
                        particleEffect,
                        0.30, 
                        -0.02, 
                        -0.33,
                        -25.0,
                        0.0,
                        -90.0
                    )
                end
            end

            if (IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24)) and pressed then
                StopParticleFxLooped(particleEffect, 0)
                pressed = false
                TriggerServerEvent('qb-firejob:hose:stopParticleEffect')
            end
            if selectedWeapon ~= weaponHash and hoseNozzle then
                TriggerEvent('qb-firejob:client:hose')
            end
        end
    end
end)

RegisterNetEvent('qb-firejob:hose:stopParticleEffect', function(playerId)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
    if playerPed ~= PlayerPedId() then
        if ActiveEffects[playerPed] then
            StopParticleFxLooped(ActiveEffects[playerPed], 0)
        end
    end
end)

RegisterNetEvent('qb-firejob:hose:startParticleEffect',function(playerId)
    local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
    if playerPed ~= PlayerPedId() and playerPed ~= 0 then
        UseParticleFxAssetNextCall(dict)
        ActiveEffects[playerPed] = StartParticleFxLoopedOnEntity(
            particle,
            GetCurrentPedWeaponEntityIndex(playerPed),
            0.30, 
            -0.02, 
            -0.33,
            -25.0,
            0.0,
            -90.0,
            1.0,
            false,
            false,
            false
        )
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1)
    for k, v in pairs(ActiveEffects) do
        UseParticleFxAssetNextCall(dict)
        ActiveEffects[k] = StartParticleFxLoopedOnEntity(
            particle,
            GetCurrentPedWeaponEntityIndex(k),
            0.0,
            0.0,
            0.0,
            0.1,
            0.0,
            0.0,
            1.0,
            false,
            false,
            false
        )
    end
end)

function PlayEffect(pdict, pname, posx, posy, posz)
    Citizen.CreateThread(function()
        UseParticleFxAssetNextCall(pdict)
        local pfx = StartParticleFxLoopedAtCoord(
            pname,
            posx,
            posy,
            posz,
            0.0,
            0.0,
            GetEntityHeading(PlayerPedId()),
            1.0,
            false,
            false,
            false,
            false
        )
        Citizen.Wait(100)
        StopParticleFxLooped(pfx, 0)
    end)
end
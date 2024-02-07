-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    if Config.BrutalNotify then
        exports['brutal_notify']:SendAlert(title, text, time, type)
    else
        -- Put here your own notify and set the Config.BrutalNotify to false
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(0,1)

        -- Default ESX Notify:
        --TriggerEvent('esx:showNotification', text)

        -- Default QB Notify:
        --TriggerEvent('QBCore:Notify', text, 'info', 5000)

        -- OKOK Notify:
        -- exports['okokNotify']:Alert(title, text, time, type, false)

    end
end

function TextUIFunction(type, text)
    if type == 'open' then
        if Config.TextUI:lower() == 'ox_lib' then
            lib.showTextUI(text)
        elseif Config.TextUI:lower() == 'okoktextui' then
            exports['okokTextUI']:Open(text, 'darkblue', 'right')
        elseif Config.TextUI:lower() == 'esxtextui' then
            ESX.TextUI(text)
        elseif Config.TextUI:lower() == 'qbdrawtext' then
            exports['qb-core']:DrawText(text,'left')
        end
    elseif type == 'hide' then
        if Config.TextUI:lower() == 'ox_lib' then
            lib.hideTextUI()
        elseif Config.TextUI:lower() == 'okoktextui' then
            exports['okokTextUI']:Close()
        elseif Config.TextUI:lower() == 'esxtextui' then
            ESX.HideUI()
        elseif Config.TextUI:lower() == 'qbdrawtext' then
            exports['qb-core']:HideText()
        end
    end
end

RegisterNetEvent('brutal_pets:client:OpenPetMenu')
AddEventHandler('brutal_pets:client:OpenPetMenu', function()
    TriggerEvent('brutal_pets:client:openmypetmenu')
end)

function PetDied(ped)
    local died = false
    if IsEntityDead(ped) then
        died = true
    end
    return died
end

function GetPedHP(ped)
	if GetEntityHealth(ped) < tonumber(MyPets[CB].HP) and DoesEntityExist(ped) then
        if GetEntityHealth(ped) == 0 then
            MyPets[CB].HP = 100
        else
		    MyPets[CB].HP = GetEntityHealth(ped)
        end
		return MyPets[CB].HP
	else
        if MyPets[CB].HP == 0 then
            MyPets[CB].HP = 100
        end
		return MyPets[CB].HP
	end
end

function GPS_Enable()
    DisplayRadar(true)
end

function GPS_Disable()
    DisplayRadar(false)
end

function WhistleAnimation()
    local playerPed = PlayerPedId()
    loadAnimDict('rcmnigel1c')
	TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 1, 0, 0, 0, 0)
    Citizen.Wait(2300)
    ClearPedTasks(playerPed)
end

function GetBallBack_Utils()
    TriggerServerEvent('brutal_pets:server:AddItems', {{"WEAPON_BALL", 1}})
    -- This is played when the pet returns the ball to the player
end

function HelpText(text, sound, _end)
    text = tostring(text)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), 2500)
end

-- Put this trigger where you want that the pet unfollow the player
-- TriggerEvent('brutal_pets:client:UnFollowPet')

RegisterNetEvent('brutal_pets:client:UnFollowPet')
AddEventHandler('brutal_pets:client:UnFollowPet', function()
    if MyPets[CB].Follow == true and MyPets[CB].InTask == true and MyPets[CB].IsOut then
        FollowPlayer()
    end
end)

function DeleteBallFunction(object)
    DeleteObject(object)
end

function PutPlayerIntoVehicle(Vehicle)
	TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
end

function GiveKeysToPlayer(Vehicle)
    if Config['Core']:upper() == 'QBCORE' then
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(Vehicle))
    end
end
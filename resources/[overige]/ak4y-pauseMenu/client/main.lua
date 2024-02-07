if AK4Y.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
end

local maxPlayers = nil
local connectedPlayersCount = nil
local lastCheck = 0
local apiKey = nil
local steamID = nil

Citizen.CreateThread(function()
    if AK4Y.Framework == "oldqb" then 
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
	elseif AK4Y.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
        end
    end
    PlayerData = QBCore.Functions.GetPlayerData()
    Wait(5000)
    SendNUIMessage({
        action = 'setJS', 
        translate = AK4Y.Translate,
        discordURL = AK4Y.DiscordURL,
        instagramURL = AK4Y.InstagramURL,
        youtubeURL = AK4Y.YoutubeURL,
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    SendNUIMessage({
        action = 'setJS', 
        translate = AK4Y.Translate,
        discordURL = AK4Y.DiscordURL,
        instagramURL = AK4Y.InstagramURL,
        youtubeURL = AK4Y.YoutubeURL,
    })
	PlayerData = QBCore.Functions.GetPlayerData()
end)

local openMenuSpamProtect = 0
RegisterCommand('openSettings', function()
    if not IsPauseMenuActive() and not IsNuiFocused() then
        PlayerData = QBCore.Functions.GetPlayerData()
        if maxPlayers == nil or connectedPlayersCount == nil or lastCheckControl() then
            lastCheck = GetGameTimer() + AK4Y.ClientWait
            QBCore.Functions.TriggerCallback("ak4y-pauseMenu:getDetails", function(result)
                local moneyCash = PlayerData.money.cash
                local moneyBank = PlayerData.money.bank
                local job = PlayerData.job.label
                local gender = PlayerData.charinfo.gender
                local firstname = PlayerData.charinfo.firstname
                local lastname = PlayerData.charinfo.lastname
                local genderText = ""
                apiKey = result.apiKey
                if result.steamid then
                    steamID = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. apiKey .. "&steamids=" .. result.steamid
                else
                    steamID = 'null'
                end
                maxPlayers = result.maxPlayers
                connectedPlayersCount = result.connectedPlayers
                if gender == 0 then genderText = AK4Y.Translate.male else genderText = AK4Y.Translate.female end
                SetNuiFocus(true,true)
                SendNUIMessage({
                    action = 'show', 
                    moneyCash = moneyCash,
                    moneyBank = moneyBank,
                    job = job,
                    gender = genderText,
                    firstname = firstname,
                    lastname = lastname,
                    maxPlayers = maxPlayers,
                    connectedPlayers = connectedPlayersCount,
                    apiKey = apiKey,
                    steamid = steamID,
                })
            end)
        else
            local moneyCash = PlayerData.money.cash
            local moneyBank = PlayerData.money.bank
            local job = PlayerData.job.label
            local gender = PlayerData.charinfo.gender
            local firstname = PlayerData.charinfo.firstname
            local lastname = PlayerData.charinfo.lastname
            local genderText = ""
            if gender == 0 then genderText = AK4Y.Translate.male else genderText = AK4Y.Translate.female end
            SetNuiFocus(true,true)
            SendNUIMessage({
                action = 'show', 
                moneyCash = moneyCash,
                moneyBank = moneyBank,
                job = job,
                gender = genderText,
                firstname = firstname,
                lastname = lastname,
                maxPlayers = maxPlayers,
                connectedPlayers = connectedPlayersCount,
                apiKey = apiKey,
                steamid = steamID,
            })
        end
    end
end)

RegisterNUICallback('openSettings', function(data, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
end)

RegisterNUICallback('openMap', function(data, cb)
    SetNuiFocus(false, false)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent('ak4y-pauseMenu:dropPlayer')
end)

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)

RegisterKeyMapping('openSettings', 'Open Settings Menu', 'keyboard', 'ESCAPE')

Citizen.CreateThread(function()
	while true do
	    Wait(1)
		SetPauseMenuActive(false)
	end
end)

function lastCheckControl()
    if lastCheck <= GetGameTimer() then 
        return true 
    else
        return false
    end
end
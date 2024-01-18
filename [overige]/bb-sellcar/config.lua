Config, Lang, Blips, Noti = {}, {}, {}, {}

--$$$$$$\   $$$$$$\  $$\   $$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ 
--$$  __$$\ $$  __$$\ $$$\  $$ |$$  _____|\_$$  _|$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |
--$$ /  \__|$$ /  $$ |$$$$\ $$ |$$ |        $$ |  $$ /  \__|$$ |  $$ |$$ |  $$ |$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |
--$$ |      $$ |  $$ |$$ $$\$$ |$$$$$\      $$ |  $$ |$$$$\ $$ |  $$ |$$$$$$$  |$$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |
--$$ |      $$ |  $$ |$$ \$$$$ |$$  __|     $$ |  $$ |\_$$ |$$ |  $$ |$$  __$$< $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ |
--$$ |  $$\ $$ |  $$ |$$ |\$$$ |$$ |        $$ |  $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |
--\$$$$$$  | $$$$$$  |$$ | \$$ |$$ |      $$$$$$\ \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |
 --\______/  \______/ \__|  \__|\__|      \______| \______/  \______/ \__|  \__|\__|  \__|  \__|   \______| \______/ \__|  \__|

--Enter your framework "esx" or "qbcore"
Config.framework = "qbcore"
--If you have a modified ESX core you can change it here
Config.ESXCore = "esx:getSharedObject"
--If you are using one of the most recent versions of ESX, set the script name. Default = "es_extended"
Config.ESXExport = ""
--If you have a modified QBCore core you can change it here
Config.QBCore = "qb-core"
--You can choose between oxmysql, mysql-async or ghmattisql
Config.Mysql = "oxmysql"
--Point of sale of vehicles and marker
Config.sellPoint = {x=1208.53, y=2700.11, z=37.73, markertype=23, r=245, g=14, b=70}
--Heading of the vehicle once it enters the point of sale
Config.sellPointHeading = 354.27
--Point at which the NPC will spawn
Config.npcSpawnPoint = {x=1204.84, y=2700.13, z=37.98, h=353.1}
--Point at which the NPC stops to perform the animations
Config.npcSpawnPointSpectate = {x=1208.49, y=2703.72, z=38.01, h=186.88}
--NPC model, you can find more models at the following url: https://docs.fivem.net/docs/game-references/ped-models/
Config.npcModel = "csb_reporter"
--Point at which the NPC will disappear with the vehicle
Config.npcDisappearPoint = {x=1204.07, y=2701.73, z=37.71}
--Point to which the player's ped moves during animations
Config.playerAnimationPoint = {x=1205.68, y=2698.96, z=37.96}
--Account into which the money will be delivered/withdrawn
Config.paymentsAccount = "bank"
--Point at which the purchased or removed vehicle will spawn
Config.purchasedVehicleSpawn = {x=1239.64, y=2702.25, z=37.76, h=236.94}
--Do you use Advanced Parking¿?
Config.UseDeleteVehicle = false


--$$$$$$$\  $$\       $$$$$$\ $$$$$$$\  
--$$  __$$\ $$ |      \_$$  _|$$  __$$\ 
--$$ |  $$ |$$ |        $$ |  $$ |  $$ |
--$$$$$$$\ |$$ |        $$ |  $$$$$$$  |
--$$  __$$\ $$ |        $$ |  $$  ____/ 
--$$ |  $$ |$$ |        $$ |  $$ |      
--$$$$$$$  |$$$$$$$$\ $$$$$$\ $$ |      
--\_______/ \________|\______|\__|

--Coordinate at which the blip will appear
Blips.coord = {x = 1208.0, y = 2698.08, z = 37.69}
--Type of sprite you want to display. You can find more sprites at the following url: https://docs.fivem.net/docs/game-references/blips/
Blips.blip = 596
--The color with which the blip will be displayed. You can find more colors at the following url: https://docs.fivem.net/docs/game-references/blips/#blip-colors
Blips.blipColor = 48
--Size of the blip on the map
Blips.blipScale = 0.9
--Text you want to display on the map
Blips.blipText = "2e hands dealer"

--$$\        $$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\  $$$$$$\   $$$$$$\  $$$$$$$$\ 
--$$ |      $$  __$$\ $$$\  $$ |$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\ $$  _____|
--$$ |      $$ /  $$ |$$$$\ $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |      
--$$ |      $$$$$$$$ |$$ $$\$$ |$$ |$$$$\ $$ |  $$ |$$$$$$$$ |$$ |$$$$\ $$$$$\    
--$$ |      $$  __$$ |$$ \$$$$ |$$ |\_$$ |$$ |  $$ |$$  __$$ |$$ |\_$$ |$$  __|   
--$$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |      
--$$$$$$$$\ $$ |  $$ |$$ | \$$ |\$$$$$$  |\$$$$$$  |$$ |  $$ |\$$$$$$  |$$$$$$$$\ 
--\________|\__|  \__|\__|  \__| \______/  \______/ \__|  \__| \______/ \________|

Lang.sellPoint = "Druk op ~r~E~w~ om het voertuig te verkopen"
Lang.buyPoint = "Druk op ~r~E~w~ om het voertuig te bekijken"
Lang.yes = "Ja"
Lang.no = "Nee"
Lang.vehiclesold = "U heeft een voertuig verkocht voor "
Lang.nomoney = "Je hebt niet genoeg geld om dit voertuig te kopen"
Lang.vehicleonsale = "Uw voertuig is te koop aangeboden"
Lang.noprice = "U moet een prijs invoeren"
Lang.noowner = "U bent niet de eigenaar van dit voertuig"
Lang.vehiclepurchased = "U heeft een voertuig gekocht voor"
Lang.vehiclereturned = "Het voertuig is correct aan u geretourneerd"

--$$\   $$\  $$$$$$\ $$$$$$$$\ $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ 
--$$$\  $$ |$$  __$$\\__$$  __|\_$$  _|$$  _____|\_$$  _|$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |
--$$$$\ $$ |$$ /  $$ |  $$ |     $$ |  $$ |        $$ |  $$ /  \__|$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |
--$$ $$\$$ |$$ |  $$ |  $$ |     $$ |  $$$$$\      $$ |  $$ |      $$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |
--$$ \$$$$ |$$ |  $$ |  $$ |     $$ |  $$  __|     $$ |  $$ |      $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ |
--$$ |\$$$ |$$ |  $$ |  $$ |     $$ |  $$ |        $$ |  $$ |  $$\ $$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |
--$$ | \$$ | $$$$$$  |  $$ |   $$$$$$\ $$ |      $$$$$$\ \$$$$$$  |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |
--\__|  \__| \______/   \__|   \______|\__|      \______| \______/ \__|  \__|  \__|   \______| \______/ \__|  \__|

-- Client notifications
function SendClientNotification(type, text, time)

    --EXAMPLE WITH codem-notification:
    -- time = 10000
    -- if type == 'success' then
    --     exports["Venice-Notification"]:Notify(text, time, "check", options)
    -- elseif type == 'error' then
    --     exports["Venice-Notification"]:Notify(text, time, "error", options)
    -- elseif type == 'info' then
    --     exports["Venice-Notification"]:Notify(text, time, "info", options)
    -- end

    if Config.framework == 'esx' then
        ESX.ShowNotification(text) --default ESX notification
    elseif Config.framework == 'qbcore' then
        QBCore.Functions.Notify(text) --default QB notification
    end
end


-- Server side notifications
function SendServerNotification(source, type, text, time)

    --EXAMPLE WITH codem-notification:
    -- time = 10000
    -- if type == 'success' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'check', options)
    -- elseif type == 'error' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'error', options)
    -- elseif type == 'info' then
    --     TriggerClientEvent('codem-notification', source, text, time, 'info', options)
    -- end

    if Config.framework == 'esx' then
        TriggerClientEvent('esx:showNotification', source, text) --default ESX notification
    elseif Config.framework == 'qbcore' then
        TriggerClientEvent('QBCore:Notify', source, text) --default QB notification
    end
end

--$$$$$$$$\ $$\   $$\ $$\   $$\  $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\  $$$$$$\  
--$$  _____|$$ |  $$ |$$$\  $$ |$$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |$$  __$$\ 
--$$ |      $$ |  $$ |$$$$\ $$ |$$ /  \__|  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |$$ /  \__|
--$$$$$\    $$ |  $$ |$$ $$\$$ |$$ |        $$ |     $$ |  $$ |  $$ |$$ $$\$$ |\$$$$$$\  
--$$  __|   $$ |  $$ |$$ \$$$$ |$$ |        $$ |     $$ |  $$ |  $$ |$$ \$$$$ | \____$$\ 
--$$ |      $$ |  $$ |$$ |\$$$ |$$ |  $$\   $$ |     $$ |  $$ |  $$ |$$ |\$$$ |$$\   $$ |
--$$ |      \$$$$$$  |$$ | \$$ |\$$$$$$  |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |\$$$$$$  |
--\__|       \______/ \__|  \__| \______/   \__|   \______| \______/ \__|  \__| \______/

--    __  ____   ___  __    __ __  __    __ __  ____ __  __ __   ___ __     ____  __ 
--   (( \ || \\ // \\ ||    || ||\ ||    || || ||    ||  || ||  //   ||    ||    (( \
--    \\  ||_// ||=|| \\ /\ // ||\\||    \\ // ||==  ||==|| || ((    ||    ||==   \\ 
--   \_)) ||    || ||  \V/\V/  || \||     \V/  ||___ ||  || ||  \\__ ||__| ||___ \_))

--This function is responsible for spawning vehicles. Both those parked for sale, as well as for spawning the purchased/withdrawned vehicle.

function spawnVehicle(vehicleData, place, plate, bool, network)
    local coords = {x = place.x, y = place.y, z = place.z, h = place.h}
    local vehicle = CreateVehicle(vehicleData["model"], coords.x,coords.y,coords.z,coords.h, network, false)
    if Config.framework == "esx" then
        ESX.Game.SetVehicleProperties(vehicle, vehicleData)
    elseif Config.framework == "qbcore" then
        QBCore.Functions.SetVehicleProperties(vehicle, vehicleData)
    end
    if bool then
        SetVehicleDoorsLocked(vehicle, 2)
        table.insert(spawnedCars, vehicle)
    else
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
end

if Config.UseDeleteVehicle then
    function delete(vehicle)
        exports["AdvancedParking"]:DeleteVehicle(vehicle)
    end
end

--    ___   ____ ______      ___   __    __ __  __  ____ ____ 
--   // \\ ||    | || |     // \\  ||    || ||\ || ||    || \\
--  (( ___ ||==    ||      ((   )) \\ /\ // ||\\|| ||==  ||_//
--   \\_|| ||___   ||       \\_//   \V/\V/  || \|| ||___ || \\

--Function in charge of retrieving the owner of a vehicle by performing a database query.

function getOwner(xPlayer, plate)
    if Config.framework == "esx" then
        local owner = SqlFunc(Config.Mysql,'fetchAll','SELECT * FROM owned_vehicles WHERE owner = @owner and plate = @plate', {
            ['@owner'] = xPlayer.identifier, 
            ['@plate'] = plate
        })
        return owner
    elseif Config.framework == "qbcore" then
        local owner = SqlFunc(Config.Mysql,'fetchAll','SELECT * FROM player_vehicles WHERE citizenid = @citizenid and plate = @plate', {
            ['@citizenid'] = xPlayer.PlayerData.citizenid, 
            ['@plate'] = plate
        })
        return owner
    end
end

--    ____  __  __   ___   __  __  ____    __  __   ___   ______ __  ____ _  _
--    || \\ ||  ||  // \\  ||\ || ||       ||\ ||  // \\  | || | || ||    \\//
--    ||_// ||==|| ((   )) ||\\|| ||==     ||\\|| ((   ))   ||   || ||==   )/ 
--    ||    ||  ||  \\_//  || \|| ||___    || \||  \\_//    ||   || ||    //

--Function to change the mobile phone. Here you can set the function of your mobile phone.

function notifyphone()
    -- TriggerServerEvent('qb-phone:server:sendNewMail', {
    -- sender = "DealerSecondHand",
    -- subject = "Your car has been sold!",
    -- message = "Your car has been sold! You have the money in the bank. Congratulations. Thank you for using our services.",
    -- button = {}
    -- })
end

--    ___   ____ ______    ___  ___   ___   __  __  ____ _  _
--   // \\ ||    | || |    ||\\//||  // \\  ||\ || ||    \\//
--  (( ___ ||==    ||      || \/ || ((   )) ||\\|| ||==   )/ 
--   \\_|| ||___   ||      ||    ||  \\_//  || \|| ||___ //

--Function to recover the user's money
function getUserMoney(xPlayer)
    if Config.framework == "esx" then
        local money = xPlayer.getAccount(Config.paymentsAccount).money 
        return money
    elseif Config.framework == "qbcore" then
        local money = xPlayer.PlayerData.money.bank
        return money
    end
end

--    ____   ____ ___  ___   ___   __ __  ____    ___  ___   ___   __  __  ____ _  _
--    || \\ ||    ||\\//||  // \\  || || ||       ||\\//||  // \\  ||\ || ||    \\//
--    ||_// ||==  || \/ || ((   )) \\ // ||==     || \/ || ((   )) ||\\|| ||==   )/ 
--    || \\ ||___ ||    ||  \\_//   \V/  ||___    ||    ||  \\_//  || \|| ||___ //

--Function to remove the user's money when purchasing the vehicle
function removeMoney(xPlayer, carPrice)
    if Config.framework == "esx" then
        xPlayer.removeAccountMoney(Config.paymentsAccount, carPrice)
    elseif Config.framework == "qbcore" then
        xPlayer.Functions.RemoveMoney(Config.paymentsAccount, carPrice, "Buy Car")
    end
end

--    ____  __ __ _  _      ___  ___  ____     ____    ___  ______  ___  ____   ___   __   ____
--    || )) || || \\//     //   // \\ || \\    || \\  // \\ | || | // \\ || )) // \\ (( \ ||   
--    ||=)  || ||  )/     ((    ||=|| ||_//    ||  )) ||=||   ||   ||=|| ||=)  ||=||  \\  ||== 
--    ||_)) \\_// //       \\__ || || || \\    ||_//  || ||   ||   || || ||_)) || || \_)) ||___

--Function to enter the data of the purchased vehicle in the data base
function buyCar(xPlayer, plate, vehData, vehName, vehHash)
    if Config.framework == "esx" then
        SqlFunc(Config.Mysql, 'execute', 'INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (@owner, @plate, @vehicle, @type, @stored)', {
            ['@owner']   = xPlayer.identifier,
            ['@plate']   = plate,
            ['@vehicle']   = vehData.vehicle,
            ['@type']   = "car",
            ['@stored']   = 0,
        })
    elseif Config.framework == "qbcore" then
        SqlFunc(Config.Mysql, 'execute', 'INSERT INTO player_vehicles (license, citizenid, plate, vehicle, hash, mods) VALUES (@license, @citizenid, @plate, @vehicle, @hash, @mods)', {
            ['@license'] = xPlayer.PlayerData.license,
            ['@citizenid']   = xPlayer.PlayerData.citizenid,
            ['@plate']   = plate,
            ['@vehicle'] = vehName, 
            ['@hash'] = vehicleHash,
            ['@mods']   = vehData.vehicle
        })
    end
end


--$$$$$$$\  $$\        $$$$$$\   $$$$$$\  $$$$$$$$\  $$$$$$\  
--$$  __$$\ $$ |      $$  __$$\ $$  __$$\ $$  _____|$$  __$$\ 
--$$ |  $$ |$$ |      $$ /  $$ |$$ /  \__|$$ |      $$ /  \__|
--$$$$$$$  |$$ |      $$$$$$$$ |$$ |      $$$$$\    \$$$$$$\  
--$$  ____/ $$ |      $$  __$$ |$$ |      $$  __|    \____$$\ 
--$$ |      $$ |      $$ |  $$ |$$ |  $$\ $$ |      $$\   $$ |
--$$ |      $$$$$$$$\ $$ |  $$ |\$$$$$$  |$$$$$$$$\ \$$$$$$  |
--\__|      \________|\__|  \__| \______/ \________| \______/

--Parking spots where vehicles for sale will be spawned.
--You can add as many as you need

Places = {
    [1] = {
        x = 1194.0,
        y = 2696.66,
        z = 37.7,
        h = 177.23,
    },
    [2] = {
        x = 1190.49,
        y = 2696.78,
        z = 37.71,
        h = 181.03,
    },
    [3] = {
        x = 1186.78,
        y = 2696.77,
        z = 37.72,
        h = 178.27,
    },
    [4] = {
        x = 1179.16,
        y = 2697.02,
        z = 37.73,
        h = 179.96,
    },
    [5] = {
        x = 1175.48,
        y = 2697.13,
        z = 37.72,
        h = 179.11,
    },
    [6] = {
        x = 1171.66,
        y = 2696.55,
        z = 37.66,
        h = 178.33,
    },
    [7] = {
        x = 1168.14,
        y = 2697.04,
        z = 37.63,
        h = 197.15,
    },
    [8] = {
        x = 1164.53,
        y = 2696.99,
        z = 37.63,
        h = 177.11,
    },
    [9] = {
        x = 1115.73,
        y = 2694.96,
        z = 38.14,
        h = 199.03,
    },
    [10] = {
        x = 1110.69,
        y = 2694.9,
        z = 38.25,
        h = 175.97,
    },
    [11] = {
        x = -808.83,
        y = -2351.39,
        z = 14.13,
        h = 331.65,
    },
    [12] = {
        x = -805.81,
        y = -2353.14,
        z = 14.13,
        h = 331.65,
    },
    [13] = {
        x = -802.90,
        y = -2354.90,
        z = 14.13,
        h = 331.65,
    },
    [14] = {
        x = -809.03,
        y = -2367.99,
        z = 14.13,
        h = 150.23,
    },
    [15] = {
        x = -812.05,
        y = -2366.36,
        z = 14.13,
        h = 147.40,
    },
    [16] = {
        x = -815.03,
        y = -2364.64,
        z = 14.13,
        h = 147.40,
    },
    [18] = {
        x = -818.01,
        y = -2362.98,
        z = 14.13,
        h = 147.40,
    },
    [19] = {
        x = -821.05,
        y = -2361.13,
        z = 14.13,
        h = 147.40,
    },
    [20] = {
        x = -823.92,
        y = -2359.48,
        z = 14.13,
        h = 147.40,
    },
    [21] = {
        x = -826.89,
        y = -2357.72,
        z = 14.13,
        h = 147.40,
    },
    [22] = {
        x = -837.20,
        y = -2361.71,
        z = 14.13,
        h = 328.81,
    },
    [23] = {
        x = -834.14,
        y = -2363.45,
        z = 14.13,
        h = 328.81,
    },
    [24] = {
        x = -831.19,
        y = -2365.17,
        z = 14.13,
        h = 328.81,
    },
    [25] = {
        x = -828.21,
        y = -2366.94,
        z = 14.13,
        h = 331.65,
    },
    [26] = {
        x = -825.21,
        y = -2368.62,
        z = 14.13,
        h = 331.65,
    },
    [27] = {
        x = -822.29,
        y = -2370.40,
        z = 14.13,
        h = 331.65,
    },
    [28] = {
        x = -819.30,
        y = -2372.00,
        z = 14.13,
        h = 331.65,
    },
    [29] = {
        x = -816.26,
        y = -2373.71,
        z = 14.13,
        h = 331.65,
    },
    [30] = {
        x = -813.27,
        y = -2375.57,
        z = 14.13,
        h = 331.65,
    },
}
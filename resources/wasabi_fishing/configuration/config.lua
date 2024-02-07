-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local seconds, minutes = 1000, 60000
Config = {}

Config.checkForUpdates = true -- Check for updates?
Config.oldESX = false -- Nothing to do with qb / Essentially when set to true it disables the check of if player can carry item

Config.sellShop = {
    enabled = true,
    coords = vec3(1691.42, 3580.52, 34.6), -- X, Y, Z Coords of where fish buyer will spawn
    heading = 209.6, -- Heading of fish buyer ped
    ped = 'cs_old_man2' -- Ped name here
}

Config.bait = {
    itemName = 'fishbait', -- Item name of bait
    loseChance = 58 -- Chance of loosing bait(Setting to 100 will use bait every cast)
}

Config.fishingRod = {
    itemName = 'fishingrod', -- Item name of fishing rod
    breakChance = 25 --Chance of breaking pole when failing skillbar (Setting to 0 means never break)
}

Config.timeForBite = { -- Set min and max random range of time it takes for fish to be on the line.
    min = 2 * seconds,
    max = 20 * seconds
}

Config.fish = {
    { item = 'tuna', label = 'Tuna', price = {175, 290}, difficulty = {'medium', 'easy', 'easy'} }, -- name is the item name of the fish(must be in DB of items) / Price is the range of price it will sell to fish buyer / difficulty is how many & how hard skillcheck is
    { item = 'salmon', label = 'Salmon', price = {75, 175}, difficulty = {'easy', 'easy'} },
    { item = 'trout', label = 'Trout', price = {50, 75}, difficulty = {'easy', 'easy'} },
    { item = 'anchovy', label = 'Anchovy', price = {25, 50}, difficulty = {'easy'} },
}

RegisterNetEvent('wasabi_fishing:notify')
AddEventHandler('wasabi_fishing:notify', function(title, message, msgType)
    -- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    if not msgType then
        lib.notify({
            title = title,
            description = message,
            type = 'inform'
        })
    else
        lib.notify({
            title = title,
            description = message,
            type = msgType
        })
    end
end)

Config = Config or {}

-- **** IMPORTANT ****
-- UseTarget should only be set to true when using qb-target
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.MinZOffset = 40
Config.TakeoverPrice = 5000
Config.TrapHouses = {
    [1] = {
        coords = {
            ["enter"] = vector3(-1202.21, -1308.48, 4.92),
            ["interaction"] = vector3(-1207.63, -1311.75, -32.65),
        },
        polyzoneBoxData = {
            ["enter"] = {
                heading = 290,
                minZ = 4.0,
                maxZ = 6.0,
                debug = false,
                length = 1,
                width = 1,
                distance = 2.0,
                created = false
            },
            ["interaction"] = {
                heading = 180,
                debug = false,
                length = 1,
                width = 1,
                distance = 1.0,
                created = false
            },
            ["exit"] = {
                heading = 180,
                debug = false,
                length = 1,
                width = 1,
                distance = 1.0,
                created = false
            }
        },
        keyholders = {},
        pincode = 1234,
        inventory = {},
        opened = false,
        takingover = false,
        money = 0,
    }
}

Config.AllowedItems = {
    ["metalscrap"] = {
        name = "metaalschroot",
        wait = 500,
        reward = 3,
    },
    ["copper"] = {
        name = "koper",
        wait = 500,
        reward = 2,
    },
    ["iron"] = {
        name = "ijzer",
        wait = 500,
        reward = 2,
    },
    ["aluminum"] = {
        name = "aluminium",
        wait = 500,
        reward = 2,
    },
    ["steel"] = {
        name = "staal",
        wait = 500,
        reward = 2,
    },
    ["glass"] = {
        name = "Glas",
        wait = 500,
        reward = 2,
    },
    ["lockpick"] = {
        name = "lockpick",
        wait = 10000,
        reward = 150,
    },
    ["screwdriverset"] = {
        name = "schroevendraaier set",
        wait = 10000,
        reward = 300,
    },
    ["electronickit"] = {
        name = "elektronische kit",
        wait = 10000,
        reward = 300,
    },
    ["radioscanner"] = {
        name = "radioscanner",
        wait = 10000,
        reward = 850,
    },
    ["gatecrack"] = {
        name = "gatecrack",
        wait = 10000,
        reward = 600,
    },
    ["trojan_usb"] = {
        name = "trojan_usb",
        wait = 10000,
        reward = 1000,
    },
    ["weed_brick"] = {
        name = "weed_brick",
        wait = 5000,
        reward = 250,
    },
    ["phone"] = {
        name = "telefoon",
        wait = 2000,
        reward = 750,
    },
    ["radio"] = {
        name = "radio",
        wait = 2000,
        reward = 180,
    },
    ["handcuffs"] = {
        name = "handboeien",
        wait = 2000,
        reward = 400,
    },
    ["10kgoldchain"] = {
        name = "10karaat gouden ketting",
        wait = 10000,
        reward = 3000,
    },
}

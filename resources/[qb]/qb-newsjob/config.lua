Config = {}

Config.UseableItems = true -- Set to false if you want to use commands instead of usable items

Config.Locations = {
    ["main"] = {
        label = "SasVegas Nieuws HQ",
        coords = vector4(-597.89, -929.95, 24.0, 271.5),
    },
    ["inside"] = {
        label = "SasVegas Nieuws HQ Inside",
        coords = vector4(-77.46, -833.77, 243.38, 67.5),
    },
    ["outside"] = {
        label = "SasVegas Nieuws HQ Outside",
        coords = vector4(-598.25, -929.86, 23.86, 86.5),
    },
    ["vehicle"] = {
        label = "Voertuigopslag",
        coords = vector4(-552.24, -925.61, 23.86, 242.5),
    },
    ["heli"] = {
        label = "Helikopteropslag",
        coords = vector4(-583.08, -930.55, 36.83, 89.26),
    }
}

Config.Vehicles = {
    -- Grade 0
    [0] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 1
    [1] = {
        ["rumpo"] = "Rumpo",

    },
    -- Grade 2
    [2] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 3
    [3] = {
        ["rumpo"] = "Rumpo",
    },
    -- Grade 4
    [4] = {
        ["rumpo"] = "Rumpo",
    }
}

Config.Helicopters = {
    -- Grade 0
    [0] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 1
    [1] = {
        ["frogger"] = "Frogger",

    },
    -- Grade 2
    [2] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 3
    [3] = {
        ["frogger"] = "Frogger",
    },
    -- Grade 4
    [4] = {
        ["frogger"] = "Frogger",
    }
}

Config.VehicleItems = {
    [1] = {
        name = "newscam",
        amount = 1,
        info = {},
        weight = 0.1,
        type = "item",
        image = "newscam.png",
        label = "Nieuwscamera",
        slot = 1,
    },
    [2] = {
        name = "newsmic",
        amount = 1,
        info = {},
        weight = 0.1,
        type = "item",
        image = "newsmic.png",
        label = "Nieuws Microfoon",
        slot = 2,
    },
    [3] = {
        name = "newsbmic",
        amount = 1,
        info = {},
        weight = 0.1,
        type = "item",
        image = "newsbmic.png",
        label = "Boommicrofoon",
        slot = 3,
    },
}
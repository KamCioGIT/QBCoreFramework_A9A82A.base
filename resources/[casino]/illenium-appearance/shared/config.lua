Config = {}

Config.Debug = false

Config.ClothingCost = 100
Config.BarberCost = 100
Config.TattooCost = 100
Config.SurgeonCost = 100

Config.ChargePerTattoo = true -- Charge players per tattoo. Config.TattooCost will become the cost of 1 tattoo. The cost can be overridden by adding `cost` key in shared/tattoos.lua for specific tattoos

-- Only set this to true if you're using rcore_tattoos
Config.RCoreTattoosCompatibility = false

Config.AsynchronousLoading = false -- Change this to false if you want the NUI data to load before displaying the appearance UI

Config.UseTarget = false

Config.TextUIOptions = {
    position = "left-center"
}

Config.NotifyOptions = {
    position = "top-right"
}

Config.OutfitCodeLength = 10

Config.UseRadialMenu = false
Config.UseOxRadial = false -- Set to true to use ox_lib radial menu, both this and UseRadialMenu must be true 

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "group.admin"

Config.EnableJobOutfitsCommand = false -- Enables /joboutfits and /gangoutfits commands

Config.ShowNearestShopOnly = true
Config.HideRadar = false -- Hides the minimap while the appearance menu is open
Config.NearestShopBlipUpdateDelay = 10000

Config.InvincibleDuringCustomization = true

Config.PreventTrackerRemoval = true -- Disables "Scarf and Chains" section if the player has tracker
Config.TrackerClothingOptions = {
    drawable = 13,
    texture = 0
}

Config.NewCharacterSections = {
    Ped = true,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = true -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

Config.AutomaticFade = true -- Enables automatic fading and hides the Fade section from Hair

-- ACE Permissions Config
Config.EnableACEPermissions = false
Config.ACEResetCooldown = 5000
Config.ACEListCooldown = 60 * 60 * 1000 -- 1 Hour

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Kledingwinkel",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Kapper",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    },
    ["surgeon"] = {
        Show = true,
        Sprite = 102,
        Color = 4,
        Scale = 0.7,
        Name = "Plastisch chirurg",
    }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Kledingwinkel",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Kapper",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    ["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scalpel",
        label = "Open Plastisch chirurg",
        distance = 3
    },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Werk / Gang Kleding Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
    {
        type = "clothing",
        coords = vector4(199.48, -872.14, 30.71, 346.82),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = true, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(198.53, -883.5, 30.71),
            vector3(203.23, -871.2, 30.71),
            vector3(195.31, -869.15, 30.71),
            vector3(191.69, -880.91, 30.71)
        }
    },
    {
        type = "clothing",
        coords = vector4(1693.2, 4828.11, 42.07, 188.66),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = true, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.07),
            vector3(1698.8566894531, 4831.4604492188, 42.07),
            vector3(1700.2448730469, 4817.7734375, 42.07),
            vector3(1688.3682861328, 4816.2954101562, 42.07)
        }
    },
    {
        type = "clothing",
        coords = vector4(-705.5, -149.22, 37.42, 122),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-719.86212158203, -147.83151245117, 37.42),
            vector3(-709.10491943359, -141.53076171875, 37.42),
            vector3(-699.94342041016, -157.44494628906, 37.42),
            vector3(-710.68774414062, -163.64665222168, 37.42)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1192.61, -768.4, 17.32, 216.6),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1206.9552001953, -775.06304931641, 17.32),
            vector3(-1190.6080322266, -764.03198242188, 17.32),
            vector3(-1184.5672607422, -772.16949462891, 17.32),
            vector3(-1199.24609375, -783.07928466797, 17.32)
        }
    },
    {
        type = "clothing",
        coords = vector4(425.91, -801.03, 29.49, 177.79),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(419.55020141602, -798.36547851562, 29.49),
            vector3(431.61773681641, -798.31909179688, 29.49),
            vector3(431.19784545898, -812.07122802734, 29.49),
            vector3(419.140625, -812.03594970703, 29.49)
        }
    },
    {
        type = "clothing",
        coords = vector4(-168.73, -301.41, 39.73, 238.67),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-160.82145690918, -313.85919189453, 39.73),
            vector3(-172.56513977051, -309.82858276367, 39.73),
            vector3(-166.5775604248, -292.48077392578, 39.73),
            vector3(-154.84906005859, -296.51647949219, 39.73)
        }
    },
    {
        type = "clothing",
        coords = vector4(75.39, -1398.28, 29.38, 6.73),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(81.406135559082, -1400.7791748047, 29.38),
            vector3(69.335029602051, -1400.8251953125, 29.38),
            vector3(69.754981994629, -1387.078125, 29.38),
            vector3(81.500122070312, -1387.3002929688, 29.38)
        }
    },
    {
        type = "clothing",
        coords = vector4(-827.39, -1075.93, 11.33, 294.31),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-826.26251220703, -1082.6293945312, 11.33),
            vector3(-832.27856445312, -1072.2819824219, 11.33),
            vector3(-820.16442871094, -1065.7727050781, 11.33),
            vector3(-814.08953857422, -1076.1878662109, 11.33)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1445.86, -240.78, 49.82, 36.17),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1448.4829101562, -226.39401245117, 49.82),
            vector3(-1439.2475585938, -234.70428466797, 49.82),
            vector3(-1451.5389404297, -248.33193969727, 49.82),
            vector3(-1460.7554931641, -240.02815246582, 49.82)
        }
    },
    {
        type = "clothing",
        coords = vector4(9.22, 6515.74, 31.88, 131.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(6.4955291748047, 6522.205078125, 31.88),
            vector3(14.737417221069, 6513.3872070312, 31.88),
            vector3(4.3691010475159, 6504.3452148438, 31.88),
            vector3(-3.5187695026398, 6513.1538085938, 31.88)
        }
    },
    {
        type = "clothing",
        coords = vector4(615.35, 2762.72, 42.09, 170.51),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(612.58312988281, 2747.2814941406, 42.09),
            vector3(612.26214599609, 2767.0520019531, 42.09),
            vector3(622.37548828125, 2767.7614746094, 42.09),
            vector3(623.66833496094, 2749.5180664062, 42.09)
        }
    },
    {
        type = "clothing",
        coords = vector4(1191.61, 2710.91, 38.22, 269.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1188.7923583984, 2704.2021484375, 38.22),
            vector3(1188.7498779297, 2716.2661132812, 38.22),
            vector3(1202.4979248047, 2715.8479003906, 38.22),
            vector3(1202.3558349609, 2703.9294433594, 38.22)
        }
    },
    {
        type = "clothing",
        coords = vector4(-3171.32, 1043.56, 20.86, 334.3),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3162.0075683594, 1056.7303466797, 20.86),
            vector3(-3170.8247070312, 1039.0412597656, 20.86),
            vector3(-3180.0979003906, 1043.1201171875, 20.86),
            vector3(-3172.7292480469, 1059.8623046875, 20.86)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1105.52, 2707.79, 19.11, 317.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1119.24, -1440.6, 5.23, 300.5),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1124.5535888672, -1444.5367431641, 5.23),
            vector3(-1118.7023925781, -1441.0450439453, 5.23),
            vector3(-1121.2891845703, -1434.8474121094, 5.23),
            vector3(-1128.4727783203, -1439.8254394531, 5.23)
        }
    },
    {
        type = "clothing",
        coords = vector4(124.82, -224.36, 54.56, 335.41),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    {
        type = "barber",
        coords = vector4(-814.22, -183.7, 37.57, 116.91),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {
        type = "barber",
        coords = vector4(136.78, -1708.4, 29.29, 144.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(132.57008361816, -1710.5053710938, 29.29),
            vector3(138.77899169922, -1702.6778564453, 29.29),
            vector3(142.73052978516, -1705.6853027344, 29.29),
            vector3(135.49719238281, -1712.9750976562, 29.29)
        }
    },
    {
        type = "barber",
        coords = vector4(-1282.57, -1116.84, 6.99, 89.25),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1287.4735107422, -1115.4364013672, 6.99),
            vector3(-1277.5638427734, -1115.1229248047, 6.99),
            vector3(-1277.2469482422, -1120.1147460938, 6.99),
            vector3(-1287.4561767578, -1119.2506103516, 6.99)
        }
    },
    {
        type = "barber",
        coords = vector4(1931.41, 3729.73, 32.84, 212.08),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1932.4931640625, 3725.3374023438, 32.84),
            vector3(1927.2720947266, 3733.7663574219, 32.84),
            vector3(1931.4379882812, 3736.5327148438, 32.84),
            vector3(1936.0697021484, 3727.2839355469, 32.84)
        }
    },
    {
        type = "barber",
        coords = vector4(1212.8, -472.9, 65.2, 60.94),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1208.3327636719, -469.84338378906, 65.2),
            vector3(1217.9066162109, -472.40216064453, 65.2),
            vector3(1216.9870605469, -477.00939941406, 65.2),
            vector3(1206.1077880859, -473.83499145508, 65.2)
        }
    },
    {
        type = "barber",
        coords = vector4(-32.9, -152.3, 56.1, 335.22),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-29.730783462524, -148.67495727539, 56.1),
            vector3(-32.919719696045, -158.04254150391, 56.1),
            vector3(-37.612594604492, -156.62759399414, 56.1),
            vector3(-33.30192565918, -147.31649780273, 56.1)
        }
    },
    {
        type = "barber",
        coords = vector4(-278.1, 6228.5, 30.7, 49.32),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-280.29818725586, 6232.7265625, 30.7),
            vector3(-273.06427001953, 6225.9692382812, 30.7),
            vector3(-276.25280761719, 6222.4013671875, 30.7),
            vector3(-282.98211669922, 6230.015625, 30.7)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1322.6, -1651.9, 51.2, 42.47),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1323.9360351562, -1649.2370605469, 51.2),
            vector3(1328.0186767578, -1654.3087158203, 51.2),
            vector3(1322.5780029297, -1657.7045898438, 51.2),
            vector3(1319.2043457031, -1653.0885009766, 51.2)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-1154.01, -1425.31, 4.95, 23.21),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1152.7110595703, -1422.8382568359, 4.95),
            vector3(-1149.0043945312, -1428.1975097656, 4.95),
            vector3(-1154.6730957031, -1431.1898193359, 4.95),
            vector3(-1157.7064208984, -1426.3433837891, 4.95)
        }
    },
    {
        type = "tattoo",
        coords = vector4(322.62, 180.34, 103.59, 156.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(319.28741455078, 179.9383392334, 103.59),
            vector3(321.537109375, 186.04516601562, 103.59),
            vector3(327.24526977539, 183.12303161621, 103.59),
            vector3(325.01351928711, 177.8542175293, 103.59)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-3169.52, 1074.86, 20.83, 253.29),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3169.5861816406, 1072.3740234375, 20.83),
            vector3(-3175.4802246094, 1075.0703125, 20.83),
            vector3(-3172.2041015625, 1080.5860595703, 20.83),
            vector3(-3167.076171875, 1078.0391845703, 20.83)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1864.1, 3747.91, 33.03, 17.23),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1860.2752685547, 3750.1608886719, 33.03),
            vector3(1866.390625, 3752.8081054688, 33.03),
            vector3(1868.6164550781, 3747.3562011719, 33.03),
            vector3(1863.65234375, 3744.5034179688, 33.03)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-294.24, 6200.12, 31.49, 195.72),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-289.42239379883, 6198.68359375, 31.49),
            vector3(-294.69515991211, 6194.5366210938, 31.49),
            vector3(-298.23013305664, 6199.2451171875, 31.49),
            vector3(-294.1501159668, 6203.2700195312, 31.49)
        }
    },
    {
        type = "surgeon",
        coords = vector4(308.0005, -595.4042, 43.2918, 204.1203),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(324.5689, -576.1712, 43.3174),
            vector3(327.6467, -577.5289, 43.3174),
            vector3(351.8404, -585.1766, 43.3150),
            vector3(355.4155, -586.5223, 43.3150)
        }
    }
}


Config.ClothingRooms = {
    {
        job = "police",
        coords = vector4(454.91, -990.89, 30.69, 193.4),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(460.41918945312, -993.11444091797, 30.69),
            vector3(449.39508056641, -993.60614013672, 30.69),
            vector3(449.88696289062, -990.23779296875, 30.69),
            vector3(450.97882080078, -989.71411132812, 30.69),
            vector3(451.0325012207, -987.89904785156, 30.69),
            vector3(453.47863769531, -987.76928710938, 30.69),
            vector3(454.35513305664, -988.46459960938, 30.69),
            vector3(460.4231262207, -987.94573974609, 30.69)
        }
    }
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[    {
        job = "police",
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(284.83, -574.01, 43.16),
            vector3(286.33, -570.03, 43.16),
            vector3(290.33, -571.74, 43.16),
            vector3(289.0, -574.75, 43.16)
        },
        citizenIDs = {
            "BHH65156"
        }
    }]]--
}

Config.Outfits = {
    ["police"] = {
        ["Male"] = {
            {
                name = "Aspirant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Surveillant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Agent",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Hoofdagent",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Brigadier",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Inspecteur",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Hoofdinspecteur",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Commissaris",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Hoofdcommissaris",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Eerste hoofdcommissaris",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 16, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
            {
                name = "Aspirant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Surveillant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Agent Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Hoofdagent Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Brigadier Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Inspecteur Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Hoofdinspecteur Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Commissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Hoofdcommissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Eerste hoofdcommissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 3}, -- Body Vest
                    ["torso2"] = {item = 26, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
        },
        ["Female"] = {
            {
                name = "Aspirant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Surveillant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Agent",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Hoofdagent",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Brigadier",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Inspecteur",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Hoofdinspecteur",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Commissaris",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Eerste hoofdcommissaris",
                outfitData = {
                    ["pants"] = {item = 17, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 17, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
            {
                name = "Aspirant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Surveillant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Agent Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Hoofdagent Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Brigadier Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Inspecteur Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Hoofdinspecteur Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Commissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Hoofdcommissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Eerste hoofdcommissaris Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 19, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
        }
    },
    ["kmar"] = {
        ["Male"] = {
            {
                name = "Marechaussee der 4e klasse",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Marechaussee der 3e klasse",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Marechaussee der 2e klasse",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Marechaussee der 1e klasse",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Wachtmeester",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Wachtmeester der 1e klasse",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Opperwachtmeester",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Adjudant-onderofficier",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Kornet",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Tweede luitenant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
            {
                name = "Eerste luitenant",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 10}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {10},
            },
            {
                name = "Kapitein",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 11}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {11},
            },
            {
                name = "Majoor",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 12}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {12},
            },
            {
                name = "Luitenant-kolonel",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 13}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {13},
            },
            {
                name = "Kolonel",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 14}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {14},
            },
            {
                name = "Brigadegeneraal",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 15}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {15},
            },
            {
                name = "Generaal-majoor",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 16}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {16},
            },
            {
                name = "Luitenant-generaal",
                outfitData = {
                    ["pants"] = {item = 17, texture = 3}, -- Pants
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 1}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 17}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {17},
            },
            {
                name = "Marechaussee der 4e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Marechaussee der 3e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Marechaussee der 2e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Marechaussee der 1e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Wachtmeester Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Wachtmeester der 1e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Opperwachtmeester Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Adjudant-onderofficier Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Kornet Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Tweede luitenant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
            {
                name = "Eerste luitenant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 10}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {10},
            },
            {
                name = "Kapitein Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 11}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {11},
            },
            {
                name = "Majoor Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 12}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {12},
            },
            {
                name = "Luitenant-kolonel Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 13}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {13},
            },
            {
                name = "Kolonel Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 14}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {14},
            },
            {
                name = "Brigadegeneraal Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 15}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {15},
            },
            {
                name = "Generaal-majoor Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 16}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {16},
            },
            {
                name = "Luitenant-generaal Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 139, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 22, texture = 0}, -- T Shirt
                    ["vest"] = {item = 22, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 27, texture = 17}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 16, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {17},
            },
        },
        ["Female"] = {
            {
                name = "Marechaussee der 4e klasse",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0},
            },
            {
                name = "Marechaussee der 3e klasse",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1},
            },
            {
                name = "Marechaussee der 2e klasse",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2},
            },
            {
                name = "Marechaussee der 1e klasse",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {3},
            },
            {
                name = "Wachtmeester",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {4},
            },
            {
                name = "Wachtmeester der 1e klasse",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {5},
            },
            {
                name = "Opperwachtmeester",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {6},
            },
            {
                name = "Adjudant-onderofficier",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {7},
            },
            {
                name = "Kornet",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {8},
            },
            {
                name = "Tweede luitenant",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {9},
            },
            {
                name = "Eerste luitenant",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 10}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {10},
            },
            {
                name = "Kapitein",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 11}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {11},
            },
            {
                name = "Majoor",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 12}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {12},
            },
            {
                name = "Luitenant-kolonel",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 13}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {13},
            },
            {
                name = "Kolonel",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 14}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {14},
            },
            {
                name = "Brigadegeneraal",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 15}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {15},
            },
            {
                name = "Generaal-majoor",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 16}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {16},
            },
            {
                name = "Luitenant-generaal",
                outfitData = {
                    ["pants"] = {item = 18, texture = 0}, -- Pants
                    ["arms"] = {item = 153, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 13, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 16, texture = 17}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 15, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {17},
            },
            {
                name = "Marechaussee der 4e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 0}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {0},
            },
            {
                name = "Marechaussee der 3e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 1}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {1},
            },
            {
                name = "Marechaussee der 2e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 2}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {2},
            },
            {
                name = "Marechaussee der 1e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 3}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {3},
            },
            {
                name = "Wachtmeester Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 4}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {4},
            },
            {
                name = "Wachtmeester der 1e klasse Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 5}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {5},
            },
            {
                name = "Opperwachtmeester Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 6}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {6},
            },
            {
                name = "Adjudant-onderofficier Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 7}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {7},
            },
            {
                name = "Kornet Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 8}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {8},
            },
            {
                name = "Tweede luitenant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 9}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {9},
            },
            {
                name = "Eerste luitenant Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 10}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {10},
            },
            {
                name = "Kapitein Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 11}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {11},
            },
            {
                name = "Majoor Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 12}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {12},
            },
            {
                name = "Luitenant-kolonel Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 13}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {13},
            },
            {
                name = "Kolonel Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 14}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {14},
            },
            {
                name = "Brigadegeneraal Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 15}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {15},
            },
            {
                name = "Generaal-majoor Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 16}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {16},
            },
            {
                name = "Luitenant-generaal Motor",
                outfitData = {
                    ["pants"] = {item = 16, texture = 1}, -- Pants
                    ["arms"] = {item = 215, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 21, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 21, texture = 17}, -- Jacket
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 21, texture = 1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hair"] = {item = 83, texture = 0}, -- Mask
                },
                grades = {17},
            },
        }
    },
    ["realestate"] = {
        ["Male"] = {
            {
                -- Outfits
                name = "Rekruut",
                outfitData = {
                    ["pants"]       = { item = 72, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 3, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 267, texture = 2},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Rekruut",
                outfitData = {
                    ["pants"]       = { item = 31, texture = 1},  -- Pants
                    ["arms"]        = { item = 7, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 95, texture = 0},  -- Jacket
                    ["shoes"]       = { item =18, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        }
    },
    ["ambulance"] = {
        ["Male"] = {
            {
                name = "Ambu",
                outfitData = {
                    ["arms"] = {item = 205, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 227, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 28, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 0, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 19, texture = 0}, -- Pants
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "MMT",
                outfitData = {
                    ["arms"] = {item = 205, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 227, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 29, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 0, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 20, texture = 0}, -- Pants
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            }
        },
    },
    ["anwb"] = {
        ["Male"] = {
            {
                name = "Werkkleding",
                outfitData = {
                    ["arms"] = {item = 198, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 228, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 18, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 0, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 16, texture = 0}, -- Pants
                    ["shoes"] = {item = 25, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
        },
        ["Female"] = {
            {
                name = "Werkkleding",
                outfitData = {
                    ["arms"] = {item = 0, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 220, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 23, texture = 2}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 0, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 20, texture = 0}, -- Pants
                    ["shoes"] = {item = 24, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
        },
    },
}

Config.InitialPlayerClothes = {
    Male = {
        Model = "mp_m_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 1,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 4,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 2,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 30,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 73,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 2,
            highlight = 28,
            style = 66,
            texture = 0
        }
    },
    Female = {
        Model = "mp_f_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 4,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable =31,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 11,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 26,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 30,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 27,
            texture = 0
        }
    }
}

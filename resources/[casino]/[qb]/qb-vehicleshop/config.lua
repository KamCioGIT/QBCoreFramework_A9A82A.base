Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10                              -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05                       -- Percent that goes to sales person from a finance sale 5%
Config.PaymentWarning = 10                            -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24                           -- time in hours between payment being due
Config.MinimumDown = 10                               -- minimum percentage allowed down
Config.MaximumPayments = 24                           -- maximum payments allowed
Config.PreventFinanceSelling = false                  -- allow/prevent players from using /transfervehicle if financed
Config.FilterByMake = false                           -- adds a make list before selecting category in shops
Config.SortAlphabetically = true                      -- will sort make, category, and vehicle selection menus alphabetically
Config.HideCategorySelectForOne = true                -- will hide the category selection menu if a shop only sells one category of vehicle or a make has only one category
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(92.39842224121, -150.5922088623),
                vector2(116.14587402344, -159.68258666992),
                vector2(146.21231079102, -170.364944458),
                vector2(157.0513305664, -141.30683898926),
                vector2(164.83581542968, -121.61571502686),
                vector2(152.74893188476, -119.65113067626),
                vector2(142.41996765136, -117.41095733642),
                vector2(141.00804138184, -120.03997039794),
                vector2(106.44162750244, -107.94728088378),
                vector2(102.3761062622, -123.1192779541)
            },
            ['minZ'] = 54.70,                                         -- min height of the shop zone
            ['maxZ'] = 60.5,                                         -- max height of the shop zone
            ['size'] = 3.75                                         -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'SasVegas Motorsport',                 -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 326,                                        -- Blip sprite
        ['blipColor'] = 3,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(117.0734, -150.4317, 54.8584),             -- Blip Location
        ['ReturnLocation'] = vector4(113.16, -119.57, 55.94, 247.88),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(119.26, -131.41, 54.68, 340.8),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(142.96, -126.54, 54.66, 51.36), -- Spawn location for test drive
        ['FinanceZone'] = vector3(149.37, -141.82, 54.8),          -- Where the finance menu is located
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(120.47, -156.28, 53.75, 26.59), -- where the vehicle will spawn on display
                defaultVehicle = 'q820',                       -- Default display vehicle
                chosenVehicle = 'q820',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(137.52, -162.61, 53.99, 24.23), -- where the vehicle will spawn on display
                defaultVehicle = 'm2',                       -- Default display vehicle
                chosenVehicle = 'm2',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [3] = {
                coords = vector4(131.69, -160.29, 53.91, 25.34), -- where the vehicle will spawn on display
                defaultVehicle = 'cats',                       -- Default display vehicle
                chosenVehicle = 'cats',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [4] = {
                coords = vector4(143.0, -164.27, 53.8, 24.75), -- where the vehicle will spawn on display
                defaultVehicle = 'trx',                       -- Default display vehicle
                chosenVehicle = 'trx',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [5] = {
                coords = vector4(137.13, -150.11, 53.99, 88.19), -- where the vehicle will spawn on display
                defaultVehicle = 'trhawk',                       -- Default display vehicle
                chosenVehicle = 'trhawk',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [6] = {
                coords = vector4(126.21, -158.74, 53.91, 23.78), -- where the vehicle will spawn on display
                defaultVehicle = 'mbc63',                       -- Default display vehicle
                chosenVehicle = 'mbc63',                        -- Same as default but is dynamically changed when swapping vehicles
            },
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-295.0595703125, -1370.4404296875),
                vector2(-296.3073425293, -1327.3903808594),
                vector2(-352.2612915039, -1335.8040771484),
                vector2(-355.86532592774, -1410.2923583984),
                vector2(-296.43463134766, -1409.3454589844)
            },
            ['minZ'] = 31.0,
            ['maxZ'] = 32.0,
            ['size'] = 6.75    -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Autodealer',
        ['showBlip'] = true,   -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,     -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-320.68, -1371.09, 31.87),
        ['ReturnLocation'] = vector3(-338.71, -1349.46, 30.62),
        ['VehicleSpawn'] = vector4(-346.86, -1359.39, 31.21, 0.4),
        ['TestDriveSpawn'] = vector4(-347.79, -1336.85, 30.64, 268.28), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-349.57, -1377.13, 31.86),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-326.24, -1370.07, 31.42, 271.85),
                defaultVehicle = 'gl63',
                chosenVehicle = 'gl63'
            },
            [2] = {
                coords = vector4(-320.07, -1381.9, 31.02, 290.87),
                defaultVehicle = '718caymans',
                chosenVehicle = '718caymans'
            },
            [3] = {
                coords = vector4(-332.08, -1380.47, 30.94, 295.44),
                defaultVehicle = '488',
                chosenVehicle = '488'
            },
            [4] = {
                coords = vector4(-332.96, -1357.9, 30.77, 235.83),
                defaultVehicle = '650s',
                chosenVehicle = '650s'
            },
            [5] = {
                coords = vector4(-319.83, -1360.3, 30.89, 193.06),
                defaultVehicle = 'rculi',
                chosenVehicle = 'rculi'
            },
            [6] = {
                coords = vector4(-319.95, -1397.59, 30.26, 303.96),
                defaultVehicle = 'agerars',
                chosenVehicle = 'agerars'
            },
            [7] = {
                coords = vector4(-326.02, -1397.71, 30.37, 307.96),
                defaultVehicle = 'feltzer2',
                chosenVehicle = 'feltzer2'
            },
            [8] = {
                coords = vector4(-331.03, -1397.91, 30.29, 317.98),
                defaultVehicle = 'huracanst',
                chosenVehicle = 'huracanst'
            },
            [9] = {
                coords = vector4(-335.37, -1405.57, 30.28, 217.85),
                defaultVehicle = 'rsvr16',
                chosenVehicle = 'rsvr16'
            },
            [10] = {
                coords = vector4(-348.61, -1397.82, 28.09, 256.68),
                defaultVehicle = 'dawnonyx',
                chosenVehicle = 'dawnonyx'
            },
        }
    },                         -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
            vector2(-813.1420288086, -1332.9754638672),
            vector2(-817.17553710938, -1337.880493164),
            vector2(-829.4302368164, -1352.5871582032),
            vector2(-821.7857055664, -1375.0656738282),
            vector2(-802.02209472656, -1380.9561767578),
            vector2(-788.9140625, -1377.0333251954),
            vector2(-773.22509765625, -1392.501586914),
            vector2(-718.19744873046, -1327.2489013672),
            vector2(-735.00982666016, -1313.3989257812),
            vector2(-758.27758789062, -1340.2307128906),
            vector2(-783.66345214844, -1338.2681884766)
            },
            ['minZ'] = 0.0,                                            -- min height of the shop zone
            ['maxZ'] = 6.0,                                            -- max height of the shop zone
            ['size'] = 4.5                                             -- size of the vehicles zones
        },
        ['Job'] = 'none',                                              -- Name of job or none
        ['ShopLabel'] = 'Boten Winkel',                                 -- Blip name
        ['showBlip'] = true,                                           -- true or false
        ['blipSprite'] = 410,                                          -- Blip sprite
        ['blipColor'] = 3,                                             -- Blip color
        ['TestDriveTimeLimit'] = 1.5,                                  -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-806.14, -1354.51, 5.18),                -- Blip Location
        ['ReturnLocation'] = vector3(-725.1786, -1325.6919, 0.1336),          -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-768.1235, -1378.9619, 0.0286, 229.1503),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-761.9185, -1370.1897, 0.0257, 231.9652), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-787.81, -1349.96, 5.18),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-799.1813, -1345.5194, 4.5012, 149.3729), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark',                      -- Default display vehicle
                chosenVehicle = 'seashark'                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-802.1482, -1345.0114, 4.5012, 148.6474),
                defaultVehicle = 'seashark',
                chosenVehicle = 'seashark'
            },
            [3] = {
                coords = vector4(-805.1077, -1344.6500, 4.5012, 148.9210),
                defaultVehicle = 'seashark',
                chosenVehicle = 'seashark'
            },
            [4] = {
                coords = vector4(-815.5290, -1360.1199, 5.5360, 22.6998),
                defaultVehicle = 'tropic',
                chosenVehicle = 'tropic'
            },
        },
    },
    ['air'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-1607.58, -3141.7),
                vector2(-1672.54, -3103.87),
                vector2(-1703.49, -3158.02),
                vector2(-1646.03, -3190.84)
            },
            ['minZ'] = 12.99,                                            -- min height of the shop zone
            ['maxZ'] = 16.99,                                            -- max height of the shop zone
            ['size'] = 7.0,                                              -- size of the vehicles zones
        },
        ['Job'] = 'none',                                                -- Name of job or none
        ['ShopLabel'] = 'Air Shop',                                      -- Blip name
        ['showBlip'] = true,                                             -- true or false
        ['blipSprite'] = 251,                                            -- Blip sprite
        ['blipColor'] = 3,                                               -- Blip color
        ['TestDriveTimeLimit'] = 1.5,                                    -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-1652.76, -3143.4, 13.99),                -- Blip Location
        ['ReturnLocation'] = vector3(-1628.44, -3104.7, 13.94),          -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-1617.49, -3086.17, 13.94, 329.2),    -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-1625.19, -3103.47, 13.94, 330.28), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-1619.52, -3152.64, 14.0),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1651.36, -3162.66, 12.99, 346.89), -- where the vehicle will spawn on display
                defaultVehicle = 'volatus',                          -- Default display vehicle
                chosenVehicle = 'volatus'                            -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-1668.53, -3152.56, 12.99, 303.22),
                defaultVehicle = 'luxor2',
                chosenVehicle = 'luxor2'
            },
            [3] = {
                coords = vector4(-1632.02, -3144.48, 12.99, 31.08),
                defaultVehicle = 'nimbus',
                chosenVehicle = 'nimbus'
            },
            [4] = {
                coords = vector4(-1663.74, -3126.32, 12.99, 275.03),
                defaultVehicle = 'frogger',
                chosenVehicle = 'frogger'
            },
        },
    },
    ['truck'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(856.91046142578, -1181.4660644532),
                vector2(922.666015625, -1178.8934326172),
                vector2(921.7074584961, -1153.4362792968),
                vector2(894.02233886718, -1153.185180664),
                vector2(894.08135986328, -1154.2734375),
                vector2(887.91284179688, -1154.3431396484),
                vector2(887.76403808594, -1155.2556152344),
                vector2(872.04608154296, -1155.3488769532),
                vector2(872.05163574218, -1139.1412353516),
                vector2(857.6060180664, -1139.501953125)
            },
            ['minZ'] = 22.0,                                         -- min height of the shop zone
            ['maxZ'] = 28.0,                                         -- max height of the shop zone
            ['size'] = 5.75                                          -- size of the vehicles zones
        },
        ['Job'] = 'anwb',                                            -- Name of job or none
        ['ShopLabel'] = 'Truck Motor Shop',                          -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 477,                                        -- Blip sprite
        ['blipColor'] = 2,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(900.47, -1155.74, 25.16),             -- Blip Location
        ['ReturnLocation'] = vector3(900.47, -1155.74, 25.16),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(909.35, -1181.58, 25.55, 177.57), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(867.65, -1192.4, 25.37, 95.72), -- Spawn location for test drive
        ['FinanceZone'] = vector3(900.46, -1154.86, 25.16),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(890.84, -1170.92, 24.68, 269.58), -- where the vehicle will spawn on display
                defaultVehicle = 'flatbed',                         -- Default display vehicle
                chosenVehicle = 'flatbed',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(878.45, -1171.04, 24.65, 273.08),
                defaultVehicle = 'phantom',
                chosenVehicle = 'phantom'
            },
            [3] = {
                coords = vector4(880.44, -1163.59, 24.47, 273.08),
                defaultVehicle = 'mule',
                chosenVehicle = 'mule'
            },
            [4] = {
                coords = vector4(896.95, -1162.62, 24.58, 273.08),
                defaultVehicle = 'mixer',
                chosenVehicle = 'mixer'
            },
        },
    },
    ['motor'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
            vector2(-853.08905029296, -206.56303405762),
            vector2(-871.25354003906, -174.93673706054),
            vector2(-889.2763671875, -185.25619506836),
            vector2(-876.29608154296, -207.91342163086),
            vector2(-864.12677001954, -209.14036560058)
            },
            ['minZ'] = 37.0,                                         -- min height of the shop zone
            ['maxZ'] = 38.5,                                         -- max height of the shop zone
            ['size'] = 2.75                                          -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'SasVegas Motordealer',                          -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 661,                                        -- Blip sprite
        ['blipColor'] = 2,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-868.28, -194.1, 37.84),             -- Blip Location
        ['ReturnLocation'] = vector3(-863.91, -185.32, 37.07),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-854.93, -200.95, 36.84, 245.31), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-888.49, -186.63, 37.27, 22.23), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-873.32, -199.26, 37.84),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-876.47, -183.85, 36.8, 336.64), -- where the vehicle will spawn on display
                defaultVehicle = 'kza1000',                         -- Default display vehicle
                chosenVehicle = 'kza1000',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-879.99, -188.67, 36.86, 339.79), -- where the vehicle will spawn on display
                defaultVehicle = 'hdss',                         -- Default display vehicle
                chosenVehicle = 'hdss',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [3] = {
                coords = vector4(-878.34, -191.32, 36.83, 333.49), -- where the vehicle will spawn on display
                defaultVehicle = 'yzf',                         -- Default display vehicle
                chosenVehicle = 'yzf',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [4] = {
                coords = vector4(-871.76, -184.64, 36.79, 331.77), -- where the vehicle will spawn on display
                defaultVehicle = 'yr6',                         -- Default display vehicle
                chosenVehicle = 'yr6',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [5] = {
                coords = vector4(-870.28, -186.76, 36.72, 334.53), -- where the vehicle will spawn on display
                defaultVehicle = 'gsxr',                         -- Default display vehicle
                chosenVehicle = 'gsxr',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [6] = {
                coords = vector4(-876.67, -193.97, 36.79, 334.87), -- where the vehicle will spawn on display
                defaultVehicle = 'ktmpit',                         -- Default display vehicle
                chosenVehicle = 'ktmpit',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [7] = {
                coords = vector4(-868.92, -189.57, 36.86, 335.73), -- where the vehicle will spawn on display
                defaultVehicle = 'dgp215',                         -- Default display vehicle
                chosenVehicle = 'dgp215',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [8] = {
                coords = vector4(-861.41, -202.4, 36.92, 335.41), -- where the vehicle will spawn on display
                defaultVehicle = 'ddrr',                         -- Default display vehicle
                chosenVehicle = 'ddrr',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [9] = {
                coords = vector4(-862.85, -200.28, 36.88, 332.96), -- where the vehicle will spawn on display
                defaultVehicle = 'aprsv4',                         -- Default display vehicle
                chosenVehicle = 'aprsv4',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [10] = {
                coords = vector4(-864.02, -197.84, 36.77, 335.01), -- where the vehicle will spawn on display
                defaultVehicle = 'bmwsr',                         -- Default display vehicle
                chosenVehicle = 'bmwsr',                          -- Same as default but is dynamically changed when swapping vehicles
            },
        },
    },
}

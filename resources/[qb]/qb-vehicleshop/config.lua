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
            vector2(92.277854919434, -151.28515625),
            vector2(125.14143371582, -163.8318786621),
            vector2(146.2108001709, -171.00521850586),
            vector2(152.6324005127, -154.99388122558),
            vector2(161.73318481446, -129.73258972168),
            vector2(154.23509216308, -122.92863464356),
            vector2(133.81127929688, -116.92673492432),
            vector2(109.12507629394, -108.91673278808),
            vector2(102.68885040284, -120.1838684082)
            },
            ['minZ'] = 54.4,                                         -- min height of the shop zone
            ['maxZ'] = 59.11,                                         -- max height of the shop zone
            ['size'] = 2.75                                       -- size of the vehicles zones
        },
        ['Job'] = 'none',                                            -- Name of job or none
        ['ShopLabel'] = 'Sas Vegas Deluxe Motorsport',                 -- Blip name
        ['showBlip'] = true,                                         -- true or false
        ['blipSprite'] = 326,                                        -- Blip sprite
        ['blipColor'] = 3,                                           -- Blip color
        ['TestDriveTimeLimit'] = 0.5,                                -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(112.18, -150.9, 54.58),             -- Blip Location
        ['ReturnLocation'] = vector3(96.67, -148.43, 54.63),       -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(146.12, -136.14, 54.61, 339.23),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(122.78, -120.31, 54.59, 41.04), -- Spawn location for test drive
        ['FinanceZone'] = vector3(118.74, -126.96, 60.49),          -- Where the finance menu is located
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(126.86, -156.92, 53.80, 329.87), -- where the vehicle will spawn on display
                defaultVehicle = 'amdbx',                       -- Default display vehicle
                chosenVehicle = 'amdbx',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(134.46, -160.09, 53.80, 331.11), -- where the vehicle will spawn on display
                defaultVehicle = 'ast',                       -- Default display vehicle
                chosenVehicle = 'ast',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [3] = {
                coords = vector4(142.15, -163.01, 53.80, 356.87), -- where the vehicle will spawn on display
                defaultVehicle = 'rs72020',                       -- Default display vehicle
                chosenVehicle = 'rs72020',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [4] = {
                coords = vector4(145.95, -155.56, 53.80, 99.11), -- where the vehicle will spawn on display
                defaultVehicle = 'aaq4',                       -- Default display vehicle
                chosenVehicle = 'aaq4',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [5] = {
                coords = vector4(147.38, -151.8, 53.80, 51.25), -- where the vehicle will spawn on display
                defaultVehicle = 'sq72016',                       -- Default display vehicle
                chosenVehicle = 'sq72016',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [6] = {
                coords = vector4(114.39, -146.73, 53.80, 146.14), -- where the vehicle will spawn on display
                defaultVehicle = 'cgts',                       -- Default display vehicle
                chosenVehicle = 'cgts',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [7] = {
                coords = vector4(123.31, -140.78, 53.80, 123.8), -- where the vehicle will spawn on display
                defaultVehicle = 'm2',                       -- Default display vehicle
                chosenVehicle = 'm2',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [8] = {
                coords = vector4(125.6, -143.22, 53.80, 113.01), -- where the vehicle will spawn on display
                defaultVehicle = 'm3f80',                       -- Default display vehicle
                chosenVehicle = 'm3f80',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [9] = {
                coords = vector4(119.89, -145.3, 53.80, 183.49), -- where the vehicle will spawn on display
                defaultVehicle = 'z419',                       -- Default display vehicle
                chosenVehicle = 'z419',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [10] = {
                coords = vector4(118.79, -152.7, 53.80, 95.48), -- where the vehicle will spawn on display
                defaultVehicle = 'bolide',                       -- Default display vehicle
                chosenVehicle = 'bolide',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [11] = {
                coords = vector4(137.16, -142.56, 53.80, 128.84), -- where the vehicle will spawn on display
                defaultVehicle = 'camrs17',                       -- Default display vehicle
                chosenVehicle = 'camrs17',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [12] = {
                coords = vector4(139.26, -144.2, 53.80, 153.2), -- where the vehicle will spawn on display
                defaultVehicle = 'c7',                       -- Default display vehicle
                chosenVehicle = 'c7',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [13] = {
                coords = vector4(139.49, -153.46, 53.80, 37.94), -- where the vehicle will spawn on display
                defaultVehicle = 'chr20',                       -- Default display vehicle
                chosenVehicle = 'chr20',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [14] = {
                coords = vector4(132.49, -151.58, 53.80, 44.25), -- where the vehicle will spawn on display
                defaultVehicle = 'ram2500',                       -- Default display vehicle
                chosenVehicle = 'ram2500',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [15] = {
                coords = vector4(116.63, -137.39, 59.80, 227.56), -- where the vehicle will spawn on display
                defaultVehicle = 'f812',                       -- Default display vehicle
                chosenVehicle = 'f812',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [16] = {
                coords = vector4(138.42, -150.62, 59.80, 0.84), -- where the vehicle will spawn on display
                defaultVehicle = 'trhawk',                       -- Default display vehicle
                chosenVehicle = 'trhawk',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [17] = {
                coords = vector4(133.91, -150.55, 59.80, 318.12), -- where the vehicle will spawn on display
                defaultVehicle = 'urus',                       -- Default display vehicle
                chosenVehicle = 'urus',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [18] = {
                coords = vector4(128.18, -149.64, 59.80, 12.97), -- where the vehicle will spawn on display
                defaultVehicle = 'lp700r',                       -- Default display vehicle
                chosenVehicle = 'lp700r',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [19] = {
                coords = vector4(114.46, -146.51, 59.7, 287.7), -- where the vehicle will spawn on display
                defaultVehicle = '720s',                       -- Default display vehicle
                chosenVehicle = '720s',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [20] = {
                coords = vector4(118.7, -153.37, 59.7, 343.96), -- where the vehicle will spawn on display
                defaultVehicle = 'g65',                       -- Default display vehicle
                chosenVehicle = 'g65',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [21] = {
                coords = vector4(122.67, -144.32, 59.8, 312.83), -- where the vehicle will spawn on display
                defaultVehicle = 'pcs18',                       -- Default display vehicle
                chosenVehicle = 'pcs18',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [22] = {
                coords = vector4(122.12, -139.3, 59.8, 287.2), -- where the vehicle will spawn on display
                defaultVehicle = 'twingo',                       -- Default display vehicle
                chosenVehicle = 'twingo',                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [23] = {
                coords = vector4(140.2, -142.49, 59.60, 233.85), -- where the vehicle will spawn on display
                defaultVehicle = 'rsvr16',                       -- Default display vehicle
                chosenVehicle = 'rsvr16',                        -- Same as default but is dynamically changed when swapping vehicles
            },
        },
    },
    ['luxury'] = {
        ['Type'] = 'free-use', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-1199.7362060546, -1762.4819335938),
                vector2(-1194.7795410156, -1768.3044433594),
                vector2(-1173.5373535156, -1770.1326904296),
                vector2(-1137.0053710938, -1743.7188720704),
                vector2(-1105.8626708984, -1721.3944091796),
                vector2(-1126.8970947266, -1693.5422363282),
                vector2(-1142.3500976562, -1673.6798095704),
                vector2(-1155.0325927734, -1676.7877197266),
                vector2(-1192.2214355468, -1702.9376220704),
                vector2(-1226.5134277344, -1727.6096191406)
            },
            ['minZ'] = 3.86,
            ['maxZ'] = 4.86,
            ['size'] = 2.75    -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true,   -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 3,     -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(-1158.32, -1714.82, 4.46),
        ['ReturnLocation'] = vector3(-1205.17, -1748.01, 4.45),
        ['VehicleSpawn'] = vector4(-1181.88, -1740.84, 4.45, 219.79),
        ['TestDriveSpawn'] = vector4(-1177.02, -1757.82, 4.45, 212.17), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-1174.99, -1705.62, 4.56),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-1181.25, -1724.57, 4.29, 188.8),
                defaultVehicle = 'rs6',
                chosenVehicle = 'rs6'
            },
            [2] = {
                coords = vector4(-1175.32, -1720.89, 3.9, 189.29),
                defaultVehicle = 'bbentayga',
                chosenVehicle = 'bbentayga'
            },
            [3] = {
                coords = vector4(-1169.54, -1716.68, 4.03, 192.69),
                defaultVehicle = 'regera',
                chosenVehicle = 'regera'
            },
            [4] = {
                coords = vector4(-1163.22, -1712.39, 4.1, 190.57),
                defaultVehicle = 'mbc63',
                chosenVehicle = 'mbc63'
            },
            [5] = {
                coords = vector4(-1156.88, -1707.57, 4.39, 187.94),
                defaultVehicle = 'gl63',
                chosenVehicle = 'gl63'
            },
            [6] = {
                coords = vector4(-1161.98, -1734.44, 4.24, 267.74),
                defaultVehicle = 'rrevoque',
                chosenVehicle = 'rrevoque'
            },
            [7] = {
                coords = vector4(-1157.81, -1731.67, 4.43, 253.53),
                defaultVehicle = 'rsvr16',
                chosenVehicle = 'rsvr16'
            },
            [8] = {
                coords = vector4(-1149.87, -1719.99, 3.94, 173.54),
                defaultVehicle = 'dawnonyx',
                chosenVehicle = 'dawnonyx'
            },
            [9] = {
                coords = vector4(-1143.63, -1722.38, 3.77, 272.31),
                defaultVehicle = 'rculi',
                chosenVehicle = 'rculi'
            },
            [10] = {
                coords = vector4(-1139.64, -1709.87, 3.96, 190.69),
                defaultVehicle = 'g65',
                chosenVehicle = 'g65'
            },
            [11] = {
                coords = vector4(-1131.43, -1703.39, 3.86, 179.26),
                defaultVehicle = 'gtr96',
                chosenVehicle = 'gtr96'
            },
        }
    },                         -- Add your next table under this comma
    ['boats'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a vehicle
        ['Zone'] = {
            ['Shape'] = {      --polygon that surrounds the shop
                vector2(-729.39, -1315.84),
                vector2(-766.81, -1360.11),
                vector2(-754.21, -1371.49),
                vector2(-716.94, -1326.88)
            },
            ['minZ'] = 0.0,                                            -- min height of the shop zone
            ['maxZ'] = 5.0,                                            -- max height of the shop zone
            ['size'] = 6.2                                             -- size of the vehicles zones
        },
        ['Job'] = 'none',                                              -- Name of job or none
        ['ShopLabel'] = 'Marina Shop',                                 -- Blip name
        ['showBlip'] = true,                                           -- true or false
        ['blipSprite'] = 410,                                          -- Blip sprite
        ['blipColor'] = 3,                                             -- Blip color
        ['TestDriveTimeLimit'] = 1.5,                                  -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-738.25, -1334.38, 1.6),                -- Blip Location
        ['ReturnLocation'] = vector3(-714.34, -1343.31, 0.0),          -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-727.87, -1353.1, -0.17, 137.09),   -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-722.23, -1351.98, 0.14, 135.33), -- Spawn location for test drive
        ['FinanceZone'] = vector3(-729.86, -1319.13, 1.6),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-727.05, -1326.59, 0.00, 229.5), -- where the vehicle will spawn on display
                defaultVehicle = 'seashark',                      -- Default display vehicle
                chosenVehicle = 'seashark'                        -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-732.84, -1333.5, -0.50, 229.5),
                defaultVehicle = 'dinghy',
                chosenVehicle = 'dinghy'
            },
            [3] = {
                coords = vector4(-737.84, -1340.83, -0.50, 229.5),
                defaultVehicle = 'speeder',
                chosenVehicle = 'speeder'
            },
            [4] = {
                coords = vector4(-741.53, -1349.7, -2.00, 229.5),
                defaultVehicle = 'marquis',
                chosenVehicle = 'marquis'
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
        ['Job'] = 'none',                                            -- Name of job or none
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
                coords = vector4(890.84, -1170.92, 25.08, 269.58), -- where the vehicle will spawn on display
                defaultVehicle = 'hauler',                         -- Default display vehicle
                chosenVehicle = 'hauler',                          -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(878.45, -1171.04, 25.05, 273.08),
                defaultVehicle = 'phantom',
                chosenVehicle = 'phantom'
            },
            [3] = {
                coords = vector4(880.44, -1163.59, 24.87, 273.08),
                defaultVehicle = 'mule',
                chosenVehicle = 'mule'
            },
            [4] = {
                coords = vector4(896.95, -1162.62, 24.98, 273.08),
                defaultVehicle = 'mixer',
                chosenVehicle = 'mixer'
            },
        },
    },
}

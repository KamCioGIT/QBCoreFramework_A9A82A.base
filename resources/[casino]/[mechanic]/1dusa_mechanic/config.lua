----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                     ----
----------------------------------------------------------------
Config = {}

--- @param -- Check https://lesimov.gitbook.io/dusa-docs for documentation

------------------------GENERAL OPTIONS------------------------
---------------------------------------------------------------
Config.BlipOptions = { -- https://docs.fivem.net/docs/game-references/blips/
  sprite = 446,
  color = 0,
  scale = 1.0,
}

Config.Settings = {
    nitro = {
        item = "nitrous", 
        multiplier = 1.10, -- propulsion coefficient when using nitro (don't increase it too much)
        time = 3000, -- how many seconds it will take when using nitro
        cooldown = 10000, -- cooldown for next nitro use
        stock = 5, -- nitro stock per item
        keyCode = 38, -- nitro key
    },
}

---------------------PLAYER MECHANICS--------------------------
---------------------------------------------------------------
--[[	
	You can add additional items to specified shop from here.

	id = Unique id for mechanic shop
	bossIdentifier = Identifier / Citizenid of mechanic owner !! IMPORTANT 
	job = Which job will work for this mechanic
	modify = {
        -- vector3(x, y, z) -- Create new vehicle customization locations
    }
    flatbed = {
        model = Towing vehicle model name
        coords = Determine location for towing vehicle spawn
        heading = Heading
    }
]]

Config.Mechanics = {
    [1] = {
        id = 1, --- @param WARNING!!! id has to be a value between 1 and 99
        bossIdentifier = "SEC61829", -- citizenid or identifier
        job = "anwb", --- @param WARNING!!! job value cant be same with other mechanics, you have to use another job for another mechanic
        bossMenu = vector3(876.89, -2096.62, 30.28),
        modify = {
            vector3(875.82, -2125.19, 30.31),
        },
        flatbed = {
            model = "flatbed",
            coords = vector3(862.47, -2141.09, 30.28),
            heading = 354.92
        }
    },
}

-------------------------TUNING TABLET-------------------------
---------------------------------------------------------------
Config.TuningAsItem = true -- true / false -- If its true, tuner tablet will be attached to tuningtablet item otherwise it will work with command 
Config.TuningCommand = 'tuning'
Config.MinimumGrade = 1 -- Define a min grade level for who can use 

Config.IncreaseSpeed = 35.0
Config.MaxSpeed = 999.0
---------------------------CRAFTING----------------------------
---------------------------------------------------------------
Config.CraftBenchs = {
    [1] = {
        id = 1,
        prop = "gr_prop_gr_bench_04b",
        craftbench = nil, -- the entity 
        openMenu = true,
		job = {"all"},
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        coords = {
            ["x"] = 885.48,
            ["y"] = -2101.04, 
            ["z"] = 29.47,
            ["h"] = 89.15
        }
    },
    [2] = {
        id = 1,
        prop = "gr_prop_gr_bench_04b",
        craftbench = nil, -- the entity 
        openMenu = true,
		job = {"all"},
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        coords = {
            ["x"] = 892.9,
            ["y"] = -2101.95, 
            ["z"] = 29.47,
            ["h"] = 89.15
        }
    },
}

Config.CraftItems = {
    [1] = {
        name = "Repair Kit",
        item = "repairkit",
        prop = "h4_prop_h4_tool_box_02",
        img = "https://media.discordapp.net/attachments/1086696690662244434/1189669722422267975/repairkit.png?ex=659f0144&is=658c8c44&hm=5375b3b11ceb85edbc9d6521121338f11a0534d78cc1d59882f5bd6d1a5130e0&=&format=webp&quality=lossless",
        requirements = {
            [1] = {
                name = "Iron",
                item = "iron",
                owned = 0,
                count = 6
            },
            [2] = {
                name = "Copper",
                item = "copper",
                owned = 0,
                count = 2
            },
            [3] = {
                name = "Screw Driver",
                item = "screwdriverset",
                owned = 0,
                count = 1
            },
        }
    },
    [2] = {
        name = "Tyre Kit",
        item = "tyrekit",
        prop = "xm3_prop_xm3_tool_box_02a",
        img = "https://media.discordapp.net/attachments/1086696690662244434/1189669892199293071/tyrekit.png?ex=659f016d&is=658c8c6d&hm=52f91cbbc41aee2a99c5597459acbed43d842ce519484a67f7e088468d53afe9&=&format=webp&quality=lossless",
        requirements = {
            [1] = {
                name = "Iron",
                item = "iron",
                owned = 0,
                count = 6
            },
            [2] = {
                name = "Copper",
                item = "copper",
                owned = 0,
                count = 2
            },
            [3] = {
                name = "Screw Driver",
                item = "screwdriverset",
                owned = 0,
                count = 1
            },
            [4] = {
                name = "Wheel",
                item = "wheel",
                owned = 0,
                count = 1
            },
        }
    },
    [3] = {
        name = "Cleaning Kit",
        item = "cleaningkit",
        prop = "sf_prop_sf_cleaning_pad_01a",
        img = "https://static.vecteezy.com/system/resources/thumbnails/024/490/325/small/cleaning-items-ai-generated-free-png.png",
        requirements = {
            [1] = {
                name = "Cloth",
                item = "cloth",
                owned = 0,
                count = 2
            },
        }
    },
    [4] = {
        name = "Plate",
        item = "plate",
        prop = "p_num_plate_03",
        img = "https://media.discordapp.net/attachments/1086696690662244434/1189670290612031590/license_plate.png?ex=659f01cc&is=658c8ccc&hm=1036301e1ebbf3e36bbb4e4fff9a9fde744d8f46180845bc86e61a24340c698f&=&format=webp&quality=lossless&width=676&height=676",
        requirements = {
            [1] = {
                name = "Iron",
                item = "iron",
                owned = 0,
                count = 20
            },
            [2] = {
                name = "Copper",
                item = "copper",
                owned = 0,
                count = 15
            },
        }
    },
    [5] = {
        name = "Nitrous",
        item = "nitrous",
        prop = "w_am_flare",
        img = "https://media.discordapp.net/attachments/1086696690662244434/1189669666818367569/nitrous.png?ex=659f0137&is=658c8c37&hm=be04b2798422b2cde3a3b346c42e1ac94329ede41fc4cead8a38473721d3ea5c&=&format=webp&quality=lossless",
        requirements = {
            [1] = {
                name = "Essence",
                item = "essence",
                owned = 0,
                count = 20
            },
            [2] = {
                name = "Iron",
                item = "iron",
                owned = 0,
                count = 50
            },
        }
    },
    [6] = {
        name = "Tuning Tablet",
        item = "tuningtablet",
        prop = "imp_prop_impexp_tablet",
        img = "https://media.discordapp.net/attachments/1086696690662244434/1191844833749389362/tablet.png?ex=65a6eaff&is=659475ff&hm=79c82c21c1feb9b4bd7752dd29231922f5c991c86eb8b3a05396ac31026c7dac&=&format=webp&quality=lossless",
        requirements = {
            [1] = {
                name = "Copper",
                item = "copper",
                owned = 0,
                count = 100
            },
            [2] = {
                name = "Iron",
                item = "iron",
                owned = 0,
                count = 150
            },
        }
    },
}

--------------------------CAR LIFT-----------------------------
---------------------------------------------------------------
Config.Speed_up = 0.005 -- the speed the lift is going up
Config.Speed_up_slow = 0.001 -- between "max" and "beforemax"
Config.Speed_down_slow = 0.001 -- between "min" and "beforemin"
Config.Speed_down = 0.005 -- the speed the lift is going down

Config.LiftPlatformModel = "prop_spray_jackframe"
Config.LiftPoleModel = "prop_spray_jackleg"
Config.LiftElecBox = "prop_elecbox_02b"
Config.SpawnElectraBox = true
Config.BoxOffset = {
    ["x"] = 0.0,
    ["y"] = -3.3,
    ["z"] = -0.7,
    ["h"] = 0.0
}
Config.UseAsJob = true -- job access only. (the jobs you add in you lift setup)
--
Config.PoleZOffzet = -0.30
--
Config.Fontawesome = {
    close_menu = "fa-solid fa-angle-left",
    item_menu = "fa-solid fa-angle-right",
    open_menu = "fa-solid fa-circle-info"
}

Config.Elevators = {
    [1] = { -- Bennys
        id = 1,
        min = 30.3,
        max = 32.0,
        beforemax = 31.6,
        beforemin = 30.6,
        elevator = nil, -- dont edit this one
        needPoles = true,
        openMenu = true,
		job = {"all"},
        workarea = {
            length = 7.0,
            wide = 7.0
        },
        coords = {
            ["x"] = -213.536,
            ["y"] = -1324.44,
            ["z"] = 30.2,
            ["h"] = 268.19
        }
    }
}

-- Configure attachment offset for specified vehicle
Config.VehicleAttachOffset = {
    ['massacro'] = {
        x = 0.0, -- +forward/-bankward
        y = 0.0, -- +left/-right
        z = 0.36 -- +up/-down
    },
    ['sultanrs'] = {
        x = 0.0, -- +forward/-bankward
        y = 0.0, -- +left/-right
        z = 0.36 -- +up/-down
    },

    -- add more vehicles here
}

----------------------------TOWING-----------------------------
---------------------------------------------------------------
Config.TowCommand = 'tow' -- Command name to run tow menu

Config.whitelist = { -- when adding add-on cars simply use their spawn name
    'FLATBED',
    'BENSON',
    'WASTLNDR', -- WASTELANDER
    'MULE',
    'MULE2',
    'MULE3',
    'MULE4',
    'TRAILER', -- TRFLAT
    'ARMYTRAILER',
    'BOATTRAILER',
}

-- Adjust offsets for towing vehicles
Config.offsets = { -- when adding add-on cars simply use their spawn name
    {model = 'FLATBED', offset = {x = 0.0, y = -9.0, z = -1.25}}, -- x -> Left/Right adjustment | y -> Forward/Backward adjustment | z -> Height adjustment
    {model = 'BENSON', offset = {x = 0.0, y = 0.0, z = -1.25}},
    {model = 'WASTLNDR', offset = {x = 0.0, y = -7.2, z = -0.9}},
    {model = 'MULE', offset = {x = 0.0, y = -7.0, z = -1.75}},
    {model = 'MULE2', offset = {x = 0.0, y = -7.0, z = -1.75}},
    {model = 'MULE3', offset = {x = 0.0, y = -7.0, z = -1.75}},
    {model = 'MULE4', offset = {x = 0.0, y = -7.0, z = -1.75}},
    {model = 'TRAILER', offset = {x = 0.0, y = -9.0, z = -1.25}},
    {model = 'ARMYTRAILER', offset = {x = 0.0, y = -9.5, z = -3.0}},
}

-- The ramp that will spawned behind of the vehicle
RampHash = 'imp_prop_flatbed_ramp'

----------------------VEHICLE PARTS----------------------------
---------------------------------------------------------------
Config.Menus = {
    upgrades = {
        brakes = {
            basePrice = 5000,
            increaseby = 500,
        },
        transmission = {
            basePrice = 5000,
            increaseby = 500,
        },
        suspension = {
            basePrice = 5000,
            increaseby = 500,
        },
        engine = {
            basePrice = 5000,
            increaseby = 500,
        },
        turbo = 5000,
    },
    customization = {
        spoiler = {
            basePrice = 1500,
            increaseby = 250,
        },
        skirts = {
            basePrice = 750,
            increaseby = 100,
        },
        exhausts = {
            basePrice = 1000,
            increaseby = 200,
        },
        grille = {
            basePrice = 750,
            increaseby = 150,
        },
        hood = {
            basePrice = 2200,
            increaseby = 350,
        },
        fenders = {
            basePrice = 1250,
            increaseby = 250,
        },
        roof = {
            basePrice = 1000,
            increaseby = 250,
        },
        horn = {
            basePrice = 500,
            increaseby = 0,
        },
        engine_block = {
            basePrice = 5000,
            increaseby = 1250,
        },
        air_filters = {
            basePrice = 3500,
            increaseby = 1000,
        },
        struts = {
            basePrice = 2500,
            increaseby = 250,
        },
        license_plate = {
            basePrice = 500,
            increaseby = 0,
        },
        plate_holders = {
            basePrice = 500,
            increaseby = 0,
        },
        vanity_plates = {
            basePrice = 750,
            increaseby = 250,
        },
        headlights = {
            basePrice = 1250,
            increaseby = 0,
        },
        front_bumper = {
            basePrice = 1250,
            increaseby = 250,
        },
        rear_bumper = {
            basePrice = 1250,
            increaseby = 250,
        },
        arch_cover = {
            basePrice = 750,
            increaseby = 250,
        },
        aerials = {
            basePrice = 500,
            increaseby = 150,
        },
        trim = {
            basePrice = 750,
            increaseby = 250,
        },
        tank = {
            basePrice = 500,
            increaseby = 250,
        },
        windows = {
            basePrice = 350,
            increaseby = 250,
        },
        frame = {
            basePrice = 1000,
            increaseby = 250,
        },
    },
    cosmetic = {
        headlight_color = {
            basePrice = 250,
            increaseby = 0,
        },
        livery = {
            basePrice = 500,
            increaseby = 0,
        },
        neon = {
            basePrice = 250,
            increaseby = 0,
        },
        window_tint = {
            basePrice = 100,
            increaseby = 50,
        },
        tire_smoke = {
            basePrice = 250,
            increaseby = 0,
        },
        trim_design = {
            basePrice = 500,
            increaseby = 150,
        },
        ornaments = {
            basePrice = 500,
            increaseby = 0,
        },
        dashboard = {
            basePrice = 500,
            increaseby = 100,
        },
        dial_design = {
            basePrice = 500,
            increaseby = 100,
        },
        door_speaker = {
            basePrice = 250,
            increaseby = 0,
        },
        seats = {
            basePrice = 250,
            increaseby = 150,
        },
        steering_wheels = {
            basePrice = 500,
            increaseby = 250,
        },
        shifter_leavers = {
            basePrice = 500,
            increaseby = 250,
        },
        plaques = {
            basePrice = 750,
            increaseby = 250,
        },
        speakers = {
            basePrice = 500,
            increaseby = 250,
        },
        trunk = {
            basePrice = 500,
            increaseby = 250,
        },
        wheels = {
            basePrice = 5000,
            increaseby = 0
        },
    },
    fitment = {
        price = 7500,
    },
    tuning = {
        vehicle_traction = 10000,
        tuner_chip = 25000,
        nitro = 15000,
        popcorn = 15000,
    },
    paintBooth = {
        color = 500, 
        pearlescent = 500, 
        chrome = 750, 
        chameleon = 2500, 
        neon = 250, 
        smoke = 250, 
        wheel = 250,
    },
    extras = {
        price = 250
    }
}

----------------------------------------------------------------
----                  CONFIGURE LANGUAGE                    ----
----------------------------------------------------------------
Config.Locale = 'nl' -- en / de / fr / es / tr / nl / it
Config.Translations = {
    ['en'] = {
        -- Notifications
        ['withdrawn'] = 'You have withdrawn $',
        ['deposited'] = 'You have deposited $',
        ['fee'] = 'Wash & Fix Fees are set to ',
        ['discount'] = 'Part discounts are set to ',
        ['name'] = 'Mechanic name set to ',
        ['sport'] = 'Sport mode is active!',
        ['drift'] = 'Drift mode is active!',
        ['ecos'] = 'Eco mode is active!',
        ['fitment'] = 'Fitment successfully applied to vehicle',
        ['notenoughmoney'] = 'You dont have enough money!',
        ['modified'] = 'You successfully modified the vehicle!',
        ['freecamactive'] = 'Freecam activated',
        ['freecamdeactive'] = 'Freecam deactivated',
        ['ranksupdated'] = 'Ranks are succesfully updated!',
        ['notmechanic'] = 'You dont have permission to use this command',
        ['notmechanicitem'] = 'You dont have permission to use this item',
        ['alreadymaxgrade'] = 'This player is already at the max grade!',
        ['alreadymingrade'] = 'This player is already at the min grade!',
        ['youpromoted'] = 'You have been promoted!',
        ['youdemoted'] = 'You have been demoted!',
        ['youhired'] = 'You hired as new mechanic employee!',
        ['safemoneynotenough'] = 'Your mechanic safe dont have enough money!',
        ['usednitro'] = 'You used a nitro, remaining: ',
        ['outofnitro'] = 'You are out of nitro boost stock!',

        -- Tow
        ['rampdeployed'] = 'Ramp has been deployed successfully!',
        ['needflatbed'] = 'You need a flatbed to deploy ramp',
        ['rampremoved'] = 'Ramp succesfully removed',
        ['getcloser'] = 'Please get closer to ramp',
        ['vehicleattached'] = 'Vehicle successfully attached!',
        ['alreadyattached'] = 'This vehicle is already attached!',
        ['couldntattach'] = 'Couldn\'t attach',
        ['todriverseat'] = 'You need to be at driver seat',
        ['notinveh'] = 'You are not in any vehicle',
        ['vehdetached'] = 'The vehicle has been successfully detached',
        ['isntattached'] = 'The vehicle isn\'t attached to anything',

        -- Text UI
        ['etocarlift'] = 'Press [E] to open car lift',
        ['etoattach'] = 'Press [E] to attach vehicle',
        ['etocraft'] = 'Press [E] to craft',
        ['etomechanic'] = 'Press [E] to open mechanic',
        ['etoboss'] = 'Press [E] to open boss menu',
        ['etotakeflatbed'] = 'Press [E] to take flatbed',
        ['etoreturnflatbed'] = 'Press [E] to return flatbed',

        -- UI
        ['dashboard'] = "Dashboard",
        ['settings'] = "Settings",
        ['employees'] = "Employees",
        ['managePerm'] = "Manage Permissions",
        ['managePermInfo'] = "Manage Permissions Info",
        ['employeeslist'] = "Employees List",
        ['addEmployee'] = "Add Employee",
        ['addnewemployee'] = "Add New Employee",
        ['addnewemployeedesc'] = "Add new employee to your mechanic",
        ['sellcompany'] = "Sell Company",
        ['totalassets'] = "Total Assets",
        ['totalemployees'] = "Total Employees",
        ['depositwithdraw'] = "DEPOSIT & WITHDRAW MONEYS",
        ['withdraw'] = "Withdraw Money",
        ['deposit'] = "Deposit Money",
        ['mechanicname'] = "Mechanic Name",
        ['setaname'] = "Set a name",
        ['mechanicdiscount'] = "Mechanic Discount",
        ['setdiscount'] = "Set a discount",
        ['vehiclecleaning'] = "wehicle clean & repair fee",
        ['updatefee'] = "Update Fee",
        ['areyousure'] = "Are you sure?",
        ['yes'] = "Yes",
        ['no'] = "No",
        ['history'] = "History",
        ['saveaname'] = "Save a name",
        ['savediscount'] = "Save discount",
        ['updateRank'] = "Update Rank",
        ['kickEmployee'] = "Kick Employee",
        ['applyChanges'] = "Apply Changes",

        ['error'] = "Error!",
        ['success'] = "Success!",
        ['info'] = "Info!",

        ['enter'] = "Enter",
        ['buy'] = "Buy",
        ['buyed'] = "Bought",
        ['washCar'] = "Wash Car",
        ['fixCar'] = "Fix Car",
        ['colorTitle'] = "Color Settings",
        ['primaryColor'] = "Primary Color",
        ['secondaryColor'] = "Secondary Color",
        ['classic'] = "Classic",
        ['metallic'] = "Metallic",
        ['matte'] = "Matte",
        ['metal'] = "Metal",
        ['chrome'] = "Chrome",
        ['pearlescent'] = "Pearlescent",
        ['card'] = "Card",
        ['delete'] = "Delete",
        ['total'] = "Total",
        ['paycash'] = "Pay Cash",
        ['paycard'] = "Pay Card",
        ['clearCard'] = "Clear Card",
        ['addCard'] = "Add Card",
        ['close'] = "Close",
        ['color'] = "Color",
        ['deleteCard'] = "Delete Card",
        ['notenoughmoney'] = "You dont have enough money",

        ['fitMenu'] = "Fit Menu",
        ['wheelsWidth'] = "Wheels Width",
        ['wheelsFrontLeft'] = "Wheels Front Left",
        ['wheelsFrontRight'] = "Wheels Front Right",
        ['wheelsRearLeft'] = "Wheels Rear Left",
        ['wheelsRearRight'] = "Wheels Rear Right",
        ['wheelsFrontCamberLeft'] = "Wheels Front Camber Left",
        ['wheelsFrontCamberRight'] = "Wheels Front Camber Right",
        ['wheelsRearCamberLeft'] = "Wheels Rear Camber Left",
        ['wheelsRearCamberRight'] = "Wheels Rear Camber Right",
        ['applySettings'] = "Apply Settings",

        ['tuningtitle'] = "Dusa Tuning",
        ['tuninginfo'] = "Tune your vehicle",
        ['mods'] = "Mods",
        ['detail'] = "Details",
        ['neon'] = "Neon",
        ['headlights'] = "Headlights",
        ['select'] = "Select",
        ['selected'] = "Selected",
        ['applySettings'] = "Apply Settings",
        ['cancel'] = "Cancel",
        ['boost'] = "Boost",
        ['acceleration'] = "Acceleration",
        ['breaking'] = "Breaking",
        ['gearchange'] = "Gear Change",
        ['drivetrain'] = "Drivetrain",
        ['front'] = "Front",
        ['back'] = "Back",
        ['left'] = "Left",
        ['right'] = "Right",
        ['rainbow'] = "Rainbow",
        ['default'] = "Default",
        ['snake'] = "Snake",
        ['crisscross'] = "Criss Cross",
        ['lightnings'] = "Lightning",
        ['fourways'] = "Four Ways",
        ['blinking'] = "Blinking",

        ['craft'] = "CRAFTING",
        ['bench'] = "BENCH",
        ['youritems'] = "YOUR ITEMS",
        ['craftdesc'] = "Craft best equipments for yourself!",
        ['needItems'] = "NEED ITEMS",
        ['craftItem'] = "CRAFT!",

        ['up'] = "Up",
        ['stop'] = "Stop",
        ['down'] = "Down",
        ['lifttitle'] = "Lift Control",
        ['liftdesc'] = "Manage car lift for vehicles",
        ['detachVehicle'] = "Detach Vehicle",

        ['sabit'] = "Attach",
        ['sabitcikar'] = "Detach",
        ['rampayiindir'] = "Toggle Ramp",
        ['towtitle'] = "Tow Vehicle",
        ['towdesc'] = "Transport a vehicle with flatbed!",
    },
    ['de'] = {
        -- Bildirimler
        ['withdrawn'] = 'Du hast abgehoben ',
        ['deposited'] = 'Du hast eingezahlt ',
        ['fee'] = 'Die Gebühren für Waschen & Reparieren sind auf ',
        ['discount'] = 'Teilrabatte sind auf ',
        ['name'] = 'Name des Mechanikers auf ',
        ['sport'] = 'Sportmodus ist aktiv!',
        ['drift'] = 'Driftmodus ist aktiv!',
        ['ecos'] = 'Eco-Modus ist aktiv!',
        ['fitment'] = 'Anpassung erfolgreich am Fahrzeug vorgenommen',
        ['notenoughmoney'] = 'Du hast nicht genug Geld!',
        ['modified'] = 'Du hast das Fahrzeug erfolgreich modifiziert!',
        ['freecamactive'] = 'Freikamera aktiviert',
        ['freecamdeactive'] = 'Freikamera deaktiviert',
        ['ranksupdated'] = 'Ränge wurden erfolgreich aktualisiert!',
        ['notmechanic'] = 'Du hast keine Berechtigung, diesen Befehl zu verwenden',
        ['notmechanicitem'] = 'Du hast keine Berechtigung, dieses Item zu verwenden',
        ['alreadymaxgrade'] = 'Dieser Spieler hat bereits den höchsten Rang erreicht!',
        ['alreadymingrade'] = 'Dieser Spieler hat bereits den niedrigsten Rang erreicht!',
        ['youpromoted'] = 'Du wurdest befördert!',
        ['youdemoted'] = 'Du wurdest degradiert!',
        ['youhired'] = 'Du bist als neuer Mechaniker eingestellt worden!',
        ['safemoneynotenough'] = 'Dein Mechaniker-Safe hat nicht genug Geld!',
        ['usednitro'] = 'Du hast ein Nitro benutzt, verbleibend: ',
        ['outofnitro'] = 'Dein Nitro-Vorrat ist erschöpft!',
    
        -- Çek
        ['rampdeployed'] = 'Rampe wurde erfolgreich ausgefahren!',
        ['needflatbed'] = 'Du brauchst einen Tieflader, um die Rampe auszufahren',
        ['rampremoved'] = 'Rampe erfolgreich entfernt',
        ['getcloser'] = 'Bitte komm näher zur Rampe',
        ['vehicleattached'] = 'Fahrzeug erfolgreich angehängt!',
        ['alreadyattached'] = 'Dieses Fahrzeug ist bereits angehängt!',
        ['couldntattach'] = 'Konnte nicht anhängen',
        ['todriverseat'] = 'Du musst am Fahrersitz sein',
        ['notinveh'] = 'Du bist in keinem Fahrzeug',
        ['vehdetached'] = 'Das Fahrzeug wurde erfolgreich abgehängt',
        ['isntattached'] = 'Das Fahrzeug ist an nichts angehängt',

        -- Text UI
        ['etocarlift'] = 'Fahrzeugheber öffnen mit [E] drücken',
        ['etoattach'] = 'Fahrzeug anhängen mit [E] drücken',
        ['etocraft'] = 'Handwerk mit [E] drücken',
        ['etomechanic'] = 'Werkstattmenü öffnen mit [E] drücken',
        ['etoboss'] = 'Boss-Menü öffnen mit [E] drücken',
        ['etotakeflatbed'] = 'Flachbett nehmen mit [E] drücken',
        ['etoreturnflatbed'] = 'Flachbett zurückgeben mit [E] drücken',

    
        -- Kullanıcı Arayüzü
        ['dashboard'] = "Armaturenbrett",
        ['settings'] = "Einstellungen",
        ['employees'] = "Mitarbeiter",
        ['managePerm'] = "Berechtigungen verwalten",
        ['managePermInfo'] = "Berechtigungsinfo verwalten",
        ['employeeslist'] = "Liste der Mitarbeiter",
        ['addEmployee'] = "Mitarbeiter hinzufügen",
        ['addnewemployee'] = "Neuen Mitarbeiter hinzufügen",
        ['addnewemployeedesc'] = "Füge einen neuen Mitarbeiter zu deinem Mechaniker hinzu",
        ['sellcompany'] = "Firma verkaufen",
        ['totalassets'] = "Gesamtvermögen",
        ['totalemployees'] = "Gesamtzahl der Mitarbeiter",
        ['depositwithdraw'] = "GELD EIN- UND AUSZAHLEN",
        ['withdraw'] = "Geld abheben",
        ['deposit'] = "Geld einzahlen",
        ['mechanicname'] = "Mechanikername",
        ['setaname'] = "Einen Namen setzen",
        ['mechanicdiscount'] = "Mechanikerrabatt",
        ['setdiscount'] = "Einen Rabatt setzen",
        ['vehiclecleaning'] = "Fahrzeugreinigung & Reparaturgebühr",
        ['updatefee'] = "Gebühr aktualisieren",
        ['areyousure'] = "Bist du sicher?",
        ['yes'] = "Ja",
        ['no'] = "Nein",
        ['history'] = "Verlauf",
        ['saveaname'] = "Einen Namen speichern",
        ['savediscount'] = "Rabatt speichern",
        ['updateRank'] = "Rang aktualisieren",
        ['kickEmployee'] = "Mitarbeiter rausschmeißen",
        ['applyChanges'] = "Änderungen übernehmen",
    
        ['error'] = "Fehler!",
        ['success'] = "Erfolg!",
        ['info'] = "Info!",
    
        ['enter'] = "Eingeben",
        ['buy'] = "Kaufen",
        ['buyed'] = "Gekauft",
        ['washCar'] = "Auto waschen",
        ['fixCar'] = "Auto reparieren",
        ['colorTitle'] = "Farbeinstellungen",
        ['primaryColor'] = "Primärfarbe",
        ['secondaryColor'] = "Sekundärfarbe",
        ['classic'] = "Klassisch",
        ['metallic'] = "Metallisch",
        ['matte'] = "Matt",
        ['metal'] = "Metall",
        ['chrome'] = "Chrom",
        ['pearlescent'] = "Perlfarben",
        ['card'] = "Karte",
        ['delete'] = "Löschen",
        ['total'] = "Gesamt",
        ['paycash'] = "Bar bezahlen",
        ['paycard'] = "Mit Karte bezahlen",
        ['clearCard'] = "Karte löschen",
        ['addCard'] = "Karte hinzufügen",
        ['close'] = "Schließen",
        ['color'] = "Farbe",
        ['deleteCard'] = "Karte löschen",
        ['notenoughmoney'] = "Du hast nicht genug Geld",
    
        ['fitMenu'] = "Anpassungsmenü",
        ['wheelsWidth'] = "Reifenbreite",
        ['wheelsFrontLeft'] = "Vorderräder links",
        ['wheelsFrontRight'] = "Vorderräder rechts",
        ['wheelsRearLeft'] = "Hinterräder links",
        ['wheelsRearRight'] = "Hinterräder rechts",
        ['wheelsFrontCamberLeft'] = "Vorderradsturz links",
        ['wheelsFrontCamberRight'] = "Vorderradsturz rechts",
        ['wheelsRearCamberLeft'] = "Hinterradsturz links",
        ['wheelsRearCamberRight'] = "Hinterradsturz rechts",
        ['applySettings'] = "Einstellungen anwenden",
    
        ['tuningtitle'] = "Dusa Tuning",
        ['tuninginfo'] = "Dein Fahrzeug tunen",
        ['mods'] = "Mods",
        ['detail'] = "Details",
        ['neon'] = "Neon",
        ['headlights'] = "Scheinwerfer",
        ['select'] = "Auswählen",
        ['selected'] = "Ausgewählt",
        ['applySettings'] = "Einstellungen anwenden",
        ['cancel'] = "Abbrechen",
        ['boost'] = "Boost",
        ['acceleration'] = "Beschleunigung",
        ['breaking'] = "Bremsen",
        ['gearchange'] = "Gangwechsel",
        ['drivetrain'] = "Antrieb",
        ['front'] = "Vorne",
        ['back'] = "Hinten",
        ['left'] = "Links",
        ['right'] = "Rechts",
        ['rainbow'] = "Regenbogen",
        ['default'] = "Standard",
        ['snake'] = "Schlange",
        ['crisscross'] = "Kreuz und Quer",
        ['lightnings'] = "Blitze",
        ['fourways'] = "Vier Wege",
        ['blinking'] = "Blinkend",
    
        ['craft'] = "HERSTELLUNG",
        ['bench'] = "BANK",
        ['youritems'] = "DEINE GEGENSTÄNDE",
        ['craftdesc'] = "Die besten Ausrüstungen für dich herstellen!",
        ['needItems'] = "BENÖTIGTE GEGENSTÄNDE",
        ['craftItem'] = "HERSTELLEN!",
    
        ['up'] = "Hoch",
        ['stop'] = "Stop",
        ['down'] = "Runter",
        ['lifttitle'] = "Hebekontrolle",
        ['liftdesc'] = "Autohebebühne für Fahrzeuge verwalten",
        ['detachVehicle'] = "Fahrzeug abhängen",
    
        ['sabit'] = "Anhängen",
        ['sabitcikar'] = "Abhängen",
        ['rampayiindir'] = "Rampe umschalten",
        ['towtitle'] = "Fahrzeug abschleppen",
        ['towdesc'] = "Transportiere ein Fahrzeug mit einem Tieflader!",
    },
    ['es'] = {
        -- Notificaciones
        ['withdrawn'] = 'Has retirado ',
        ['deposited'] = 'Has depositado ',
        ['fee'] = 'Las tarifas de Lavado y Reparación están establecidas en ',
        ['discount'] = 'Los descuentos parciales están establecidos en ',
        ['name'] = 'Nombre del mecánico establecido en ',
        ['sport'] = '¡El modo deportivo está activo!',
        ['drift'] = '¡El modo de deriva está activo!',
        ['ecos'] = '¡El modo Eco está activo!',
        ['fitment'] = 'Ajuste aplicado con éxito al vehículo',
        ['notenoughmoney'] = '¡No tienes suficiente dinero!',
        ['modified'] = 'Has modificado con éxito el vehículo',
        ['freecamactive'] = 'Cámara libre activada',
        ['freecamdeactive'] = 'Cámara libre desactivada',
        ['ranksupdated'] = '¡Los rangos se han actualizado correctamente!',
        ['notmechanic'] = 'No tienes permiso para usar este comando',
        ['notmechanicitem'] = 'No tienes permiso para usar este ítem',
        ['alreadymaxgrade'] = '¡Este jugador ya está en el rango máximo!',
        ['alreadymingrade'] = '¡Este jugador ya está en el rango mínimo!',
        ['youpromoted'] = '¡Has sido ascendido!',
        ['youdemoted'] = '¡Has sido degradado!',
        ['youhired'] = '¡Te contrataron como nuevo empleado mecánico!',
        ['safemoneynotenough'] = '¡Tu caja fuerte de mecánico no tiene suficiente dinero!',
        ['usednitro'] = 'Has utilizado un nitro, restantes: ',
        ['outofnitro'] = '¡Te has quedado sin stock de impulso de nitro!',
    
        -- Remolque
        ['rampdeployed'] = 'La rampa se ha desplegado con éxito!',
        ['needflatbed'] = 'Necesitas una plataforma para desplegar la rampa',
        ['rampremoved'] = 'Rampa retirada con éxito',
        ['getcloser'] = 'Por favor, acércate a la rampa',
        ['vehicleattached'] = '¡Vehículo adjuntado con éxito!',
        ['alreadyattached'] = 'Este vehículo ya está adjuntado!',
        ['couldntattach'] = 'No se pudo adjuntar',
        ['todriverseat'] = 'Necesitas estar en el asiento del conductor',
        ['notinveh'] = 'No estás en ningún vehículo',
        ['vehdetached'] = 'El vehículo se ha desprendido con éxito',
        ['isntattached'] = 'El vehículo no está adjuntado a nada',

        -- Text UI
        ['etocarlift'] = 'Presiona [E] para abrir el elevador de coches',
        ['etoattach'] = 'Presiona [E] para enganchar el vehículo',
        ['etocraft'] = 'Presiona [E] para fabricar',
        ['etomechanic'] = 'Presiona [E] para abrir el menú de mecánico',
        ['etoboss'] = 'Presiona [E] para abrir el menú de jefe',
        ['etotakeflatbed'] = 'Presiona [E] para tomar la plataforma plana',
        ['etoreturnflatbed'] = 'Presiona [E] para devolver la plataforma plana',
    
        -- IU
        ['dashboard'] = "Tablero",
        ['settings'] = "Configuración",
        ['employees'] = "Empleados",
        ['managePerm'] = "Gestionar Permisos",
        ['managePermInfo'] = "Información de Gestión de Permisos",
        ['employeeslist'] = "Lista de Empleados",
        ['addEmployee'] = "Agregar Empleado",
        ['addnewemployee'] = "Agregar nuevo empleado",
        ['addnewemployeedesc'] = "Añade un nuevo empleado a tu mecánico",
        ['sellcompany'] = "Vender Compañía",
        ['totalassets'] = "Total de Activos",
        ['totalemployees'] = "Total de Empleados",
        ['depositwithdraw'] = "DEPOSITAR Y RETIRAR DINERO",
        ['withdraw'] = "Retirar Dinero",
        ['deposit'] = "Depositar Dinero",
        ['mechanicname'] = "Nombre del Mecánico",
        ['setaname'] = "Establecer un nombre",
        ['mechanicdiscount'] = "Descuento del Mecánico",
        ['setdiscount'] = "Establecer un descuento",
        ['vehiclecleaning'] = "Tarifa de limpieza y reparación del vehículo",
        ['updatefee'] = "Actualizar Tarifa",
        ['areyousure'] = "¿Estás seguro?",
        ['yes'] = "Sí",
        ['no'] = "No",
        ['history'] = "Historia",
        ['saveaname'] = "Guardar un nombre",
        ['savediscount'] = "Guardar descuento",
        ['updateRank'] = "Actualizar Rango",
        ['kickEmployee'] = "Expulsar Empleado",
        ['applyChanges'] = "Aplicar Cambios",
    
        ['error'] = "Error!",
        ['success'] = "Éxito!",
        ['info'] = "Información!",
    
        ['enter'] = "Entrar",
        ['buy'] = "Comprar",
        ['buyed'] = "Comprado",
        ['washCar'] = "Lavar Auto",
        ['fixCar'] = "Reparar Auto",
        ['colorTitle'] = "Configuración de Color",
        ['primaryColor'] = "Color Primario",
        ['secondaryColor'] = "Color Secundario",
        ['classic'] = "Clásico",
        ['metallic'] = "Metálico",
        ['matte'] = "Mate",
        ['metal'] = "Metal",
        ['chrome'] = "Cromo",
        ['pearlescent'] = "Nacarado",
        ['card'] = "Tarjeta",
        ['delete'] = "Borrar",
        ['total'] = "Total",
        ['paycash'] = "Pagar en Efectivo",
        ['paycard'] = "Pagar con Tarjeta",
        ['clearCard'] = "Limpiar Tarjeta",
        ['addCard'] = "Agregar Tarjeta",
        ['close'] = "Cerrar",
        ['color'] = "Color",
        ['deleteCard'] = "Borrar Tarjeta",
        ['notenoughmoney'] = "No tienes suficiente dinero",
    
        ['fitMenu'] = "Menú de Ajuste",
        ['wheelsWidth'] = "Ancho de Ruedas",
        ['wheelsFrontLeft'] = "Ruedas Delanteras Izquierdas",
        ['wheelsFrontRight'] = "Ruedas Delanteras Derechas",
        ['wheelsRearLeft'] = "Ruedas Traseras Izquierdas",
        ['wheelsRearRight'] = "Ruedas Traseras Derechas",
        ['wheelsFrontCamberLeft'] = "Inclinación de Ruedas Delanteras Izquierdas",
        ['wheelsFrontCamberRight'] = "Inclinación de Ruedas Delanteras Derechas",
        ['wheelsRearCamberLeft'] = "Inclinación de Ruedas Traseras Izquierdas",
        ['wheelsRearCamberRight'] = "Inclinación de Ruedas Traseras Derechas",
        ['applySettings'] = "Aplicar Configuraciones",
    
        ['tuningtitle'] = "Ajuste Dusa",
        ['tuninginfo'] = "Ajusta tu vehículo",
        ['mods'] = "Mods",
        ['detail'] = "Detalles",
        ['neon'] = "Neón",
        ['headlights'] = "Faros",
        ['select'] = "Seleccionar",
        ['selected'] = "Seleccionado",
        ['applySettings'] = "Aplicar Configuraciones",
        ['cancel'] = "Cancelar",
        ['boost'] = "Impulso",
        ['acceleration'] = "Aceleración",
        ['breaking'] = "Frenado",
        ['gearchange'] = "Cambio de Marchas",
        ['drivetrain'] = "Tren de Transmisión",
        ['front'] = "Frontal",
        ['back'] = "Trasero",
        ['left'] = "Izquierdo",
        ['right'] = "Derecho",
        ['rainbow'] = "Arcoíris",
        ['default'] = "Predeterminado",
        ['snake'] = "Serpiente",
        ['crisscross'] = "Cruz",
        ['lightnings'] = "Relámpagos",
        ['fourways'] = "Intermitentes",
        ['blinking'] = "Intermitente",
    
        ['craft'] = "FABRICACIÓN",
        ['bench'] = "BANCO",
        ['youritems'] = "TUS OBJETOS",
        ['craftdesc'] = "¡Fabrica los mejores equipos para ti!",
        ['needItems'] = "OBJETOS NECESARIOS",
        ['craftItem'] = "FABRICAR!",
    
        ['up'] = "Arriba",
        ['stop'] = "Detener",
        ['down'] = "Abajo",
        ['lifttitle'] = "Control del Elevador",
        ['liftdesc'] = "Gestiona el elevador de automóviles para vehículos",
        ['detachVehicle'] = "Desconectar Vehículo",
    
        ['sabit'] = "Adjuntar",
        ['sabitcikar'] = "Desconectar",
        ['rampayiindir'] = "Alternar Rampa",
        ['towtitle'] = "Remolcar Vehículo",
        ['towdesc'] = "¡Transporta un vehículo con una plataforma plana!",
    },
    ['fr'] = {
        -- Notifications
        ['withdrawn'] = 'Vous avez retiré ',
        ['deposited'] = 'Vous avez déposé ',
        ['fee'] = 'Les frais de lavage et de réparation sont fixés à ',
        ['discount'] = 'Les remises partielles sont fixées à ',
        ['name'] = 'Nom du mécanicien défini à ',
        ['sport'] = 'Le mode Sport est actif !',
        ['drift'] = 'Le mode Drift est actif !',
        ['ecos'] = 'Le mode Éco est actif !',
        ['fitment'] = 'Ajustement appliqué avec succès au véhicule',
        ['notenoughmoney'] = 'Vous n\'avez pas assez d\'argent !',
        ['modified'] = 'Vous avez modifié avec succès le véhicule !',
        ['freecamactive'] = 'Caméra libre activée',
        ['freecamdeactive'] = 'Caméra libre désactivée',
        ['ranksupdated'] = 'Les rangs sont mis à jour avec succès !',
        ['notmechanic'] = 'Vous n\'avez pas la permission d\'utiliser cette commande',
        ['notmechanicitem'] = 'Vous n\'avez pas la permission d\'utiliser cet objet',
        ['alreadymaxgrade'] = 'Ce joueur est déjà au rang maximum !',
        ['alreadymingrade'] = 'Ce joueur est déjà au rang minimum !',
        ['youpromoted'] = 'Vous avez été promu !',
        ['youdemoted'] = 'Vous avez été rétrogradé !',
        ['youhired'] = 'Vous êtes embauché en tant que nouveau mécanicien !',
        ['safemoneynotenough'] = 'Votre coffre de mécanicien n\'a pas assez d\'argent !',
        ['usednitro'] = 'Vous avez utilisé un nitro, restant : ',
        ['outofnitro'] = 'Vous n\'avez plus de stock de boost nitro !',
    
        -- Tow
        ['rampdeployed'] = 'La rampe a été déployée avec succès !',
        ['needflatbed'] = 'Vous avez besoin d\'un plateau pour déployer la rampe',
        ['rampremoved'] = 'La rampe a été retirée avec succès',
        ['getcloser'] = 'Veuillez vous approcher de la rampe',
        ['vehicleattached'] = 'Véhicule attaché avec succès !',
        ['alreadyattached'] = 'Ce véhicule est déjà attaché !',
        ['couldntattach'] = 'Impossible d\'attacher',
        ['todriverseat'] = 'Vous devez être au siège du conducteur',
        ['notinveh'] = 'Vous n\'êtes dans aucun véhicule',
        ['vehdetached'] = 'Le véhicule a été détaché avec succès',
        ['isntattached'] = 'Le véhicule n\'est attaché à rien',

        -- Text UI
        ['etocarlift'] = 'Appuyez sur [E] pour ouvrir le pont élévateur',
        ['etoattach'] = 'Appuyez sur [E] pour attacher le véhicule',
        ['etocraft'] = 'Appuyez sur [E] pour fabriquer',
        ['etomechanic'] = 'Appuyez sur [E] pour ouvrir le menu du mécanicien',
        ['etoboss'] = 'Appuyez sur [E] pour ouvrir le menu du patron',
        ['etotakeflatbed'] = 'Appuyez sur [E] pour prendre le plateau',
        ['etoreturnflatbed'] = 'Appuyez sur [E] pour rendre le plateau',
    
        -- UI
        ['dashboard'] = "Tableau de bord",
        ['settings'] = "Paramètres",
        ['employees'] = "Employés",
        ['managePerm'] = "Gérer les autorisations",
        ['managePermInfo'] = "Gérer les informations d'autorisations",
        ['employeeslist'] = "Liste des employés",
        ['addEmployee'] = "Ajouter un employé",
        ['addnewemployee'] = "Ajouter un nouvel employé",
        ['addnewemployeedesc'] = "Ajouter un nouvel employé à votre mécanicien",
        ['sellcompany'] = "Vendre l'entreprise",
        ['totalassets'] = "Actifs totaux",
        ['totalemployees'] = "Nombre total d'employés",
        ['depositwithdraw'] = "DÉPOSER ET RETIRER DE L'ARGENT",
        ['withdraw'] = "Retirer de l'argent",
        ['deposit'] = "Déposer de l'argent",
        ['mechanicname'] = "Nom du mécanicien",
        ['setaname'] = "Définir un nom",
        ['mechanicdiscount'] = "Remise du mécanicien",
        ['setdiscount'] = "Définir une remise",
        ['vehiclecleaning'] = "Frais de nettoyage et de réparation du véhicule",
        ['updatefee'] = "Mettre à jour les frais",
        ['areyousure'] = "Êtes-vous sûr ?",
        ['yes'] = "Oui",
        ['no'] = "Non",
        ['history'] = "Historique",
        ['saveaname'] = "Enregistrer un nom",
        ['savediscount'] = "Enregistrer la remise",
        ['updateRank'] = "Mettre à jour le rang",
        ['kickEmployee'] = "Virer un employé",
        ['applyChanges'] = "Appliquer les changements",
    
        ['error'] = "Erreur !",
        ['success'] = "Succès !",
        ['info'] = "Info !",
    
        ['enter'] = "Entrer",
        ['buy'] = "Acheter",
        ['buyed'] = "Acheté",
        ['washCar'] = "Laver la voiture",
        ['fixCar'] = "Réparer la voiture",
        ['colorTitle'] = "Paramètres de couleur",
        ['primaryColor'] = "Couleur primaire",
        ['secondaryColor'] = "Couleur secondaire",
        ['classic'] = "Classique",
        ['metallic'] = "Métallique",
        ['matte'] = "Mat",
        ['metal'] = "Métal",
        ['chrome'] = "Chrome",
        ['pearlescent'] = "Nacrée",
        ['card'] = "Carte",
        ['delete'] = "Supprimer",
        ['total'] = "Total",
        ['paycash'] = "Payer en espèces",
        ['paycard'] = "Payer par carte",
        ['clearCard'] = "Effacer la carte",
        ['addCard'] = "Ajouter une carte",
        ['close'] = "Fermer",
        ['color'] = "Couleur",
        ['deleteCard'] = "Supprimer la carte",
        ['notenoughmoney'] = "Vous n'avez pas assez d'argent",
    
        ['fitMenu'] = "Menu Ajustement",
        ['wheelsWidth'] = "Largeur des roues",
        ['wheelsFrontLeft'] = "Roues avant gauche",
        ['wheelsFrontRight'] = "Roues avant droite",
        ['wheelsRearLeft'] = "Roues arrière gauche",
        ['wheelsRearRight'] = "Roues arrière droite",
        ['wheelsFrontCamberLeft'] = "Pincement des roues avant gauche",
        ['wheelsFrontCamberRight'] = "Pincement des roues avant droite",
        ['wheelsRearCamberLeft'] = "Pincement des roues arrière gauche",
        ['wheelsRearCamberRight'] = "Pincement des roues arrière droite",
        ['applySettings'] = "Appliquer les paramètres",
    
        ['tuningtitle'] = "Réglage Dusa",
        ['tuninginfo'] = "Ajustez votre véhicule",
        ['mods'] = "Mods",
        ['detail'] = "Détails",
        ['neon'] = "Néon",
        ['headlights'] = "Phares",
        ['select'] = "Sélectionner",
        ['selected'] = "Sélectionné",
        ['applySettings'] = "Appliquer les paramètres",
        ['cancel'] = "Annuler",
        ['boost'] = "Boost",
        ['acceleration'] = "Accélération",
        ['breaking'] = "Freinage",
        ['gearchange'] = "Changement de vitesse",
        ['drivetrain'] = "Train de roulement",
        ['front'] = "Avant",
        ['back'] = "Arrière",
        ['left'] = "Gauche",
        ['right'] = "Droite",
        ['rainbow'] = "Arc-en-ciel",
        ['default'] = "Par défaut",
        ['snake'] = "Serpent",
        ['crisscross'] = "Croix",
        ['lightnings'] = "Éclairs",
        ['fourways'] = "Clignotants",
        ['blinking'] = "Clignotant",
    
        ['craft'] = "FABRICATION",
        ['bench'] = "ÉTABLI",
        ['youritems'] = "VOS OBJETS",
        ['craftdesc'] = "Fabriquez les meilleurs équipements pour vous-même !",
        ['needItems'] = "OBJETS NÉCESSAIRES",
        ['craftItem'] = "FABRIQUER !",
    
        ['up'] = "Haut",
        ['stop'] = "Arrêter",
        ['down'] = "Bas",
        ['lifttitle'] = "Contrôle du Levage",
        ['liftdesc'] = "Gérez le pont élévateur pour les véhicules",
        ['detachVehicle'] = "Détacher le véhicule",
    
        ['sabit'] = "Attacher",
        ['sabitcikar'] = "Détacher",
        ['rampayiindir'] = "Basculer la rampe",
        ['towtitle'] = "Remorquer le véhicule",
        ['towdesc'] = "Transportez un véhicule avec une plateforme !",
    },
    ['tr'] = {
        -- Bildirimler
        ['withdrawn'] = 'Çekim yapıldı: ',
        ['deposited'] = 'Yatırım yapıldı: ',
        ['fee'] = 'Yıkama ve Tamir Ücretleri şuna ayarlandı: ',
        ['discount'] = 'Parça indirimleri şuna ayarlandı: ',
        ['name'] = 'Mekanik ismi şuna ayarlandı: ',
        ['sport'] = 'Spor modu aktif!',
        ['drift'] = 'Drift modu aktif!',
        ['ecos'] = 'Ekonomi modu aktif!',
        ['fitment'] = 'Araç başarıyla düzenlendi',
        ['notenoughmoney'] = 'Yeterli paranız yok!',
        ['modified'] = 'Araç başarıyla modifiye edildi!',
        ['freecamactive'] = 'Serbest kamera etkinleştirildi',
        ['freecamdeactive'] = 'Serbest kamera devre dışı bırakıldı',
        ['ranksupdated'] = 'Rütbeler başarıyla güncellendi!',
        ['notmechanic'] = 'Bu komutu kullanma izniniz yok',
        ['notmechanicitem'] = 'Bu öğeyi kullanma izniniz yok',
        ['alreadymaxgrade'] = 'Bu oyuncu zaten maksimum rütbede!',
        ['alreadymingrade'] = 'Bu oyuncu zaten minimum rütbede!',
        ['youpromoted'] = 'Terfi ettiniz!',
        ['youdemoted'] = 'Rütbeleriniz düşürüldü!',
        ['youhired'] = 'Yeni mekanik çalışanı olarak işe alındınız!',
        ['safemoneynotenough'] = 'Mekanik kasası yeterli paranıza sahip değil!',
        ['usednitro'] = 'Bir nitro kullandınız, kalan: ',
        ['outofnitro'] = 'Nitro stoğunuz tükendi!',
    
        -- Çekme
        ['rampdeployed'] = 'Rampa başarıyla kuruldu!',
        ['needflatbed'] = 'Rampa kurmak için düz bir platforma ihtiyacınız var',
        ['rampremoved'] = 'Rampa başarıyla kaldırıldı',
        ['getcloser'] = 'Lütfen rampaya daha yaklaşın',
        ['vehicleattached'] = 'Araç başarıyla bağlandı!',
        ['alreadyattached'] = 'Bu araç zaten bağlı!',
        ['couldntattach'] = 'Bağlanamadı',
        ['todriverseat'] = 'Sürücü koltuğunda olmanız gerekiyor',
        ['notinveh'] = 'Hiçbir araçta değilsiniz',
        ['vehdetached'] = 'Araç başarıyla çözüldü',
        ['isntattached'] = 'Araç hiçbir şeye bağlı değil',
    
        -- UI
        ['dashboard'] = "Panel",
        ['settings'] = "Ayarlar",
        ['employees'] = "Çalışanlar",
        ['managePerm'] = "İzinleri Yönet",
        ['managePermInfo'] = "İzin Yönetimi Bilgisi",
        ['employeeslist'] = "Çalışanlar Listesi",
        ['addEmployee'] = "Çalışan Ekle",
        ['addnewemployee'] = "Yeni Çalışan Ekle",
        ['addnewemployeedesc'] = "Mekanik kadronuza yeni bir çalışan ekleyin",
        ['sellcompany'] = "Şirketi Sat",
        ['totalassets'] = "Toplam Varlık",
        ['totalemployees'] = "Toplam Çalışan",
        ['depositwithdraw'] = "PARA YATIRMA & ÇEKME",
        ['withdraw'] = "Para Çek",
        ['deposit'] = "Para Yatır",
        ['mechanicname'] = "Mekanik İsmi",
        ['setaname'] = "Bir isim belirleyin",
        ['mechanicdiscount'] = "Mekanik İndirimi",
        ['setdiscount'] = "Bir indirim belirleyin",
        ['vehiclecleaning'] = "Araç temizlik ve onarım ücreti",
        ['updatefee'] = "Ücreti Güncelle",
        ['areyousure'] = "Emin misiniz?",
        ['yes'] = "Evet",
        ['no'] = "Hayır",
        ['history'] = "Geçmiş",
        ['saveaname'] = "Bir isim kaydedin",
        ['savediscount'] = "İndirimi kaydedin",
        ['updateRank'] = "Rütbe Güncelle",
        ['kickEmployee'] = "Çalışanı Kov",
        ['applyChanges'] = "Değişiklikleri Uygula",
    
        ['error'] = "Hata!",
        ['success'] = "Başarı!",
        ['info'] = "Bilgi!",
    
        ['enter'] = "Gir",
        ['buy'] = "Satın Al",
        ['buyed'] = "Satın Alındı",
        ['washCar'] = "Araç Yıka",
        ['fixCar'] = "Araç Onar",
        ['colorTitle'] = "Renk Ayarları",
        ['primaryColor'] = "Birincil Renk",
        ['secondaryColor'] = "İkincil Renk",
        ['classic'] = "Klasik",
        ['metallic'] = "Metalik",
        ['matte'] = "Mat",
        ['metal'] = "Metal",
        ['chrome'] = "Krom",
        ['pearlescent'] = "İnci",
        ['card'] = "Kart",
        ['delete'] = "Sil",
        ['total'] = "Toplam",
        ['paycash'] = "Nakit Öde",
        ['paycard'] = "Kartla Öde",
        ['clearCard'] = "Kartı Temizle",
        ['addCard'] = "Kart Ekle",
        ['close'] = "Kapat",
        ['color'] = "Renk",
        ['deleteCard'] = "Kartı Sil",
        ['notenoughmoney'] = "Yeterli paranız yok",

        -- Metin Arayüzü
        ['etocarlift'] = 'Araç kaldırmak için [E] tuşuna basın',
        ['etoattach'] = 'Araç bağlamak için [E] tuşuna basın',
        ['etocraft'] = 'El işçiliği yapmak için [E] tuşuna basın',
        ['etomechanic'] = 'Mekanik menüsünü açmak için [E] tuşuna basın',
        ['etoboss'] = 'Patron menüsünü açmak için [E] tuşuna basın',
        ['etotakeflatbed'] = 'Düz platformu almak için [E] tuşuna basın',
        ['etoreturnflatbed'] = 'Düz platformu geri vermek için [E] tuşuna basın',
    
        ['fitMenu'] = "Uyum Menüsü",
        ['wheelsWidth'] = "Tekerlek Genişliği",
        ['wheelsFrontLeft'] = "Ön Sol Tekerlek",
        ['wheelsFrontRight'] = "Ön Sağ Tekerlek",
        ['wheelsRearLeft'] = "Arka Sol Tekerlek",
        ['wheelsRearRight'] = "Arka Sağ Tekerlek",
        ['wheelsFrontCamberLeft'] = "Ön Sol Tekerlek Kamberi",
        ['wheelsFrontCamberRight'] = "Ön Sağ Tekerlek Kamberi",
        ['wheelsRearCamberLeft'] = "Arka Sol Tekerlek Kamberi",
        ['wheelsRearCamberRight'] = "Arka Sağ Tekerlek Kamberi",
        ['applySettings'] = "Ayarları Uygula",
    
        ['tuningtitle'] = "Dusa Ayarı",
        ['tuninginfo'] = "Araç ayarlarını yapın",
        ['mods'] = "Modlar",
        ['detail'] = "Detaylar",
        ['neon'] = "Neon",
        ['headlights'] = "Farlar",
        ['select'] = "Seç",
        ['selected'] = "Seçildi",
        ['applySettings'] = "Ayarları Uygula",
        ['cancel'] = "İptal",
        ['boost'] = "Güç Artırıcı",
        ['acceleration'] = "Hızlanma",
        ['breaking'] = "Frenleme",
        ['gearchange'] = "Vites Değiştirme",
        ['drivetrain'] = "Tren Hareketi",
        ['front'] = "Ön",
        ['back'] = "Arka",
        ['left'] = "Sol",
        ['right'] = "Sağ",
        ['rainbow'] = "Gökkuşağı",
        ['default'] = "Varsayılan",
        ['snake'] = "Yılan",
        ['crisscross'] = "Çapraz",
        ['lightnings'] = "Şimşek",
        ['fourways'] = "Dört Yol",
        ['blinking'] = "Sinyal",
        
        ['craft'] = "EL İŞÇİLİĞİ",
        ['bench'] = "BANK",
        ['youritems'] = "SENİN EŞYALARIN",
        ['craftdesc'] = "Kendin için en iyi ekipmanları üret!",
        ['needItems'] = "İHTİYAÇ DUYULAN EŞYALAR",
        ['craftItem'] = "ÜRET!",
    
        ['up'] = "Yukarı",
        ['stop'] = "Durdur",
        ['down'] = "Aşağı",
        ['lifttitle'] = "Kaldırma Kontrolü",
        ['liftdesc'] = "Araç kaldırma için kontrol sağla",
        ['detachVehicle'] = "Araç Bağlantısını Kes",
    
        ['sabit'] = "Bağla",
        ['sabitcikar'] = "Bağlantıyı Kes",
        ['rampayiindir'] = "Rampa Durumu Değiştir",
        ['towtitle'] = "Araç Çekme",
        ['towdesc'] = "Düz bir platform ile araç taşı!",
    },
    ['nl'] = {
        -- Bildirimler
        ['withdrawn'] = 'Je hebt opgenomen ',
        ['deposited'] = 'Je hebt gestort ',
        ['fee'] = 'Wash & Fix-kosten zijn ingesteld op ',
        ['discount'] = 'Onderdeelkortingen zijn ingesteld op ',
        ['name'] = 'Mechanic-naam ingesteld op ',
        ['sport'] = 'Sportmodus is actief!',
        ['drift'] = 'Driftmodus is actief!',
        ['ecos'] = 'Eco-modus is actief!',
        ['fitment'] = 'Fitment succesvol toegepast op het voertuig',
        ['notenoughmoney'] = 'Je hebt niet genoeg geld!',
        ['modified'] = 'Je hebt het voertuig succesvol aangepast!',
        ['freecamactive'] = 'Freecam geactiveerd',
        ['freecamdeactive'] = 'Freecam gedeactiveerd',
        ['ranksupdated'] = 'Rangen zijn succesvol bijgewerkt!',
        ['notmechanic'] = 'Je hebt geen toestemming om deze opdracht te gebruiken',
        ['notmechanicitem'] = 'Je hebt geen toestemming om dit item te gebruiken',
        ['alreadymaxgrade'] = 'Deze speler heeft al de maximale rang!',
        ['alreadymingrade'] = 'Deze speler heeft al de minimale rang!',
        ['youpromoted'] = 'Je bent gepromoveerd!',
        ['youdemoted'] = 'Je bent gedegradeerd!',
        ['youhired'] = 'Je bent aangenomen als nieuwe monteur!',
        ['safemoneynotenough'] = 'Je monteurkluis heeft niet genoeg geld!',
        ['usednitro'] = 'Je hebt een nitro gebruikt, resterend: ',
        ['outofnitro'] = 'Je hebt geen nitro boost meer op voorraad!',

        -- Sleep
        ['rampdeployed'] = 'Ramp is succesvol uitgeklapt!',
        ['needflatbed'] = 'Je hebt een flatbed nodig om de ramp uit te klappen',
        ['rampremoved'] = 'Ramp succesvol verwijderd',
        ['getcloser'] = 'Kom alsjeblieft dichter bij de ramp',
        ['vehicleattached'] = 'Voertuig succesvol aangekoppeld!',
        ['alreadyattached'] = 'Dit voertuig is al aangekoppeld!',
        ['couldntattach'] = 'Kon niet koppelen',
        ['todriverseat'] = 'Je moet op de bestuurdersstoel zitten',
        ['notinveh'] = 'Je zit niet in een voertuig',
        ['vehdetached'] = 'Het voertuig is succesvol losgekoppeld',
        ['isntattached'] = 'Het voertuig is nergens aan gekoppeld',

        -- Tekst UI
        ['etocarlift'] = 'Druk op [E] om de autohefbrug te openen',
        ['etoattach'] = 'Druk op [E] om het voertuig aan te koppelen',
        ['etocraft'] = 'Druk op [E] om te knutselen',
        ['etomechanic'] = 'Druk op [E] om de monteur te openen',
        ['etoboss'] = 'Druk op [E] om het baasmenu te openen',
        ['etotakeflatbed'] = 'Druk op [E] om de flatbed te pakken',
        ['etoreturnflatbed'] = 'Druk op [E] om de flatbed terug te brengen',

        -- UI
        ['dashboard'] = "Dashboard",
        ['settings'] = "Instellingen",
        ['employees'] = "Werknemers",
        ['managePerm'] = "Beheer machtigingen",
        ['managePermInfo'] = "Beheer machtigingsinformatie",
        ['employeeslist'] = "Werknemerslijst",
        ['addEmployee'] = "Voeg werknemer toe",
        ['addnewemployee'] = "Voeg nieuwe werknemer toe",
        ['addnewemployeedesc'] = "Voeg een nieuwe werknemer toe aan je monteur",
        ['sellcompany'] = "Verkoop bedrijf",
        ['totalassets'] = "Totale activa",
        ['totalemployees'] = "Totale werknemers",
        ['depositwithdraw'] = "GELD STORTEN & OPNEMEN",
        ['withdraw'] = "Geld opnemen",
        ['deposit'] = "Geld storten",
        ['mechanicname'] = "Monteursnaam",
        ['setaname'] = "Stel een naam in",
        ['mechanicdiscount'] = "Monteurskorting",
        ['setdiscount'] = "Stel een korting in",
        ['vehiclecleaning'] = "voertuig schoonmaak- en reparatiekosten",
        ['updatefee'] = "Bijwerkingskosten",
        ['areyousure'] = "Weet je het zeker?",
        ['yes'] = "Ja",
        ['no'] = "Nee",
        ['history'] = "Geschiedenis",
        ['saveaname'] = "Sla een naam op",
        ['savediscount'] = "Sla korting op",
        ['updateRank'] = "Rang bijwerken",
        ['kickEmployee'] = "Werknemer schoppen",
        ['applyChanges'] = "Veranderingen toepassen",

        ['error'] = "Fout!",
        ['success'] = "Succes!",
        ['info'] = "Info!",

        ['enter'] = "Enter",
        ['buy'] = "Kopen",
        ['buyed'] = "Gekocht",
        ['washCar'] = "Auto wassen",
        ['fixCar'] = "Auto repareren",
        ['colorTitle'] = "Kleurinstellingen",
        ['primaryColor'] = "Primaire kleur",
        ['secondaryColor'] = "Secundaire kleur",
        ['classic'] = "Klassiek",
        ['metallic'] = "Metallic",
        ['matte'] = "Mat",
        ['metal'] = "Metaal",
        ['chrome'] = "Chroom",
        ['pearlescent'] = "Parelmoer",
        ['card'] = "Kaart",
        ['delete'] = "Verwijderen",
        ['total'] = "Totaal",
        ['paycash'] = "Betaal contant",
        ['paycard'] = "Betaal met kaart",
        ['clearCard'] = "Kaart wissen",
        ['addCard'] = "Kaart toevoegen",
        ['close'] = "Sluiten",
        ['color'] = "Kleur",
        ['deleteCard'] = "Kaart verwijderen",
        ['notenoughmoney'] = "Je hebt niet genoeg geld",

        ['fitMenu'] = "Pas Menu aan",
        ['wheelsWidth'] = "Wielbreedte",
        ['wheelsFrontLeft'] = "Wielen Voor Links",
        ['wheelsFrontRight'] = "Wielen Voor Rechts",
        ['wheelsRearLeft'] = "Wielen Achter Links",
        ['wheelsRearRight'] = "Wielen Achter Rechts",
        ['wheelsFrontCamberLeft'] = "Wielen Voor Camber Links",
        ['wheelsFrontCamberRight'] = "Wielen Voor Camber Rechts",
        ['wheelsRearCamberLeft'] = "Wielen Achter Camber Links",
        ['wheelsRearCamberRight'] = "Wielen Achter Camber Rechts",
        ['applySettings'] = "Instellingen toepassen",

        ['tuningtitle'] = "Dusa Tuning",
        ['tuninginfo'] = "Pas je voertuig aan",
        ['mods'] = "Mods",
        ['detail'] = "Details",
        ['neon'] = "Neon",
        ['headlights'] = "Koplampen",
        ['select'] = "Selecteren",
        ['selected'] = "Geselecteerd",
        ['applySettings'] = "Instellingen toepassen",
        ['cancel'] = "Annuleren",
        ['boost'] = "Boost",
        ['acceleration'] = "Versnelling",
        ['breaking'] = "Remmen",
        ['gearchange'] = "Versnellingswissel",
        ['drivetrain'] = "Aandrijving",
        ['front'] = "Voor",
        ['back'] = "Achter",
        ['left'] = "Links",
        ['right'] = "Rechts",
        ['rainbow'] = "Regenboog",
        ['default'] = "Standaard",
        ['snake'] = "Slang",
        ['crisscross'] = "Kruislings",
        ['lightnings'] = "Bliksem",
        ['fourways'] = "Vier Manieren",
        ['blinking'] = "Knipperend",

        ['craft'] = "MAKEN",
        ['bench'] = "BANK",
        ['youritems'] = "JOUE ITEMS",
        ['craftdesc'] = "Maak de beste uitrusting voor jezelf!",
        ['needItems'] = "NODIGE ITEMS",
        ['craftItem'] = "MAKEN!",

        ['up'] = "Omhoog",
        ['stop'] = "Stoppen",
        ['down'] = "Omlaag",
        ['lifttitle'] = "Hefbediening",
        ['liftdesc'] = "Beheer autolift voor voertuigen",
        ['detachVehicle'] = "Voertuig loskoppelen",

        ['sabit'] = "Bevestigen",
        ['sabitcikar'] = "Loskoppelen",
        ['rampayiindir'] = "Ramp omschakelen",
        ['towtitle'] = "Voertuig Slepen",
        ['towdesc'] = "Vervoer een voertuig met een flatbed!",
    },
    ['it'] = {
        -- Notifications
        ['withdrawn'] = 'Hai prelevato $',
        ['deposited'] = 'Hai depositato $',
        ['fee'] = 'Le tariffe di Lavaggio e Riparazione sono impostate a ',
        ['discount'] = 'Gli sconti parziali sono impostati a ',
        ['name'] = 'Il nome del meccanico è impostato a ',
        ['sport'] = 'La modalità Sport è attiva!',
        ['drift'] = 'La modalità Drift è attiva!',
        ['ecos'] = 'La modalità Eco è attiva!',
        ['fitment'] = 'Montaggio applicato con successo al veicolo',
        ['notenoughmoney'] = 'Non hai abbastanza denaro!',
        ['modified'] = 'Hai modificato con successo il veicolo!',
        ['freecamactive'] = 'Freecam attivata',
        ['freecamdeactive'] = 'Freecam disattivata',
        ['ranksupdated'] = 'I ranghi sono stati aggiornati con successo!',
        ['notmechanic'] = 'Non hai il permesso di usare questo comando',
        ['notmechanicitem'] = 'Non hai il permesso di usare questo oggetto',
        ['alreadymaxgrade'] = 'Questo giocatore è già al massimo grado!',
        ['alreadymingrade'] = 'Questo giocatore è già al grado minimo!',
        ['youpromoted'] = 'Sei stato promosso!',
        ['youdemoted'] = 'Sei stato degradato!',
        ['youhired'] = 'Sei stato assunto come nuovo dipendente meccanico!',
        ['safemoneynotenough'] = 'Il tuo sicuro del meccanico non ha abbastanza denaro!',
        ['usednitro'] = 'Hai usato un nitro, rimanente: ',
        ['outofnitro'] = 'Hai esaurito le scorte di nitro boost!',
    
        -- Traino
        ['rampdeployed'] = 'La rampa è stata dispiegata con successo!',
        ['needflatbed'] = 'Hai bisogno di un carro attrezzi per dispiegare la rampa',
        ['rampremoved'] = 'Rampa rimossa con successo',
        ['getcloser'] = 'Per favore avvicinati alla rampa',
        ['vehicleattached'] = 'Veicolo attaccato con successo!',
        ['alreadyattached'] = 'Questo veicolo è già attaccato!',
        ['couldntattach'] = 'Impossibile attaccare',
        ['todriverseat'] = 'Devi essere al posto del conducente',
        ['notinveh'] = 'Non sei in alcun veicolo',
        ['vehdetached'] = 'Il veicolo è stato staccato con successo',
        ['isntattached'] = 'Il veicolo non è attaccato a nulla',
    
        -- Testo UI
        ['etocarlift'] = 'Premi [E] per aprire il sollevatore per auto',
        ['etoattach'] = 'Premi [E] per attaccare il veicolo',
        ['etocraft'] = 'Premi [E] per creare',
        ['etomechanic'] = 'Premi [E] per aprire il meccanico',
        ['etoboss'] = 'Premi [E] per aprire il menu del capo',
        ['etotakeflatbed'] = 'Premi [E] per prendere il carro attrezzi',
        ['etoreturnflatbed'] = 'Premi [E] per restituire il carro attrezzi',
    
        -- UI
        ['dashboard'] = "Cruscotto",
        ['settings'] = "Impostazioni",
        ['employees'] = "Dipendenti",
        ['managePerm'] = "Gestisci Permessi",
        ['managePermInfo'] = "Informazioni sulla Gestione dei Permessi",
        ['employeeslist'] = "Lista Dipendenti",
        ['addEmployee'] = "Aggiungi Dipendente",
        ['addnewemployee'] = "Aggiungi Nuovo Dipendente",
        ['addnewemployeedesc'] = "Aggiungi un nuovo dipendente al tuo meccanico",
        ['sellcompany'] = "Vendi Azienda",
        ['totalassets'] = "Totale Asset",
        ['totalemployees'] = "Totale Dipendenti",
        ['depositwithdraw'] = "DEPOSITO & RITIRO SOLDI",
        ['withdraw'] = "Ritira Soldi",
        ['deposit'] = "Deposita Soldi",
        ['mechanicname'] = "Nome Meccanico",
        ['setaname'] = "Imposta un nome",
        ['mechanicdiscount'] = "Sconto Meccanico",
        ['setdiscount'] = "Imposta uno sconto",
        ['vehiclecleaning'] = "Spese di pulizia e riparazione del veicolo",
        ['updatefee'] = "Aggiorna Tariffa",
        ['areyousure'] = "Sei sicuro?",
        ['yes'] = "Sì",
        ['no'] = "No",
        ['history'] = "Storia",
        ['saveaname'] = "Salva un nome",
        ['savediscount'] = "Salva sconto",
        ['updateRank'] = "Aggiorna Grado",
        ['kickEmployee'] = "Licenzia Dipendente",
        ['applyChanges'] = "Applica Modifiche",
    
        ['error'] = "Errore!",
        ['success'] = "Successo!",
        ['info'] = "Info!",
    
        ['enter'] = "Entra",
        ['buy'] = "Compra",
        ['buyed'] = "Comprato",
        ['washCar'] = "Lava Auto",
        ['fixCar'] = "Ripara Auto",
        ['colorTitle'] = "Impostazioni Colore",
        ['primaryColor'] = "Colore Primario",
        ['secondaryColor'] = "Colore Secondario",
        ['classic'] = "Classico",
        ['metallic'] = "Metallico",
        ['matte'] = "Opaco",
        ['metal'] = "Metallo",
        ['chrome'] = "Cromato",
        ['pearlescent'] = "Perlescente",
        ['card'] = "Carta",
        ['delete'] = "Elimina",
        ['total'] = "Totale",
        ['paycash'] = "Paga in Contanti",
        ['paycard'] = "Paga con Carta",
        ['clearCard'] = "Cancella Carta",
        ['addCard'] = "Aggiungi Carta",
        ['close'] = "Chiudi",
        ['color'] = "Colore",
        ['deleteCard'] = "Elimina Carta",
        ['notenoughmoney'] = "Non hai abbastanza denaro",
    
        ['fitMenu'] = "Menu Montaggio",
        ['wheelsWidth'] = "Larghezza Ruote",
        ['wheelsFrontLeft'] = "Ruote Anteriori Sinistre",
        ['wheelsFrontRight'] = "Ruote Anteriori Destre",
        ['wheelsRearLeft'] = "Ruote Posteriori Sinistre",
        ['wheelsRearRight'] = "Ruote Posteriori Destre",
        ['wheelsFrontCamberLeft'] = "Campanatura Ruote Anteriori Sinistra",
        ['wheelsFrontCamberRight'] = "Campanatura Ruote Anteriori Destra",
        ['wheelsRearCamberLeft'] = "Campanatura Ruote Posteriori Sinistra",
        ['wheelsRearCamberRight'] = "Campanatura Ruote Posteriori Destra",
        ['applySettings'] = "Applica Impostazioni",
    
        ['tuningtitle'] = "Tuning Dusa",
        ['tuninginfo'] = "Regola il tuo veicolo",
        ['mods'] = "Modifiche",
        ['detail'] = "Dettagli",
        ['neon'] = "Neon",
        ['headlights'] = "Fari",
        ['select'] = "Seleziona",
        ['selected'] = "Selezionato",
        ['applySettings'] = "Applica Impostazioni",
        ['cancel'] = "Annulla",
        ['boost'] = "Potenziamento",
        ['acceleration'] = "Accelerazione",
        ['breaking'] = "Frenata",
        ['gearchange'] = "Cambio Marce",
        ['drivetrain'] = "Trazione",
        ['front'] = "Anteriore",
        ['back'] = "Posteriore",
        ['left'] = "Sinistra",
        ['right'] = "Destra",
        ['rainbow'] = "Arcobaleno",
        ['default'] = "Predefinito",
        ['snake'] = "Serpente",
        ['crisscross'] = "Incrociato",
        ['lightnings'] = "Fulmini",
        ['fourways'] = "Quattro Vie",
        ['blinking'] = "Lampeggiante",
    
        ['craft'] = "COSTRUZIONE",
        ['bench'] = "BANCO",
        ['youritems'] = "I TUOI OGGETTI",
        ['craftdesc'] = "Crea i migliori attrezzi per te stesso!",
        ['needItems'] = "OGGETTI NECESSARI",
        ['craftItem'] = "COSTRUISCI!",
    
        ['up'] = "Su",
        ['stop'] = "Stop",
        ['down'] = "Giù",
        ['lifttitle'] = "Controllo Sollevatore",
        ['liftdesc'] = "Gestisci il sollevatore per veicoli",
        ['detachVehicle'] = "Stacca Veicolo",
    
        ['sabit'] = "Attacca",
        ['sabitcikar'] = "Stacca",
        ['rampayiindir'] = "Attiva/Disattiva Rampa",
        ['towtitle'] = "Traina Veicolo",
        ['towdesc'] = "Trasporta un veicolo con un carro attrezzi!",
    },    
}
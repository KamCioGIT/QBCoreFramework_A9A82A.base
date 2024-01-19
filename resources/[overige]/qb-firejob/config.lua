-- ========================================================================== --
--                      Advanced FireFighter System                           --
--          Mainetained by Zyo & Team (authors FiveAssets Team)               --
--                          License: GNU GPL 3.0                              --
-- ========================================================================== --

Config = {}

-- True / false values
Config.Hose = false -- If you want to use any other hose disable this if not leave it true for the hose
Config.DistanceWarning = true
Config.Debug = false

-- Distance Values
Config.MaxDistance = 20.0
Config.WarningValue = 5.0

-- Enable or disable sound effects (light on, light off, oxygen on, oxygen off, etc.)
Config.PlaySoundEffects = true

-- The size around the source the pass alarm can be heard.
-- Alarm gets quieter the further from the origin, so the
-- number below is the further spot it will be able to be heard from
Config.AlarmSize = 20
-- The length of time in ms it takes to play the "stage1" sound file.
-- It is recommended that you do not edit this unless you change the
-- "stage1" sound file. Time starts from start of audio file, not end
Config.Stage1Length = 12100

-- Job name that you use
Config.Job = "firefighter"

-- Amount of time (in seconds) 1% of oxygen is used (floats allowed) 2.27
Config.OxygenUsageInterval = 2.27

-- Amount of time (in seconds) between health loss due to smoke inhalation (floats allowed)
Config.SmokeDamageInterval = 3

-- Display oxygen percentage on screen while using oxygen tank
Config.ShowOxygenLevel = true

-- Change display true or false
Config.OxygenLevelType = true

-- Will tell the player if they are inhaling smoke and loosing health
Config.AlertOnSmokeInhalation = true

-- Time between damage (in seconds) taken if player is in smoke (floats allowed)
Config.SmokeInhalationDamageTime = 6

-- Amount of health taken (of 100) from the player every x amount of seconds (defined above) (floats allowed)
Config.SmokeInhalationDamageInteger = 2 

-- Warn the player when oxygen levels reach defined states (see below)
Config.ShowOxygenAlerts = true

-- If show alerts is enabled, define when player is alerted ex: (if oxygen equals 75 then alert defined text)
Config.AlertWhen = {
    {oxygen = 75, text = "Oxygen level at 75%"},
    {oxygen = 50, text = "Oxygen level at 50%"},
    {oxygen = 25, text = "Oxygen level at 25%"},
}

-- Config for EUP Clothes if you want to add more clothing restrictions you can do this
-- {component = "name", indexes = {
--     {index = number of cloth here}
-- }}

Config.EupGear = {
    {component = "scba", indexes = {index = 70}},

    {component = "suittop", indexes = {
        {index = 115},
    }},
    {component = "suitpants", indexes = {
        {index = 11},
    }},
}

-- Config of vehicles players can interact with
-- If you want to add a truck just put the spawn name and a , after
Config.Vehicles = {
     'ambulance',
     'FTAU',
     'lsfd2',
     'lsfd5',
     'lsfdtruck2',
     'firetruk'
}

Config.Locations = {
    ["vehicle"] = {
        [1] = vector4(1200.82, -1475.14, 34.86, 356.64),
    },
}

Config.Items = {
    label = "Truck Tools",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_halligan",
            price = 0,
            amount = 4,
            info = {
                serie = "",                
                attachments = {}
            },
            type = "weapon",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
        [2] = {
            name = "weapon_hydrantwrench",
            price = 0,
            amount = 2,
            info = { },
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
        [3] = {
            name = "weapon_fireaxe",
            price = 0,
            amount = 3,
            info = {},
            type = "weapon",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
        [4] = {
            name = "weapon_wrench",
            price = 0,
            amount = 6,
            info = { },
            type = "weapon",
            slot = 4,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
    }
}


Config.Locales = {
    ["OxygenEnabled"] = "SCBA Tank toggled!",
    ["OxygenTankEmpty"] = "Your SCBA Tank is empty",
    ["SmokeInhalation"] = "You are inhailing smoke, get out quickly!",
    ["ScbaEquiped"] = "You have equiped your SCBA!",
    ["ScbaUnequiped"] = "You have taken off your SCBA!",
    ["FlashEnabled"] = "Uniform Flashlight toggled!",
    ["NotUniform"] = "You're not wearing the proper uniform for this!",
    ["NotFD"] = "You have to be a firefighter to do this!",
    ["NotOnDuty"] = "You have to be on duty to do this!",
    ["OutCar"] = "You need to exit the vehicle to do this!",
    ["AlreadyConnected"] = "You are already connected to a hydrant!",
    ["Connected"] = "You have successfully connected to a fire hydrant",
    ["Disconnected"] = "You have successfully disconnected from the fire hydrant",
    ["NotConnected"] = "You are not connected to a hydrant!",
}

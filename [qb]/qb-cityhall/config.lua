Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
    ['trucker'] = { ['label'] = 'Trucker', ['isManaged'] = false },
    ['taxi'] = { ['label'] = 'Taxi', ['isManaged'] = false },
    ['tow'] = { ['label'] = 'Tow Truck', ['isManaged'] = false },
    ['reporter'] = { ['label'] = 'News Reporter', ['isManaged'] = false },
    ['garbage'] = { ['label'] = 'Garbage Collector', ['isManaged'] = false },
    ['bus'] = { ['label'] = 'Bus Driver', ['isManaged'] = false },
    ['hotdog'] = { ['label'] = 'Hot Dog Stand', ['isManaged'] = false }
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-1289.33, -569.83, 30.57),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = 'Gemeentehuis'
        },
        licenses = {
            ['id_card'] = {
                label = 'ID Kaart',
                cost = 50,
            },
            ['driver_license'] = {
                label = 'Rijbewijs',
                cost = 50,
                metadata = 'driver'
            },
            ['weaponlicense'] = {
                label = 'Wapen licentie',
                cost = 50,
                metadata = 'weapon'
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(-1293.7, -568.52, 30.57),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = 'Rijschool'
        },
        instructors = {
            'DJD56142',
            'DXT09752',
            'SRI85140',
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'cs_bankman',
        coords = vec4(-1291.4, -573.04, 29.60, 320.79),
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 4.0,
            width = 4.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'u_f_y_hotposh_01',
        coords = vec4(-1293.78, -570.62, 29.60, 352.1),
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 4.0,
            width = 4.0
        }
    }
}

Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
    ['gopostal'] = { ['label'] = 'PostNL', ['isManaged'] = false },
    ['taxi'] = { ['label'] = 'Taxi', ['isManaged'] = true },
    ['tow'] = { ['label'] = 'Takelwagen', ['isManaged'] = false },
    ['reporter'] = { ['label'] = 'Verslaggever', ['isManaged'] = false },
    ['garbage'] = { ['label'] = 'Vuilnisman', ['isManaged'] = false },
    ['bus'] = { ['label'] = 'Buschauffeur', ['isManaged'] = false },
    ['hotdog'] = { ['label'] = 'Hotdogkraam', ['isManaged'] = false },
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-1291.4, -573.29, 30.57),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 1.0,
            colour = 0,
            title = 'Gemeentehuis'
        },
        licenses = {
            ['id_card'] = {
                label = 'ID-kaart',
                cost = 50,
            },
            ['driver_license'] = {
                label = 'Rijbewijs',
                cost = 50,
                metadata = 'driver'
            },
            ['weaponlicense'] = {
                label = 'Wapenlicentie',
                cost = 50000,
                metadata = 'weapon'
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(213.4402, -1395.5032, 30.5781),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = 'ANWB Rijschool'
        },
        instructors = {
            'LHS79831',
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 's_m_m_fiboffice_02',
        coords = vec4(-1291.3956, -573.2889, 29.5729, 318.7643),
        scenario = 'WORLD_HUMAN_STAND_IMPATIENT',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 4.1,
            width = 4.1,
            debugPoly = false
        }
    },
    -- Driving School Ped
    --{
    --    model = 's_f_y_clubbar_01',
    --    coords = vec4(210.7444, -1398.4512, 29.5780, 320.0785),
    --    scenario = 'WORLD_HUMAN_STAND_MOBILE',
    --    drivingschool = true,
    --    zoneOptions = { -- Used for when UseTarget is false
    --        length = 5.1,
    --        width = 4.1
    --    }
    --}
}

## Installation
put the resource qb-firejob inside resources folder and now follow these steps!

Step 1:
Go to qb-core  / shared.lua and add this piece of code
['lsfd'] = {
        label = 'lsfd',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Officer',
                payment = 75
            },
            ['2'] = {
                name = 'Sergeant',
                payment = 100
            },
            ['3'] = {
                name = 'Lieutenant',
                payment = 125
            },
            ['4'] = {
                name = 'Chief',
                isboss = true,
                payment = 150
            },
        },
    },


Step 2:
Go to ms-peds/config.lua and add the following code
{
        model = `csb_trafficwarden`, -- you may change the ped in here!
        coords = vector4(1193.33, -1474.11, 34.86, 267.44),
        gender = 'male'
},


Step 3:
Go to qb-target/config.lua and add the following code to Config.TargetModels
["targetmodel2"] = {
        models = {
            "csb_trafficwarden"
        },
        options = {
            {
                type = "client",
                event = "qb-firejob:garage", --event that opens the garage
                icon = "fas fa-car",
                label = "Garage",
                job = "lsfd",
            },
        },
        distance = 2.5,
    },

    ["lsfd"] = {
        models = {-2094907124},
        options = {
            {
                type = "client",
                event = "Toggle:LSFDDuty", -- event that toggles player duty
                icon = "fas fa-sign-in-alt",
                label = "On/Off Duty",
                job = "lsfd",
            },
        },
        distance = 2.5,
    },

	["lsfdcar"] = {
		models = {
			-- add car names here
			"firetruk",
			"pengine"
		},
			options = {
				{
					type = "client",
					event = "qb-firejob:toolsmenu",
					icon = "fas fa-fire-extinguisher",
					label = "FireFighter Menu",
					job = 'lsfd'
				},
			},
		distance = 2.5,
	},

	["hydrant"] = {
        models = {200846641, 687935120, -366155374, -97646180},
        options = {
            {
                type = 'client',
                event = 'qb-firejob:Connect',
                icon = 'fas fa-fire-extinguisher',
                label = 'Connect to Hydrant'
            },
            {
                type = 'client',
                event = 'qb-firejob:Disconnect',
                icon = 'fas fa-fire-extinguisher',
                label = 'Disconnect from Hydrant'
            }
        },
        distance = 2.0
    },

Step 4: in qb-bossmenu/config.lua add this ->
['lsfd'] = vector3(1208.91, -1480.63, 34.86)

Step 5: If you want the sound effects go to interact-sound and drag the sounds in html/sounds

Step 6: If you want the item "scott" go to qb-core/shared.lua and paste this code in the item section.
['scott']                           = {['name'] = 'scott',                            ['label'] = 'SCOTT SCBA',                 ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'scott.png',                 ['unique'] = true,         ['useable'] = true,     ['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'SCBA'},

to add the scott image go into your inventory script html/images and drag and drop scott.png

## Usage
I find the script pretty straight forward, and basically you can do anything trough the config.lua
You basically need to have the job "lsfd" or if you rename it from the shared.lua you must change the name in the Config.Job too, or else the script won't work correctly! If you still can't get a hold of it by yourself you can always come to the support chat on discord!
Discord: https://discord.gg/fn2QxT2njr

## Terms Of Service
No leaking.

No reselling.

## Dependencies
ms-peds:
https://github.com/MiddleSkillz/ms-peds

qb-target:
https://github.com/BerkieBb/berkie-target

qb-core:
https://github.com/qbcore-framework/qb-core

qb-bossmenu:
https://github.com/qbcore-framework/qb-bossmenu

qb-menu:
https://github.com/qbcore-framework/qb-menu

Not a dependencie but i recommend!
firescript by gimi <3
https://github.com/gimicze/firescript

## License
[GPL3.0](https://choosealicense.com/licenses/gpl-3.0/)

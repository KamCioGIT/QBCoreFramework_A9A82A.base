Config = {}
Config.DiscordLogs = true -- Set webhook in server.lua Line 1

Config.VehicleDisplays = { --Simple vehicle spawner that allows you to display cars that are on sale in your webstore
	{
		blips = {
			enabled = true,
			pos = vector3(-49.4806, -1110.9927, 26.1895),
			sprite = 272,
			color = 2,
			scale = 0.85,
			shortRange = true,
			name = "Betaalde auto\'s",
		},
		vehicles = {
			{model = "amdbx", pos = vector4(-49.1356, -1100.7773, 25.6746, 7.7143)},
			{model = "ast", pos = vector4(-46.03, -1101.42, 24.71, 11.33)},
			{model = "urus", pos = vector4(-42.68, -1101.75, 25.24, 10.31)},
			{model = "regera", pos = vector4(-48.05, -1091.9, 25.39, 111.46)},
			{model = "675lt", pos = vector4(-44.07, -1093.45, 25.18, 108.94)},
			{model = "sq72016", pos = vector4(-40.81, -1095.43, 24.93, 109.61)},
			{model = "g65", pos = vector4(-39.45, -1102.77, 25.43, 11.18)},
			{model = "208gti21", pos = vector4(-37.56, -1097.51, 25.49, 112.11)},
		}
	},
}

Config.Packages = {
	["Diamond Support"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 2500000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Gold Support"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 500000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Silver Support"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 100000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Bronze Support"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 50000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 100k"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 100000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 250k"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 250000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 600k"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 600000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 1 mil"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 1000000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 1.5 mil"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 1500000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 3 mil"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 3000000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 5 mil"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 5000000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Money Bag 10 mil"] = { -- Exact package name from tebex
		Items = {
			{
				name = "money", -- Item or account name depending on type specified below
				amount = 10000000, -- Amount of item or money
				type = "account" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["1500 Coins"] = { -- Exact package name from tebex
		Items = {
			{
				name = "item", -- Item or account name depending on type specified below
				amount = 1500, -- Amount of item or money
				type = "coins 1500" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["2000 Coins"] = { -- Exact package name from tebex
		Items = {
			{
				name = "item", -- Item or account name depending on type specified below
				amount = 2000, -- Amount of item or money
				type = "coins 1500" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["2500 Coins"] = { -- Exact package name from tebex
		Items = {
			{
				name = "item", -- Item or account name depending on type specified below
				amount = 2500, -- Amount of item or money
				type = "coins 1500" -- Four types: account, item,coins 1500, or weapon and car
			},
		},
	},
	["Audi SQ7"] = { -- Exact package name from tebex
		Items = {
			{
				model = "sq72016", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Aston Martin Vanquish"] = { -- Exact package name from tebex
		Items = {
			{
				model = "ast", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Aston Martin DBX"] = { -- Exact package name from tebex
		Items = {
			{
				model = "amdbx", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Lamborghini Urus"] = { -- Exact package name from tebex
		Items = {
			{
				model = "urus", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Aston Martin Pack"] = { -- Exact package name from tebex
		Items = {
			{
				model = "ast", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
			{
				model = "amdbx", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Koeningsegg Regera"] = { -- Exact package name from tebex
		Items = {
			{
				model = "regera", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Mclaren 675LT"] = { -- Exact package name from tebex
		Items = {
			{
				model = "675lt", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Pgeot 208 GTI"] = { -- Exact package name from tebex
		Items = {
			{
				model = "208gti21", -- Item or account name depending on type specified below
				type = "car", -- Four types: account, item, or weapon and car
				vehicletype = "car", -- This is for your garage script, either car boat or air depending on what script you are using(Used for ESX)
			},
		},
	},
	["Plate Changer Package"] = { -- Exact package name from tebex
		Items = {
			{
				name = "platechanger", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},
	["Name Changer Package"] = { -- Exact package name from tebex
		Items = {
			{
				name = "namechanger", -- Item or account name depending on type specified below
				amount = 1, -- Amount of item or money
				type = "item" -- Four types: account, item, or weapon and car
			},
		},
	},

}
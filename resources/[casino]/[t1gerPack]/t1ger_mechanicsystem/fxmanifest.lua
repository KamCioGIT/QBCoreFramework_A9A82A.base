fx_version 'cerulean'
games {'gta5'}
lua54 "yes"

author 'T1GER#9080'
discord 'https://discord.gg/FdHkq5q'
description 'T1GER Mechanic System'
documentation 'https://docs.t1ger.net/resources/t1ger-mechanic-system'
version '2.4.0'

dependency 't1ger_lib'

client_scripts {
	'language.lua',
	'config.lua',
	'client/main.lua',
	'escrow/client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'language.lua',
	'config.lua',
	'server/main.lua',
	'escrow/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}


exports {
	'IsVehicleEngineDisabled'
}

server_exports {
	'GetPlayerMechId',
	'PlusMechanicAccount',
	'MinusMechanicAccount',
	'GetPlayerMechanicShop'
}
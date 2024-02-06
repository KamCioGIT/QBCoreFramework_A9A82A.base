fx_version 'cerulean'
games {'gta5'}
lua54 "yes"

author 'T1GER#9080'
discord 'https://discord.gg/FdHkq5q'
description 'T1GER Library'
version '2.2.4'
documentation 'https://docs.t1ger.net/resources/t1ger-library/'

dependency 'ox_lib'

client_scripts {
	'config.lua',
	'client/framework.lua',
	'client/utils.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/framework.lua',
	'server/utils.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

exports {
	'GetLib',
	'GetUtils'
}

server_exports {
	'GetLib',
	'GetUtils',
	'CreateVehicleMeta'
}
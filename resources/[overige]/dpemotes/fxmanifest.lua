fx_version 'adamant'
game 'gta5'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'Config.lua',
	'Server/*.lua'
}

client_script "@Badger-Anticheat/acloader.lua"
----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                    	----
----------------------------------------------------------------
fx_version 'cerulean'
game 'gta5'
author 'Dusa'
version '1.0'
description 'Dusa Car Kit'

shared_script 'config.lua'

client_scripts {
	'bridge/esx/client.lua',
	'bridge/qb/client.lua',
	'client.lua',
}

server_scripts {
	'bridge/esx/server.lua',
	'bridge/qb/server.lua',
	'server.lua',
	'updater.lua'
}

ui_page 'web/index.html'

files {
	'web/index.html',
	'web/assets/style/main.css',
	'web/assets/img/*.png',
	'web/assets/wrench.mp3',
	'web/jquery.eraser.js',
	'web/dirt.png',
	'web/main.js',
}

escrow_ignore {
	'bridge/esx/client.lua',
	'bridge/qb/client.lua',
	'bridge/esx/server.lua',
	'bridge/qb/server.lua',
	'config.lua',
	'updater.lua'
}

lua54 'on'
dependency '/assetpacks'
client_script "@Badger-Anticheat/acloader.lua"server_scripts { '@mysql-async/lib/MySQL.lua' }
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'Keres & Dév'
description 'Brutal Pets - store.brutalscripts.com'
version '2.0.6'

client_scripts { 
	'config.lua',
	'core/client-core.lua',
	'cl_utils.lua',
	'client/*.lua',
}

server_scripts { 
	'config.lua',
	'core/server-core.lua',
	'sv_utils.lua',
	'server/*.lua',
	'@mysql-async/lib/MySQL.lua', 
}

shared_script {
	'@ox_lib/init.lua'
}

ui_page "html/index.html"
files {
	"html/index.html",
	"html/style.css",
	"html/script.js",
	"html/assets/*.png",
}

dependencies { 
    '/server:5181',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 5181
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

escrow_ignore {
	'config.lua',
	'sv_utils.lua',
	'cl_utils.lua',
	'core/client-core.lua',
	'core/server-core.lua',
}

dependency '/assetpacks'
client_script "@Badger-Anticheat/acloader.lua"
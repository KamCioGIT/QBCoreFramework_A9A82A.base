----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                    	----
----------------------------------------------------------------
fx_version 'bodacious'
game 'gta5'
author 'dusadev.tebex.io'
description 'Dusa Mechanic Script'
version '1.0'

shared_script '@ox_lib/init.lua' -- If you not using ox_lib, add "--"
shared_script "config.lua"

client_scripts {
    '@PolyZone/client.lua', 
    '@PolyZone/BoxZone.lua', 
    '@PolyZone/EntityZone.lua', 
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'bridge/esx/client.lua',
	'bridge/qb/client.lua',
    "client/client.lua",
    "client/carlift.lua",
    "client/tow.lua",
    "client/craft.lua",
    "client/zones.lua",
    "client/functions.lua",
}

server_scripts {
    'bridge/esx/server.lua',
	'bridge/qb/server.lua',
    "@mysql-async/lib/MySQL.lua",
    "server/server.lua",
}

ui_page "web/index.html"

files {
    "web/index.html",
    "web/js/main.js",
    "web/js/vue.min.js",
    "web/assets/css/*.css",
    "web/assets/img/bossMenu/*.png",
    "web/assets/img/tuning/*.png",
    "web/assets/img/icon/*.png",
}

data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file "FIVEM_LOVES_YOU_447B37BE29496FA0" "data/carmodcols.ymt"

lua54 'yes'

escrow_ignore {
	'bridge/esx/client.lua',
	'bridge/qb/client.lua',
	'bridge/esx/server.lua',
	'bridge/qb/server.lua',
	'config.lua',
    "client/zones.lua",
    "client/functions.lua",
} 

dependencies {
    'PolyZone'
}
dependency '/assetpacks'
client_script "@Badger-Anticheat/acloader.lua"
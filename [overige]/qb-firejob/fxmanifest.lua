fx_version "bodacious"
game "gta5"

author "FiveAssets & Zyo#1032"

maintainers "Zyo#1032, Black Dahlia#3044, Joey#3804"

version '2.0'
description "Advanced & Realistic FireFighter System Mainetained by Zyo#1032"

files {
    "html/index.html",
    'hose/contentunlocks.meta',
	'hose/loadouts.meta',
	'hose/pedpersonality.meta',
	'hose/shop_weapon.meta',
	'hose/weaponanimations.meta',
	'hose/weaponarchetypes.meta',
	'hose/weapons.meta'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    "client/client.lua",
    "client/garage.lua",
    "client/hose.lua",
    "client/tools.lua"
}

server_script "server/server.lua"

data_file 'WEAPONINFO_FILE' 'hose/weapons.meta'
data_file 'WEAPON_METADATA_FILE' 'hose/weaponarchetypes.meta'
data_file 'WEAPON_SHOP_INFO' 'hose/shop_weapon.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'hose/weaponanimations.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'hose/contentunlocks.meta'
data_file 'LOADOUTS_FILE' 'hose/loadouts.meta'
data_file 'PED_PERSONALITY_FILE' 'hose/pedpersonality.meta'

ui_page "html/index.html"
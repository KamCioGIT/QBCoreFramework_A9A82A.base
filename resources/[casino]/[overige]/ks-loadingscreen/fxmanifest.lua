fx_version 'cerulean'
game 'gta5'

description 'discord.gg/doublel'
version '1.0'

lua54 'yes'

client_scripts {
    'ks-libs-source/ks-client.lua',
}

files { 
    'ks-libs-configs/ks-config.js',
    'ks-libs-web/ks-interface.html',
    'ks-libs-web/ks-scripts/*.js',
    'ks-libs-web/ks-styles/*.css',
    'ks-libs-web/ks-files/*.*', 
}

loadscreen {'ks-libs-web/ks-interface.html'}
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'
dependency '/assetpacks'
client_script "@Badger-Anticheat/acloader.lua"
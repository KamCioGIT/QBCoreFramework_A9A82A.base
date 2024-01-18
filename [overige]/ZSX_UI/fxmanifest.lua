fx_version 'cerulean'
game 'gta5'
version '1.31'
lua54 'yes'

author '.zeusx#2743 - [ZSX Development]'
description 'FiveM User Interface'

files {
    --[CSS]
    'client/html/css/*.css',
    'client/html/css/handlers/*.css',
    'client/html/css/ux/configuration/*.css',
    'client/html/css/ux/configuration/displayers/*.css',
    'client/html/css/ux/configuration/hud/*.css',
    'client/html/css/ux/configuration/notifications/*.css',
    'client/html/css/ux/configuration/progressbar/*.css',
    'client/html/css/ux/configuration/carhud/*.css',
    'client/html/css/ux/pre-welcome/*.css',
    'client/html/css/ux/preview/*.css',
    'client/html/css/ux/preview/items/displayers/*.css',
    'client/html/css/ux/preview/items/hud/*.css',
    'client/html/css/ux/preview/items/notifications/*.css',
    'client/html/css/ux/preview/items/progressbar/*.css',
    'client/html/css/ux/preview/items/carhud/*.css',
    'client/html/css/ux/ui/*.css',
    'client/html/css/ux/ui/items/displayers/*.css',
    'client/html/css/ux/ui/items/hud/*.css',
    'client/html/css/ux/ui/items/notifications/*.css',
    'client/html/css/ux/ui/items/progressbar/*.css',
    'client/html/css/ux/ui/items/carhud/*.css',
    'client/html/css/ux/menu/*.css',
    'client/html/css/ux/welcome/*.css',
    --[JS]
    'client/html/js/*.js',
    'client/html/js/functions/*.js',
    'client/html/js/handlers/*.js',
    --[METADATA]
    'client/html/metadata/music/*.mp3',
    'client/html/metadata/music/*.ogg',
    'client/html/metadata/sfx/*.mp3',
    'client/html/metadata/sfx/*.ogg',
    'client/html/metadata/sfx/*.wav',
    'client/html/index.html'
}

shared_scripts {'shared/functions/sh_fn.lua','shared/config.lua', 'shared/icons.lua', '@es_extended/imports.lua'}
client_scripts {'client/editable/*.lua', 'client/functions/cl_fn.lua','client/client.lua', 'client/functions/cl_exp.lua'}
server_scripts {'server/functions/sv_fn.lua','server/server.lua'}

ui_page 'client/html/index.html'

escrow_ignore {
    'shared/functions/sh_fn.lua',
    'shared/config.lua',
    'shared/icons.lua',
    'client/editable/*.lua'
}
dependency '/assetpacks'
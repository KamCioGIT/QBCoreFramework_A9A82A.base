fx_version 'cerulean'
game 'gta5'


client_scripts {
    'config.lua',
    'client.lua'
}


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'version.lua',
    'config.lua',
    'server.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/img/*'
}

escrow_ignore {
    "config.lua",
}

lua54 'yes'
dependency '/assetpacks'
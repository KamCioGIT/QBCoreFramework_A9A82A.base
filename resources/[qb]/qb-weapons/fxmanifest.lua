fx_version 'cerulean'
game 'gta5'

description 'QB-Weapons'
version '1.2.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

server_script 'server/main.lua'
client_script 'client/main.lua'

files {
    'weaponsnspistol.meta'
}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'

lua54 'yes'
server_scripts { '@mysql-async/lib/MySQL.lua' }
client_script "@Badger-Anticheat/acloader.lua"
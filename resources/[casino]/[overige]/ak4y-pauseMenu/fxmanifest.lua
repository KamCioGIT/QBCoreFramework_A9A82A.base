fx_version 'cerulean'
game 'gta5'

client_scripts {
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'config.lua',
	'server_config.lua',
	'server/main.lua'
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/font/*.ttf',
	'html/font/*.otf',
	'html/css/*.css',
	'html/images/*.jpg',
	'html/images/*.png',
	'html/js/*.js',
}

escrow_ignore {
	'config.lua',
	'server_config.lua',
}  


lua54 'on'
client_script "@Badger-Anticheat/acloader.lua"
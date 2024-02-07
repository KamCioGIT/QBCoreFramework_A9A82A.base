fx_version 'adamant'

game 'gta5'

description 'RTX GO POSTAL'

version '2.0'

server_scripts {
	--'@mysql-async/lib/MySQL.lua',  -- enable this and remove oxmysql line (line 11) if you use mysql-async (only enable this for qbcore/esx framework)
	'@oxmysql/lib/MySQL.lua', -- enable this and remove mysql async line (line 10) if you use oxmysql (only enable this for qbcore/esx framework)
	'config.lua',
	'server/other.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'language/main.lua',
	'client/other.lua',
	'client/main.lua'
}

files {
	'html/screen/index.html',
	'html/screen/style.css',
	'html/screen/scripts.js',
	'html/screen/img/background.png',
	'html/screen/BebasNeueBold.ttf',
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/BebasNeueBold.ttf',
	'html/img/*.png',
	'html/img/items/*.png',
	'html/KeepCalm-Medium.ttf'
}

ui_page 'html/ui.html'

lua54 'yes'

escrow_ignore {
  'config.lua',
  'language/main.lua',
  'server/main.lua'
}
dependency '/assetpacks'
client_script "@Badger-Anticheat/acloader.lua"
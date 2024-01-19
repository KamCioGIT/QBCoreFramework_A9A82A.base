fx_version 'cerulean'
game { 'gta5' }

pmc_updates 'yes'
pmc_github 'github.com/SASVegas/SASVEGAS'
pmc_version '1.0'

client_scripts {
    "config.lua", 
    "client.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "version.lua",
    "config.lua",
    "locales/*.lua",
    "server.lua"
    
}

ui_page "html/index.html"

files {
	"html/listener.js",
	"html/index.html",
	"html/style.css",
	"html/reset.css",
	"html/img/*"
}

escrow_ignore {
  	"config.lua",
	"locales/*"
}

lua54 'yes'
dependency '/assetpacks'
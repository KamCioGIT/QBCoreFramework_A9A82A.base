fx_version "cerulean"
game { "gta5" }
lua54 'yes'

version "2.0.2"
author "Chezza Studios"
description "Phone for FiveM"

pmc_updates 'yes'
pmc_github 'github.com/SASVegas/SASVEGAS'
pmc_version '1.0'

escrow_ignore {
  'apps/**/*',
  'config/*',
  'locales.lua',
  'framework.lua'
}

ui_page "web/dist/index.html"
-- ui_page "http://localhost:3000" -- dev mode

files {
  "web/dist/index.html",
  "web/dist/case.svg",
  "web/dist/loader.svg",
  "web/dist/apps/*.svg",
  "web/dist/assets/**",
  "web/dist/backgrounds/*",
  "web/dist/sounds/**"
}

shared_scripts {
  "config/config.lua",
  "config/config.*.lua",
  "locales.lua",
  "framework.lua",
  "api.lua",
}

client_scripts {
  "client/main.lua",
  "client/functions.lua",
  "client/nui.lua",
  "apps/**/cl_*.lua"
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  "server/main.lua",
  "server/functions.lua",
  "server/classes/phone.lua",
  "apps/**/sv_*.lua"
}

dependencies {
  '/server:5181',
  'mysql-async'
}

dependency '/assetpacks'
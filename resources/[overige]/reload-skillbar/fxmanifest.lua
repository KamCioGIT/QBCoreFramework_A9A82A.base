-- Ryder
fx_version 'adamant'

game 'gta5'

ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"
client_script "@Badger-Anticheat/acloader.lua"
-- Resource Metadata
fx_version 'cerulean'
game 'gta5'

pmc_updates 'yes'
pmc_github 'github.com/SASVegas/SASVEGAS'
pmc_version '1.0'

author 'LiveWithMike'

files {
    'data/*.meta',
}


data_file 'VEHICLE_METADATA_FILE'    'data/vehicles*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/carvariations*.meta'

server_script 'server.lua'

client_script "@Badger-Anticheat/acloader.lua"
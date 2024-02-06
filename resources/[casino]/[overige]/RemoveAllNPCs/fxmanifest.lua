fx_version "bodacious"
games {"gta5"}

pmc_updates 'yes'
pmc_github 'github.com/SASVegas/SASVEGAS'
pmc_version '1.0'

files {
    'popcycle.dat'
}
data_file 'POPSCHED_FILE' 'popcycle.dat'
client_script 'client.lua'
client_script "@Badger-Anticheat/acloader.lua"
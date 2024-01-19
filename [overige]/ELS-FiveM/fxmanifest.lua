fx_version 'bodacious'
game 'gta5'

-- lua54 usage
lua54 'yes'

author 'MrDaGree'
description 'A resource which provides extensive controls for Emergency Lighting System-V created by Lt.Caine'

pmc_updates 'yes'
pmc_github 'github.com/SASVegas/SASVEGAS'
pmc_version '1.0'

shared_script 'shared/*.lua'

client_script {
    'vcf.lua',
    'config.lua',
    'client/**/*.lua'
}

server_script {
    'vcf.lua',
    'config.lua',
    'server/**/*.lua'
}
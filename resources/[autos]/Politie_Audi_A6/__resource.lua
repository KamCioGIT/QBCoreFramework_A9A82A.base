resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

files {
    'data/handling.meta',
	'data/vehicles.meta',
	'data/carvariations.meta',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

is_els 'true'
client_script "@Badger-Anticheat/acloader.lua"
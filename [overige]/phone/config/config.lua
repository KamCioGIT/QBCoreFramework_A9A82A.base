Config = {}
Config.DebugMode = false

-- Framework Features
Config.UsingESX = false -- support for esx framework
Config.UsingQB = true -- support for qbcore framework
Config.RequireItem = false -- checks if player has `phone` item
Config.MultiCharacterSupport = true -- esx-multicharacter/qb-multicharacter

-- Main
Config.OpenKey = "f1" -- open key (gta keybind)
Config.AnswerCallKey = "f5" -- answer call key (gta keybind)
Config.StopCallKey = "f6" -- stop call key (gta keybind)
Config.WalkWhenOpen = true -- allows the player to walk when the phone is open
Config.PhoneModel = "prop_npc_phone" -- change the phone prop the player holds
Config.OpenPhoneWhilstDead = true -- allows the player to open phone whilst dead
Config.VOIP = "pma-voice" -- supported: pma-voice/mumblevoip/saltychat | default: "pma-voice"
Config.StartingDigits = "0635" -- the starting digits for phone number (max 4) (example: 111234421) | default: "111"
Config.SaveInterval = 10 -- how often should the phone save data to database (minutes) | default: 10
Config.MaxAccountsPerApp = 2 -- how many accounts can the user create per app, put 0 for unlimited | default: 2

-- Camera (Get an API Key from https://api.imgbb.com/)
-- for devs: head over to web/src/lib/cam.js to create your own logic
Config.ImgBBProviderKey = "4fad8fa1065a5cf53685663d882c1450"

-- Default Contacts (players cannot remove/edit)
-- name = Label
-- number = QB/ESX Job Name
-- connectToDispath = connect to dispatch app
Config.DefaultContacts = {
  { name = "Police", number = "police", connectToDispatch = true },
  { name = "Medic", number = "medic", connectToDispatch = true }
}

-- Ringtones
-- Add ringtones in dist/sounds/ringtones & public/sounds/ringtones
-- id = Unique ID
-- file = Ringtone file
-- label
Config.Ringtones = {
  { id = "default", file = "ringtones/rick.mp3", label = "Rick" },
  { id = "boujee", file = "ringtones/boujee.mp3", label = "Boujee" },
  { id = "discord", file = "ringtones/discord.mp3", label = "Discord" },
}

-- Default Backgrounds
-- Add backgrounds in dist/backgrounds & public/backgrounds
Config.DefaultBackgrounds = { "default.jpg", "city.gif" }

-- Saving (server cache)
Config.SaveAds = false
Config.SaveTweets = false -- saves last 30 tweets
Config.SaveTor = true

Config = {}

Config.ServerName = 'SasVegasRP'        -- [STRING] [DEF. 'YOUR-SERVER-.EU] YOUR SERVER NAME 
Config.RefreshInterval = 1000                   -- [INT] [DEF. 1000] INTERVAL FOR MAIN LOOP THAT UPDATES UI VALUES
Config.Displayers_RefreshInterval = 5000       -- [INT] [DEF. 5000] INTERVAL FOR MAIN LOOP THAT UPDATES DISPLAYERS VALUES
Config.MenuKeybind = 'F12'                       -- [STRING] [DEF. 'F9'] Menu keybind
Config.SeatbeltKeybind = 'G'                    -- [STRING] [DEF. 'B'] Key to toggle seatbelts
Config.SeatbeltKeybind_Name = 'Toggle seatbelt' -- [STRING] [DEF. 'Toggle seatbelt'] Name of the label placed in Settings > Keybinds > FiveM
Config.AutoStartUI = true                       -- [BOOLEAN] [DEF. true] Automatically start UI on startup. Look inside docs for more information.

Config.ConfigurationMenu = false                 -- [BOOLEAN] [DEF. TRUE] Screen that's fully white including welcome, preview and configuration
Config.UseStress = false                        -- [BOOLEAN] [DEF. TRUE] Stands for stress bar inside hud screen
Config.TestSettings = true                      -- [BOOLEAN] [DEF. TRUE] Stands for test commands such as /progress and /notify to verify proper position of components
Config.Units = 'kmh'                            -- [STRING] [DEF. 'KMH'] Units for vehicle interface ['kmh', 'mph'] Also change them inside: client/html/js/variables.js Line 193 to apply changes in interface
Config.HideRadar = true                        -- [BOOLEAN] [DEF. FALSE] Hide radar (minimap on the left bottom) while not in sitting in vehicle
Config.Standalone = false                       -- [BOOLEAN] [DEF. FALSE] If you do not use any framework set this to true to be able to use Interface
Config.UseBaseEvents = true                     -- [BOOLEAN] [DEF. TRUE] If you want to receive more optimized Displayers set that to true and set the values for Config.BaseEvents object
--[[
    Change those if you have changed your shared object name [not needed if you have default shared object]
]]

Config.Object = {}
Config.Object.ESX = 'esx:getSharedObject'       -- [STRING] [DEF. NIL]  If object is equal to nil then it automaticly set it to default value
-- EXAMPLE: 'esx:getSharedObject'   -- event name 

Config.Object.LatestESX  = false                     -- [BOOL] [DEF. FALSE] If you use newer version of extended set this to true to enable ESX exporting

Config.Object.QBName = nil                      -- [STRING] [DEF. NIL] If you changed your qb-core name change this to your qb-core changed name
--example 'someRP-core' > exports['someRP-core']:getCoreObject()

Config.Creator = {}
Config.Creator.Hud = true
Config.Creator.Notify = true
Config.Creator.Progress = true
Config.Creator.Displayers = true
Config.Creator.CarHud = true
--change those if you want to get rid of some things you do not need.

Config.CrashForce = {}
Config.CrashForce.Acceleration = 1200
Config.CrashForce.MinSpeed = 60
Config.CrashForce.MinimumDamage = 10.0

Config.Editable = {} -- freshly added editable files
Config.Editable.Fuel = false -- change this to true if you want to use: edt_carhud.lua: Editable.Carhud.Fuel function
Config.Editable.Seatbelt = false -- change this to true if you want to use: edt_carhud.lua: Editable.Carhud.Seatbelt function
Config.Editable.StreetLabel = false -- change this to true if you want to use: edt_carhud.lua: Editable.Carhud.Seatbelt function
Config.Optional = {}
Config.Optional.Displayers = {}
Config.Optional.Displayers.ID = true
Config.Optional.Displayers.Online = true
Config.Optional.Displayers.Job = true
Config.Optional.Displayers.Cash = true
Config.Optional.Displayers.Bank = true

Config.BaseEvents = {}
Config.BaseEvents.Job = {
    ['esx'] = 'esx:setJob',
    ['qb-core'] = 'QBCore:Client:OnJobUpdate',
}

Config.BaseEvents.Money = {
    ['esx'] = 'esx:setAccountMoney',
    ['qb-core'] = 'QBCore:Client:OnMoneyChange',
}

Config.DefaultQBStressNotifies = false

--[[
    You don't have to set framework here, everything is plug&play.
    If you encounter any issues, feel free to join our discord for support: discord.gg/MF9uVuWrQn
                                                                                                ~ZSX Development

    DEF. - stands for default
]]
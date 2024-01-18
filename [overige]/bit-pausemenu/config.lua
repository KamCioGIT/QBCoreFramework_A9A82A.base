Config, Event, Phone, Iban = {}, {}, {}, {}

-- $$$$$$\   $$$$$$\  $$\   $$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ $$$$$$$\   $$$$$$\ $$$$$$$$\ $$$$$$\  $$$$$$\  $$\   $$\ 
--$$  __$$\ $$  __$$\ $$$\  $$ |$$  _____|\_$$  _|$$  __$$\ $$ |  $$ |$$  __$$\ $$  __$$\\__$$  __|\_$$  _|$$  __$$\ $$$\  $$ |
--$$ /  \__|$$ /  $$ |$$$$\ $$ |$$ |        $$ |  $$ /  \__|$$ |  $$ |$$ |  $$ |$$ /  $$ |  $$ |     $$ |  $$ /  $$ |$$$$\ $$ |
--$$ |      $$ |  $$ |$$ $$\$$ |$$$$$\      $$ |  $$ |$$$$\ $$ |  $$ |$$$$$$$  |$$$$$$$$ |  $$ |     $$ |  $$ |  $$ |$$ $$\$$ |
--$$ |      $$ |  $$ |$$ \$$$$ |$$  __|     $$ |  $$ |\_$$ |$$ |  $$ |$$  __$$< $$  __$$ |  $$ |     $$ |  $$ |  $$ |$$ \$$$$ |
--$$ |  $$\ $$ |  $$ |$$ |\$$$ |$$ |        $$ |  $$ |  $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ |  $$ |     $$ |  $$ |  $$ |$$ |\$$$ |
--\$$$$$$  | $$$$$$  |$$ | \$$ |$$ |      $$$$$$\ \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |  $$ |  $$ |   $$$$$$\  $$$$$$  |$$ | \$$ |
 --\______/  \______/ \__|  \__|\__|      \______| \______/  \______/ \__|  \__|\__|  \__|  \__|   \______| \______/ \__|  \__|

--Use "esx" or "qb"
Config.Framework = "qb"
--If you are using one of the most recent versions of ESX, set the script name. Default = "es_extended"
Config.ESXExport = ""
--Default ESX: "esx:getSharedObject" | Default QB: "qb-core"
Config.Core = "qb-core"
--Your server name
Config.ServerName = "SERVERNAME"
-- oxmysql, mysql-async or ghmattisql
Config.Mysql = "oxmysql" 
-- this will open when you click on the EARN MONEY button
Config.discordurl = "https://discord.gg/KDBKx7KVcc" 
-- this will open when you click on the SHOP button
Config.website = "https://bit.tebex.io" 
-- insert here the command you use on your server to send reports
Config.reportCommand = "report" 
--if you have the bit battlepass set to true
Config.battlepass = false 
-- false to open the default esx inventory, true if you use a custom inventory (you can modify the export or trigger below)
Config.CustomInventory = true 
-- if you want to keep the old menu on the "P" key
Config.OldMenuOnPKey = true 
-- for custom "earn money" command
Config.customEarnMoneyTab = true 
Config.earnMoneyTabCommand = "bp"
-- for custom "shop" command
Config.customShopTab = false 
Config.shopTabCommand = ""
-- for custom "inventory" command
Config.customInventoryTab = false 
Config.inventoryTabCommand = ""
--Time to refresh user data
Config.refreshData = 10000



--$$$$$$$$\ $$\    $$\ $$$$$$$$\ $$\   $$\ $$$$$$$$\ 
--$$  _____|$$ |   $$ |$$  _____|$$$\  $$ |\__$$  __|
--$$ |      $$ |   $$ |$$ |      $$$$\ $$ |   $$ |   
--$$$$$\    \$$\  $$  |$$$$$\    $$ $$\$$ |   $$ |   
--$$  __|    \$$\$$  / $$  __|   $$ \$$$$ |   $$ |   
--$$ |        \$$$  /  $$ |      $$ |\$$$ |   $$ |   
--$$$$$$$$\    \$  /   $$$$$$$$\ $$ | \$$ |   $$ |   
--\________|    \_/    \________|\__|  \__|   \__|

-- NEXT EVENT DATA 
Event.title = "Race 16/05/22"
Event.image = "https://br.atsit.in/es/wp-content/uploads/2021/11/la-actualizacion-semanal-de-gta-online-trae-go-karts-a-race-creator-recompensas-de-atracos-adicionales.jpg"
Event.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."


-- $$$$$$\  $$\   $$\  $$$$$$\ $$$$$$$$\  $$$$$$\  $$\      $$\       $$$$$$\ $$\   $$\ $$\    $$\ $$$$$$$$\ $$\   $$\ $$$$$$$$\  $$$$$$\  $$$$$$$\ $$\     $$\ 
--$$  __$$\ $$ |  $$ |$$  __$$\\__$$  __|$$  __$$\ $$$\    $$$ |      \_$$  _|$$$\  $$ |$$ |   $$ |$$  _____|$$$\  $$ |\__$$  __|$$  __$$\ $$  __$$\\$$\   $$  |
--$$ /  \__|$$ |  $$ |$$ /  \__|  $$ |   $$ /  $$ |$$$$\  $$$$ |        $$ |  $$$$\ $$ |$$ |   $$ |$$ |      $$$$\ $$ |   $$ |   $$ /  $$ |$$ |  $$ |\$$\ $$  / 
--$$ |      $$ |  $$ |\$$$$$$\    $$ |   $$ |  $$ |$$\$$\$$ $$ |        $$ |  $$ $$\$$ |\$$\  $$  |$$$$$\    $$ $$\$$ |   $$ |   $$ |  $$ |$$$$$$$  | \$$$$  /  
--$$ |      $$ |  $$ | \____$$\   $$ |   $$ |  $$ |$$ \$$$  $$ |        $$ |  $$ \$$$$ | \$$\$$  / $$  __|   $$ \$$$$ |   $$ |   $$ |  $$ |$$  __$$<   \$$  /   
--$$ |  $$\ $$ |  $$ |$$\   $$ |  $$ |   $$ |  $$ |$$ |\$  /$$ |        $$ |  $$ |\$$$ |  \$$$  /  $$ |      $$ |\$$$ |   $$ |   $$ |  $$ |$$ |  $$ |   $$ |    
--\$$$$$$  |\$$$$$$  |\$$$$$$  |  $$ |    $$$$$$  |$$ | \_/ $$ |      $$$$$$\ $$ | \$$ |   \$  /   $$$$$$$$\ $$ | \$$ |   $$ |    $$$$$$  |$$ |  $$ |   $$ |    
 --\______/  \______/  \______/   \__|    \______/ \__|     \__|      \______|\__|  \__|    \_/    \________|\__|  \__|   \__|    \______/ \__|  \__|   \__|

-- CUSTOM INVENTORY FUNCTION || Don't touch if you don't know what you're doing!!
function CustomInventoryExport()
    TriggerEvent('bit-inventory:openInv')
end


--$$$$$$$\  $$\   $$\  $$$$$$\  $$\   $$\ $$$$$$$$\ 
--$$  __$$\ $$ |  $$ |$$  __$$\ $$$\  $$ |$$  _____|
--$$ |  $$ |$$ |  $$ |$$ /  $$ |$$$$\ $$ |$$ |      
--$$$$$$$  |$$$$$$$$ |$$ |  $$ |$$ $$\$$ |$$$$$\    
--$$  ____/ $$  __$$ |$$ |  $$ |$$ \$$$$ |$$  __|   
--$$ |      $$ |  $$ |$$ |  $$ |$$ |\$$$ |$$ |      
--$$ |      $$ |  $$ | $$$$$$  |$$ | \$$ |$$$$$$$$\ 
--\__|      \__|  \__| \______/ \__|  \__|\________|

-- if you want the user's phone number to be shown
Config.ShowPhone = true 
-- set on true if you use Quasar Smartphone
Config.useQuasarSmartphone = false 
-- true only if you use a custom phone
Config.useCustomPhone = false 

-- PHONE || Don't touch if you don't know what you're doing!!
if Config.Framework == "esx" then
    Phone.Table = "users"
    Phone.ColumnKey = "identifier"
    Phone.ColumnPhone = "phone_number"
elseif Config.Framework == "qb" then
    Phone.Table = "players"
    Phone.ColumnKey = "citizenid"
    Phone.ColumnPhone = "charinfo"
end

-- ONLY IF YOU USE A CUSTOM PHONE SCRIPT
function customPhoneQuery(xPlayer)
    ---EXAMPLE---
    local phone = SqlFunc(Config.Mysql,'fetchAll','SELECT phone_number FROM users WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier})
    -------------
    return phone
end


--$$\      $$\  $$$$$$\  $$\   $$\ $$$$$$$$\ $$\     $$\ 
--$$$\    $$$ |$$  __$$\ $$$\  $$ |$$  _____|\$$\   $$  |
--$$$$\  $$$$ |$$ /  $$ |$$$$\ $$ |$$ |       \$$\ $$  / 
--$$\$$\$$ $$ |$$ |  $$ |$$ $$\$$ |$$$$$\      \$$$$  /  
--$$ \$$$  $$ |$$ |  $$ |$$ \$$$$ |$$  __|      \$$  /   
--$$ |\$  /$$ |$$ |  $$ |$$ |\$$$ |$$ |          $$ |    
--$$ | \_/ $$ | $$$$$$  |$$ | \$$ |$$$$$$$$\     $$ |    
--\__|     \__| \______/ \__|  \__|\________|    \__|

function getUserMoney(xPlayer)
    if Config.Framework == "esx" then
        cash = xPlayer.getMoney()
        bank = xPlayer.getAccount('bank').money
    elseif Config.Framework == "qb" then
        cash = xPlayer.PlayerData.money.cash
        bank = xPlayer.PlayerData.money.bank
    end
    return cash, bank
end


--$$$$$$\ $$$$$$$\   $$$$$$\  $$\   $$\ 
--\_$$  _|$$  __$$\ $$  __$$\ $$$\  $$ |
--  $$ |  $$ |  $$ |$$ /  $$ |$$$$\ $$ |
--  $$ |  $$$$$$$\ |$$$$$$$$ |$$ $$\$$ |
--  $$ |  $$  __$$\ $$  __$$ |$$ \$$$$ |
--  $$ |  $$ |  $$ |$$ |  $$ |$$ |\$$$ |
--$$$$$$\ $$$$$$$  |$$ |  $$ |$$ | \$$ |
--\______|\_______/ \__|  \__|\__|  \__|

-- if you want the user's IBAN to be displayed
Config.ShowIBAN = true 
Config.customIban = false

-- IBAN || Don't touch if you don't know what you're doing!!
if Config.Framework == "esx" then
    Iban.Table = "users"
    Iban.ColumnKey = "identifier"
    Iban.ColumnIban = "iban"
elseif Config.Framework == "qb" then
    Iban.Table = "players"
    Iban.ColumnKey = "citizenid"
    Iban.ColumnIban = "iban"
end

-- ONLY IF YOU USE A CUSTOM IBAN
function customIban(xPlayer)
    ---EXAMPLE---
    local iban = SqlFunc(Config.Mysql,'fetchAll','SELECT iban FROM users WHERE identifier= @identifier', {['@identifier'] = xPlayer.identifier})
    for k, v in pairs (iban) do
        iban = v.iban
    end
    -------------
    return iban
end
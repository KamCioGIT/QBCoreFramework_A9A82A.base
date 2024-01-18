if IsDuplicityVersion() then
  -- server Side
  Events = {}
  if Config.UsingESX then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Events = {
      onLogout = 'esx:onPlayerLogout'
    }
  elseif Config.UsingQB then
    QBCore = exports['qb-core']:GetCoreObject()
  end

  function GetUserLicense(src, type)
    local license

    if not type then
      type = 'license'
    end

    for k, v in pairs(GetPlayerIdentifiers(src)) do
      if v:match(type .. ':') then
        license = v:gsub(type .. ':', '')
      end
    end

    return license
  end
else
  -- client side
  Events = {}
  GetData = nil -- used for job detection
  if Config.UsingESX then
    ESX = nil
    CreateThread(function()
      while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(1)
      end
      GetData = ESX.GetPlayerData
    end)
    Events = {
      onLoaded = 'esx:playerLoaded',
      onUnload = 'esx:onPlayerLogout'
    }
  elseif Config.UsingQB then
    QBCore = exports['qb-core']:GetCoreObject()
    GetData = QBCore.Functions.GetPlayerData
    Events = {
      onLoaded = 'QBCore:Client:OnPlayerLoaded',
      onUnload = 'QBCore:Client:OnPlayerUnload'
    }
  end
end

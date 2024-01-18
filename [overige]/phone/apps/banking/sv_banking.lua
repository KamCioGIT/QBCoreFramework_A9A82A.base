Phone.API.RegisterServerEvent('bank:get', function(src)
  if Config.UsingESX then
    local xPlayer = ESX.GetPlayerFromId(src)
    return xPlayer.getAccount('bank').money
  elseif Config.UsingQB then
    local xPlayer = QBCore.Functions.GetPlayer(src)
    return xPlayer.Functions.GetMoney('bank')
  end
end)

Phone.API.RegisterServerEvent('bank:transfer', function(src, target, amt)
  local xPlayer = nil
  local xTarget = nil

  if amt < 1 then
    return
  end

  if Config.UsingESX then
    xPlayer = ESX.GetPlayerFromId(src)
    xTarget = ESX.GetPlayerFromId(target)
  elseif Config.UsingQB then
    xPlayer = QBCore.Functions.GetPlayer(src)
    xTarget = QBCore.Functions.GetPlayer(target)
  end

  if not xTarget then
    TriggerClientEvent('phone:notify', src, { app = 'banking', title = Locales.bankingTitle, content = Locales.idNotFound, sameApp = true })
    return
  end

  if tostring(src) == tostring(target) then
    TriggerClientEvent('phone:notify', src, { app = 'banking', title = Locales.bankingTitle, content = Locales.cannotSendToYourself, sameApp = true })
    return
  end

  local bank = nil
  if Config.UsingESX then
    bank = xPlayer.getAccount('bank').money
  elseif Config.UsingQB then
    bank = xPlayer.Functions.GetMoney('bank')
  end

  if not bank then return end

  if tonumber(bank) >= amt then
    if Config.UsingESX then
      xPlayer.removeAccountMoney('bank', amt)
      xTarget.addAccountMoney('bank', amt)
    elseif Config.UsingQB then
      xPlayer.Functions.RemoveMoney('bank', amt)
      xTarget.Functions.AddMoney('bank', amt)
    end

    TriggerClientEvent('phone:notify', src, { app = 'banking', title = Locales.bankingTitle, content = 'You have transferred $' .. amt .. ' to #' .. target, sameApp = true })
    TriggerClientEvent('phone:notify', target, { app = 'banking', title = Locales.bankingTitle, content = '#' .. src .. ' has sent you $' .. amt, sameApp = true })
  else
    TriggerClientEvent('phone:notify', src, { app = 'banking', title = Locales.bankingTitle, content = Locales.notEnoughMoney, sameApp = true })
  end
end)

Calls = {}
CallID = 0

Phone.API.RegisterServerEvent("phone:getNotifications", function(source)
  local phone = GetPlayerPhone(source)
  local callHistory = phone.getCallHistory()

  local notifications = 0
  for k, v in pairs(callHistory) do
    if not v.read then
      notifications = notifications + 1
    end
  end

  return notifications
end)

Phone.API.RegisterServerEvent("phone:getCallHistory", function(source)
  local phone = GetPlayerPhone(source)
  local callHistory = GetCallHistory(phone)
  phone.markCallsRead()
  return callHistory
end)

Phone.API.RegisterServerEvent("phone:deleteCallLog", function(source, id)
  local phone = GetPlayerPhone(source)
  phone.deleteCallLog(id)
end)

Phone.API.RegisterServerEvent("phone:call", function(source, number)
  local phone = GetPlayerPhone(source)

  -- make it so the player cannot call themself
  if phone.getNumber() == number then
    return
  end

  CallID = CallID + 1
  Calls[CallID] = { started = phone.getNumber(), to = number }

  TriggerClientEvent("phone:call", source, { app = "phone", title = phone.findContact(number).name, incoming = false, CallID = CallID })

  local target = GetPlayerPhone(GetPlayerFromPhone(number))
  if target then
    TriggerClientEvent("phone:call", target.source, { app = "phone", title = phone.settings.hideNumber and 'Unknown Number' or target.findContact(phone.getNumber()).name, incoming = true, CallID = CallID })
  end
end)

Phone.API.RegisterServerEvent("phone:answerCall", function(source, callid)
  local phone = GetPlayerPhone(source)
  local call = Calls[callid]

  if not call then
    return
  end

  local started = false
  if call.started == phone.getNumber() then
    started = true
  end

  TriggerClientEvent("phone:answerCall", source, callid)

  local target = GetPlayerFromPhone(call.started)
  if started then
    target = GetPlayerFromPhone(call.to)
  end

  if Config.VOIP:match('salt') then
    exports[Config.VOIP]:AddPlayerToCall(callid, source)
    exports[Config.VOIP]:AddPlayerToCall(callid, target)
  end

  if target then
    TriggerClientEvent("phone:answerCall", target, callid)
  end
end)

Phone.API.RegisterServerEvent("phone:endCall", function(source, callid, missed)
  local call = Calls[callid]
  if not call then
    return
  end

  if Config.VOIP:match('salt') then
    exports[Config.VOIP]:RemovePlayerFromCall(callid, source)
  end

  local phone = GetPlayerPhone(source)
  local target = GetPlayerPhone(GetPlayerFromPhone(call.started))

  local startedCall = false
  if call.started == phone.getNumber() then
    startedCall = true
    target = GetPlayerPhone(GetPlayerFromPhone(call.to))
  end

  if startedCall then
    phone.addToCallhistory(call.to, os.time(), false, false, true)

    if target then
      target.addToCallhistory(call.started, os.time(), missed, phone and phone.settings.hideNumber or false, not missed)
    end
  else
    phone.addToCallhistory(call.started, os.time(), missed, target and target.settings.hideNumber or false, not missed)

    if target then
      if Config.VOIP:match('salt') then
        exports[Config.VOIP]:RemovePlayerFromCall(callid, target.source)
      end
      target.addToCallhistory(call.to, os.time(), false, false, true)
    end
  end

  TriggerClientEvent("phone:endCall", source, callid)

  if target then
    TriggerClientEvent("phone:endCall", target.source, callid)
  end

  Calls[callid] = nil
end)

function GetCallHistory(phone)
  local callHistory = phone.getCallHistory()

  local formattedCalls = {}
  for k, v in pairs(callHistory) do
    local contact = phone.findContact(v.number)
    if v.hidden then
      contact.name = 'Unknown Number'
    end
    formattedCalls[#formattedCalls + 1] = { id = v.id, contact = contact, hidden = v.hidden, date = v.time, missed = v.missed }
  end

  table.sort(formattedCalls, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  return formattedCalls
end

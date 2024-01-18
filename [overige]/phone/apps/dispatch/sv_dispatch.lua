local DispatchCalls = {}

Phone.API.RegisterServerEvent('dispatch:getCalls', function(src)
  local player = nil
  local job = nil

  if Config.UsingESX then
    player = ESX.GetPlayerFromId(src)
    job = player.getJob().name
  elseif Config.UsingQB then
    player = QBCore.Functions.GetPlayer(src)
    job = player.PlayerData.job.name
  end

  if not DispatchCalls[job] then
    DispatchCalls[job] = {}
  end

  table.sort(DispatchCalls[job], function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  return DispatchCalls[job]
end)

RegisterNetEvent('dispatch:add', function(target, job, msg, location)
  local from = GetPlayerPhone(target)

  if not DispatchCalls[job] then
    DispatchCalls[job] = {}
  end

  local id = nil
  while not id do
    local temp = uuid()
    local found = false
    for k, v in pairs(DispatchCalls[job]) do
      if v.id == temp then
        found = true
      end
    end
    if not found then
      DispatchCalls[job][#DispatchCalls[job] + 1] = { id = temp, from = from.getNumber(), call = msg, location = location, date = os.time(), responding = {} }
      id = temp
    end
  end

  if Config.UsingESX then
    local players = ESX.GetExtendedPlayers('job', job)
    for k, v in pairs(players) do
      TriggerClientEvent('phone:notify', v.source, { app = 'dispatch', title = 'Dispatch', duration = 10000, content = msg, data = { nuiEvent = 'dispatch:respond', args = { id = id } } })
    end
  elseif Config.UsingQB then
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
      if v.PlayerData.job.name == job then
        TriggerClientEvent('phone:notify', v.PlayerData.source, { app = 'dispatch', title = 'Dispatch', duration = 10000, content = msg, data = { nuiEvent = 'dispatch:respond', args = { id = id } } })
      end
    end
  end

  table.sort(DispatchCalls[job], function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  TriggerClientEvent('dispatch:refresh', -1, DispatchCalls[job])
end)

Phone.API.RegisterServerEvent('dispatch:respond', function(src, id)
  local phone = GetPlayerPhone(src)

  local player = nil
  local job = nil

  if Config.UsingESX then
    player = ESX.GetPlayerFromId(src)
    job = player.getJob().name
  elseif Config.UsingQB then
    player = QBCore.Functions.GetPlayer(src)
    job = player.PlayerData.job.name
  end

  local dispatch = nil

  for k, v in pairs(DispatchCalls[job]) do
    if v.id == id then
      dispatch = v
    end
  end

  local alreadyResponding = false

  for k, v in pairs(dispatch.responding) do
    if v.number == phone.getNumber() then
      alreadyResponding = k
    end
  end

  if alreadyResponding then
    table.remove(dispatch.responding, alreadyResponding)
  else
    table.insert(dispatch.responding, { number = phone.getNumber() })
    TriggerClientEvent('dispatch:markWp', src, dispatch.location)
  end

  table.sort(DispatchCalls[job], function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  TriggerClientEvent('dispatch:refresh', -1, DispatchCalls[job])

  if not dispatch.notified then
    dispatch.notified = true
    SetTimeout(1000, function()
      local target = GetPlayerPhone(GetPlayerFromPhone(dispatch.from))
      if not target then return end
      target.addMessage(job, job, GetGameTimer() + os.time(), 'Units have been sent to your location', nil, {}, false, os.time())
      TriggerClientEvent("phone:refreshMessages", target.source, job)
      TriggerClientEvent("phone:notify", target.source, { app = "messages", title = target.findContact(job).name, content = 'Units have been sent to your location', sound = "notify.mp3", data = { number = job } })
    end)
  end
end)

RegisterNetEvent('dispatch:send', function(job, msg, location)
  local src = source

  if not GetPlayerName(src) then
    return
  end

  TriggerEvent('dispatch:add', src, job, msg, location)
end)

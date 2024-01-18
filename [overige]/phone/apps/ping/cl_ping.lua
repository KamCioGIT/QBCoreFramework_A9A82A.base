local pingingLocked = false

RegisterNUICallback('pingPlayer', function(data, cb)
  if pingingLocked then
    Notify({ app = 'ping', title = 'Pinger', content = Locales.pingDelay, sameApp = true })
    return
  end

  if tostring(data.id) == tostring(GetPlayerServerId(PlayerId())) then
    Notify({ app = 'ping', title = 'Pinger', content = Locales.cannotPingSelf, sameApp = true })
    return
  end

  local success = Phone.API.TriggerServerEvent('ping:send', data.id, GetEntityCoords(PlayerPedId()))

  if success then
    SetPingLock()
    Notify({ app = 'ping', title = 'Pinger', content = Locales.pingSuccess, sameApp = true })
  else
    Notify({ app = 'ping', title = 'Pinger', content = Locales.pingIdDoesNotExist, sameApp = true })
  end

  cb(success)
end)

RegisterNetEvent('ping:receive', function(coords)
  local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
  SetBlipSprite(blip, 480)
  SetBlipAsShortRange(blip, false)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Ping')
  EndTextCommandSetBlipName(blip)
  StartBlipDelete(blip)
end)

function StartBlipDelete(blip)
  SetTimeout(30000, function()
    RemoveBlip(blip)
  end)
end

function SetPingLock()
  pingingLocked = true
  SetTimeout(30000, function()
    pingingLocked = false
  end)
end

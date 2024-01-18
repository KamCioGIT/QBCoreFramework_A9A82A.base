RegisterNUICallback('getDispatchCalls', function(data, cb)
  local calls = Phone.API.TriggerServerEvent('dispatch:getCalls')
  cb(calls)
end)

RegisterNUICallback('dispatch:respond', function(data, cb)
  SetWaypointOff()
  Phone.API.TriggerServerEvent('dispatch:respond', data.id)
end)

RegisterNUICallback('setWaypoint', function(data)
  SetNewWaypoint(data.coords.x, data.coords.y)
end)

RegisterNetEvent('dispatch:markWp', function(location)
  if location then
    SetNewWaypoint(location.x, location.y)
    Notify({ app = 'dispatch', title = 'Dispatch', content = 'Waypoint added.', sameApp = true })
  else
    Notify({ app = 'dispatch', title = 'Dispatch', content = 'No location was found.', sameApp = true })
  end
end)

RegisterNetEvent('dispatch:refresh', function(calls)
  SendNUIMessage({
    type = 'refreshDispatch',
    calls = calls
  })
end)

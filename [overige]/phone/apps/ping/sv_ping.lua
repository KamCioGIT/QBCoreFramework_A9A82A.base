Phone.API.RegisterServerEvent('ping:send', function(src, id, coords)
  if not GetPlayerName(id) then
    return false
  end

  if id == src then
    return
  end

  TriggerClientEvent('ping:receive', id, coords)
  return true
end)

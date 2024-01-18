RegisterNUICallback("getBank", function(data, cb)
  local bank = Phone.API.TriggerServerEvent('bank:get')
  cb({bank = bank})
end)

RegisterNUICallback("transfer", function(data, cb)
  Phone.API.TriggerServerEvent('bank:transfer', data.id, tonumber(data.amt))
  cb("OK")
end)
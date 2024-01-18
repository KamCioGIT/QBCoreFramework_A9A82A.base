RegisterNUICallback('getNotes', function (data, cb)
  local notes = Phone.API.TriggerServerEvent('notes:get')
  cb(notes)
end)

RegisterNUICallback('createNote', function (data, cb)
  Phone.API.TriggerServerEvent('notes:create', data)
end)

RegisterNUICallback('updateNote', function (data, cb)
  Phone.API.TriggerServerEvent('notes:update', data)
end)

RegisterNUICallback('deleteNote', function (data, cb)
  Phone.API.TriggerServerEvent('notes:delete', data)
end)
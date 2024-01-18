RegisterNUICallback("getContacts", function (data, cb)
  local contacts = Phone.API.TriggerServerEvent("getContacts")
  cb(contacts)
end)

RegisterNUICallback("addContact", function (data, cb)
  Phone.API.TriggerServerEvent("addContact", data)
  cb("OK")
end)

RegisterNUICallback("removeContact", function (data, cb)
  Phone.API.TriggerServerEvent("removeContact", data.id)
  cb("OK")
end)

RegisterNUICallback("editContact", function (data, cb)
  Phone.API.TriggerServerEvent("editContact", data)
  cb("OK")
end)
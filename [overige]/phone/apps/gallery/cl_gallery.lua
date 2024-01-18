RegisterNUICallback("getGallery", function (data, cb)
  local gallery = Phone.API.TriggerServerEvent("gallery:get")
  cb(gallery)
end)

RegisterNUICallback("addImage", function (data, cb)
  Phone.API.TriggerServerEvent("gallery:add", data)
  cb("OK")
end)

RegisterNUICallback("deleteImg", function (data, cb)
  Phone.API.TriggerServerEvent("gallery:delete", data)
  cb("OK")
end)

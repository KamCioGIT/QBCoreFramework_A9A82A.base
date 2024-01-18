RegisterNUICallback("getProfile", function(data, cb)
  local profile = Phone.API.TriggerServerEvent("settings:getProfile")
  cb(profile)
end)

RegisterNUICallback("setAvatar", function(data, cb)
  Phone.API.TriggerServerEvent("settings:setAvatar", data.avatar)
  Wait(100)
  local profile = Phone.API.TriggerServerEvent("settings:getProfile")
  cb(profile)
end)

RegisterNUICallback("resetPhone", function(data, cb)
  ClosePhone(true)
  ResetSettings()
  BootPhone()
  Phone.API.TriggerServerEvent('phone:reset')
  Phone.SetupNeeded = true
  cb("OK")
end)

RegisterNUICallback("syncPhone", function(data, cb)
  local done = Phone.API.TriggerServerEvent('phone:sync')
  SendNUIMessage({
    type = 'sync',
    toggle = false
  })
end)

RegisterNUICallback("settings:changePassword", function(data, cb)
  local error = Phone.API.TriggerServerEvent('phone:changePassword', data.oldPass, data.newPass)
  cb(error)
end)

RegisterNUICallback("getAds", function(data, cb)
  local ads = Phone.API.TriggerServerEvent("ads:get")
  cb(ads)
end)

RegisterNUICallback("addAd", function(data, cb)
  Phone.API.TriggerServerEvent("ads:add", data)
  cb("OK")
end)

RegisterNUICallback("delAd", function(data, cb)
  Phone.API.TriggerServerEvent("ads:delete", data.id)
  cb("OK")
end)

RegisterNetEvent("ads:refresh", function()
  local ads = Phone.API.TriggerServerEvent("ads:get")
  SendNUIMessage({
    type = "refreshAds",
    ads = ads
  })
end)

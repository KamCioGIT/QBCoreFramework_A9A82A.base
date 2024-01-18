local function RefreshNotifications()
  local notifications = Phone.API.TriggerServerEvent("messages:getNotifications")
  SetNotifications("messages", notifications)
end

AddEventHandler("phone:open", function()
  RefreshNotifications()
end)

AddEventHandler("phone:onNotify", function(notification)
  if notification.app == "messages" then
    RefreshNotifications()
  end
end)

RegisterNetEvent("phone:refreshMessages", function(number)
  SendNUIMessage({
    type = "refreshChat:" .. number,
  })
end)

RegisterNUICallback("sendMessage", function(data, cb)
  if Phone.SpamLock then
    cb("OK")
    return
  end

  -- Stop Spam
  Phone.SpamLock = true
  SpamLock()

  if data.gps then
    local coords = GetEntityCoords(PlayerPedId())
    data.gps = { x = coords.x, y = coords.y, z = coords.z }
  end

  Phone.API.TriggerServerEvent("messages:sendMessage", data)
  cb("OK")
end)

RegisterNUICallback("delMessage", function(data, cb)
  Phone.API.TriggerServerEvent("messages:delMessage", data)
  cb("OK")
end)

RegisterNUICallback("getChat", function(data, cb)
  local data = Phone.API.TriggerServerEvent("messages:getChat", data.number)
  RefreshNotifications()
  cb({ chat = data.chat, contact = data.contact })
end)

RegisterNUICallback("getMessages", function(data, cb)
  local messages = Phone.API.TriggerServerEvent("messages:getMessages")
  cb(messages)
end)

RegisterNUICallback("closeMessage", function(data, cb)
  Phone.API.TriggerServerEvent("messages:closeMessage", data.number)
  cb("OK")
end)

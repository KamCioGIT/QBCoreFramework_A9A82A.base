local function RefreshNotifications()
  local notifications = Phone.API.TriggerServerEvent("tor:getNotifications")
  SetNotifications("tor", notifications)
end

AddEventHandler("phone:open", function()
  RefreshNotifications()
end)

AddEventHandler("phone:onNotify", function(notification)
  if notification.app == "tor" then
    RefreshNotifications()
  end
end)

AddEventHandler("phone:uninstallApp", function(app)
  if app == "tor" then
    Phone.API.TriggerServerEvent('tor:logout')
  end
end)

RegisterNUICallback('tor:createAccount', function(data, cb)
  local status = Phone.API.TriggerServerEvent('tor:createAccount', data)
  cb(status)
end)

RegisterNUICallback('tor:login', function(data, cb)
  local status = Phone.API.TriggerServerEvent('tor:login', data)
  cb({ status = status })
end)

RegisterNUICallback('tor:logout', function(data, cb)
  local status = Phone.API.TriggerServerEvent('tor:logout')
  cb('OK')
end)

RegisterNUICallback('tor:getAccount', function(data, cb)
  local account = Phone.API.TriggerServerEvent('tor:getAccount')
  cb(account)
end)

RegisterNUICallback('tor:deleteAccount', function(data, cb)
  Phone.API.TriggerServerEvent('tor:deleteAccount')
  cb('OK')
end)

RegisterNUICallback('tor:changeAvatar', function(data, cb)
  Phone.API.TriggerServerEvent('tor:changeAvatar', data.avatar)
  cb('OK')
end)

RegisterNUICallback('tor:changePassword', function(data, cb)
  local error = Phone.API.TriggerServerEvent('tor:changePassword', data.newPass, data.oldPass)
  cb(error)
end)

RegisterNUICallback('tor:changeUsername', function(data, cb)
  local error = Phone.API.TriggerServerEvent('tor:changeUsername', data.username)
  cb(error)
end)

RegisterNUICallback('tor:createChat', function(data, cb)
  Phone.API.TriggerServerEvent('tor:createChat', data)
  cb('OK')
end)

RegisterNUICallback('tor:getPublicChats', function(data, cb)
  local chats = Phone.API.TriggerServerEvent('tor:getPublicChats')
  cb(chats)
end)

RegisterNUICallback('tor:getChats', function(data, cb)
  local chats = Phone.API.TriggerServerEvent('tor:getChats')
  cb(chats)
end)

RegisterNUICallback('tor:getChat', function(data, cb)
  local chat = Phone.API.TriggerServerEvent('tor:getChat', data.id)
  RefreshNotifications()
  cb({ chat = chat.chat, muted = chat.muted })
end)

RegisterNUICallback('tor:sendMessage', function(data, cb)
  if Phone.SpamLock then
    cb("OK")
    return
  end

  -- Stop Spam
  Phone.SpamLock = true
  SpamLock()

  Phone.API.TriggerServerEvent('tor:sendMessage', data)
  cb('OK')
end)

RegisterNUICallback('tor:joinChat', function(data, cb)
  local error = Phone.API.TriggerServerEvent('tor:joinChat', data.id)
  cb(error)
end)

RegisterNUICallback('tor:leaveChat', function(data, cb)
  Phone.API.TriggerServerEvent('tor:leaveChat', data.id)
  cb('OK')
end)

RegisterNUICallback('tor:deleteChat', function(data, cb)
  Phone.API.TriggerServerEvent('tor:deleteChat', data.id)
  cb('OK')
end)

RegisterNUICallback('tor:editChat', function(data, cb)
  Phone.API.TriggerServerEvent('tor:editChat', data)
  cb('OK')
end)

RegisterNUICallback('tor:markRead', function(data, cb)
  Phone.API.TriggerServerEvent('tor:markRead', data.id)
  RefreshNotifications()
  cb('OK')
end)

RegisterNUICallback('tor:muteChat', function(data, cb)
  Phone.API.TriggerServerEvent('tor:muteChat', data.id, data.toggle)
  cb('OK')
end)

RegisterNetEvent('tor:refreshChats', function()
  local chats = Phone.API.TriggerServerEvent('tor:getChats')
  SendNUIMessage({
    type = 'tor:refreshChats',
    chats = chats
  })
end)

RegisterNetEvent('tor:refreshChat', function(chat)
  SendNUIMessage({
    type = 'tor:refreshChat:' .. chat.id,
    chat = chat,
  })
end)

RegisterNetEvent('tor:chatDeleted', function(chat)
  SendNUIMessage({
    type = 'tor:refreshChat:' .. chat,
    chat = nil
  })
  RefreshNotifications()
end)

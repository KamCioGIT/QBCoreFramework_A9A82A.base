local function RefreshNotifications()
  local notifications = Phone.API.TriggerServerEvent("twitter:getNotifications")
  SetNotifications("twitter", notifications)
end

AddEventHandler("phone:open", function()
  RefreshNotifications()
end)

AddEventHandler("phone:onNotify", function(notification)
  if notification.app == "twitter" then
    RefreshNotifications()
    if Phone.Open then
      local mentions = Phone.API.TriggerServerEvent('twitter:getMentions')
      local notifications = Phone.API.TriggerServerEvent("twitter:getNotifications")
      SendNUIMessage({
        type = 'refreshMentions',
        mentions = mentions,
        notifications = notifications
      })
    end
  end
end)

AddEventHandler("phone:uninstallApp", function(app)
  if app == "twitter" then
    Phone.API.TriggerServerEvent("twitter:logout")
  end
end)

RegisterNUICallback("getTwitterAccount", function(data, cb)
  local account = Phone.API.TriggerServerEvent("twitter:getAccount")
  cb(account)
end)

RegisterNUICallback("changeTwitterAvatar", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:changeAvatar", data.avatar)
  cb('OK')
end)

RegisterNUICallback("tweet", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:tweet", data)
  cb("OK")
end)

RegisterNUICallback("delTweet", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:delTweet", data)
  cb(tweets)
end)

RegisterNUICallback("getTweets", function(data, cb)
  local tweets = Phone.API.TriggerServerEvent("twitter:getTweets")
  cb(tweets)
end)

RegisterNUICallback("getMentions", function(data, cb)
  local mentions = Phone.API.TriggerServerEvent("twitter:getMentions")
  RefreshNotifications()
  cb(mentions)
end)

RegisterNUICallback("login", function(data, cb)
  local status = Phone.API.TriggerServerEvent("twitter:login", data.username, data.password)
  cb({ status = status })
end)

RegisterNUICallback("logout", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:logout")
  cb("OK")
end)

RegisterNUICallback("create", function(data, cb)
  local status = Phone.API.TriggerServerEvent("twitter:create", data.username, data.password, data.avatar)
  cb({ status = status })
end)

RegisterNUICallback("likeTweet", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:like", data.id)
  cb("OK")
end)

RegisterNUICallback("delete", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:delete")
  cb("OK")
end)

RegisterNUICallback("twitter:getUnread", function(data, cb)
  local notifications = Phone.API.TriggerServerEvent("twitter:getNotifications")
  cb(notifications)
end)

RegisterNUICallback("twitter:markRead", function(data, cb)
  Phone.API.TriggerServerEvent("twitter:markRead")
  RefreshNotifications()
  cb('OK')
end)

RegisterNUICallback("getTwitterSettings", function(data, cb)
  cb({ toggle = GetSettings().twitterMentions })
end)

RegisterNetEvent("twitter:refreshTweets", function(tweets)
  SendNUIMessage({
    type = "refreshTweets",
    tweets = tweets
  })
end)

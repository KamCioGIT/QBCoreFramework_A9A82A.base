Phone.API.RegisterServerEvent("messages:getNotifications", function(source)
  local phone = GetPlayerPhone(source)
  local messages = phone.getMessages()

  local notifications = 0
  for k, v in pairs(messages) do
    for k, v2 in pairs(v.chat) do
      if not v2.read then
        notifications = notifications + 1
      end
    end
  end

  return notifications
end)

Phone.API.RegisterServerEvent("messages:getChat", function(source, number)
  local phone = GetPlayerPhone(source)
  local messages = phone.getMessages(tostring(number))
  phone.markRead(tostring(number))
  return { chat = messages.chat, contact = phone.findContact(tostring(number)) }
end)

Phone.API.RegisterServerEvent("messages:getMessages", function(source)
  local phone = GetPlayerPhone(source)
  local messages = FormatedMessages(phone)
  return messages
end)

Phone.API.RegisterServerEvent("messages:closeMessage", function(source, number)
  local phone = GetPlayerPhone(source)
  phone.closeChat(number)
  TriggerClientEvent("phone:refreshMessages", source, '')
end)

Phone.API.RegisterServerEvent("messages:delMessage", function(source, msg)
  local phone = GetPlayerPhone(source)
  phone.removeMessage(msg.target, msg.id)
  TriggerClientEvent("phone:refreshMessages", source, msg.target)

  local targetPhone = GetPlayerPhone(GetPlayerFromPhone(msg.target))
  if not targetPhone then
    RemoveMessageOffline(msg.target, phone.getNumber(), msg.id)
    return
  end

  targetPhone.removeMessage(tostring(phone.getNumber()), msg.id)
  TriggerClientEvent("phone:refreshMessages", targetPhone.source, phone.number)
end)

Phone.API.RegisterServerEvent("messages:sendMessage", function(source, msg)
  local phone = GetPlayerPhone(source)

  phone.addMessage(tostring(msg.number), phone.getNumber(), msg.id, msg.msg, msg.gps, msg.images, true, os.time())
  TriggerClientEvent("phone:refreshMessages", source, msg.number)

  local isDispatch = false
  for k, v in pairs(Config.DefaultContacts) do
    if v.connectToDispatch then
      if v.number == msg.number then
        TriggerEvent('dispatch:add', source, msg.number, msg.msg, msg.gps)
        isDispatch = true
        break
      end
    end
  end

  if isDispatch then
    return
  end

  local targetPhone = GetPlayerPhone(GetPlayerFromPhone(msg.number))
  if not targetPhone then
    UpdateMessagesOffline(
      msg.number,
      phone.getNumber(),
      {
      from = phone.getNumber(),
      id = msg.id,
      msg = msg.msg,
      images = msg.images,
      read = false,
      timestamp = os.time()
    }
    )
    return
  end

  targetPhone.addMessage(tostring(phone.getNumber()), phone.getNumber(), msg.id, msg.msg, msg.gps, msg.images, false, os.time())
  TriggerClientEvent("phone:refreshMessages", targetPhone.source, phone.number)

  if #msg.msg < 1 and #msg.images > 0 then
    msg.msg = 'Image'
  end

  TriggerClientEvent("phone:notify", targetPhone.source, { app = "messages", title = targetPhone.findContact(phone.getNumber()).name, content = msg.msg, sound = "notify.mp3", data = { number = phone.getNumber() } })
end)

function FormatedMessages(phone)
  if not phone then return end

  local messages = phone.getMessages()

  local msgs = {}

  for k, v in pairs(messages) do
    if not v.hide then
      for k2, v2 in pairs(v.chat) do
        local msg = v.chat[#v.chat]
        if msg then
          table.insert(msgs, {
            id = msg.id,
            msg = msg.msg,
            contact = phone.findContact(k),
            number = k,
            hidden = v.hide,
            read = msg.read,
            date = msg.timestamp
          })
        end
        break
      end
    end
  end

  table.sort(msgs, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  local formated = {}
  for i = 1, 10 do
    table.insert(formated, msgs[i])
  end

  return formated
end

function UpdateMessagesOffline(number, from, msg)
  MySQL.Async.fetchAll("SELECT messages FROM phones WHERE phone_number=@number", {
    ["@number"] = number
  }, function(result)
    if not result[1] then
      return
    end

    local messages = json.decode(result[1].messages)

    if not messages[from] then
      messages[from] = {}
      messages[from].chat = {}
    end

    messages[from].chat[#messages[from].chat + 1] = msg

    MySQL.Async.execute("UPDATE phones SET messages=@messages WHERE phone_number=@number",
      {
        ["@number"] = number,
        ["@messages"] = json.encode(messages)
      }, function() end)
  end)
end

function RemoveMessageOffline(number, from, id)
  MySQL.Async.fetchAll("SELECT messages FROM phones WHERE phone_number=@number", {
    ["@number"] = number
  }, function(result)
    if not result[1] then
      return
    end

    local messages = json.decode(result[1].messages)

    if not messages[from] then
      messages[from] = {}
      messages[from].chat = {}
    end

    for k, v in pairs(messages[from].chat) do
      if v.id == id then
        table.remove(messages[from].chat, k)
      end
    end

    MySQL.Async.execute("UPDATE phones SET messages=@messages WHERE phone_number=@number",
      {
        ["@number"] = number,
        ["@messages"] = json.encode(messages)
      }, function() end)
  end)
end

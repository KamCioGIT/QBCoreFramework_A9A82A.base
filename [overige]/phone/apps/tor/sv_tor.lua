TorChats = {}

if Config.SaveTor then
  CreateThread(function()
    local oTor = GetResourceKvpString('tor') and json.decode(GetResourceKvpString('tor')) or {}
    TorChats = oTor
  end)
end

Phone.API.RegisterServerEvent("tor:getNotifications", function(source)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('tor')
  if not account then return 0 end

  local notifications = 0
  local chats = GetChats(source)
  for k, chat in pairs(chats) do
    for k2, user in pairs(chat.users) do
      if user.id == account.id then
        if user.notifications then
          notifications = notifications + user.notifications
        end
      end
    end
  end

  return notifications
end)

Phone.API.RegisterServerEvent('tor:getAccount', function(src, account)
  local phone = GetPlayerPhone(src)
  return phone.getAccount('tor')
end)

Phone.API.RegisterServerEvent('tor:logout', function(src)
  local phone = GetPlayerPhone(src)
  phone.removeAccount("tor")
end)

Phone.API.RegisterServerEvent('tor:login', function(src, data)
  local phone = GetPlayerPhone(src)

  local correct = promise.new()
  MySQL.Async.fetchAll("SELECT * FROM tor_accounts WHERE username=@username",
    {
      ["@username"] = data.username,
    }, function(result)
    if result[1] then
      if result[1].password == data.password then
        correct:resolve(result[1])
      else
        correct:resolve(false)
      end
    else
      correct:resolve(false)
    end
  end)

  local account = Citizen.Await(correct)

  if account then
    phone.setAccount('tor', account)
  end

  return account
end)

Phone.API.RegisterServerEvent('tor:createAccount', function(src, account)
  local phone = GetPlayerPhone(src)

  if IsUsernameBeingUsed(account.username) then
    return Locales.usernameTaken
  end

  if not canUserCreateAccount(phone.identifier, 'tor_accounts') then
    return Locales.maxAccountCap
  end

  local created = promise.new()
  MySQL.Async.insert('INSERT INTO tor_accounts (creator, username, password) VALUES (@creator, @username, @password)',
    {
      ["@creator"] = phone.identifier,
      ["@username"] = account.username,
      ["@password"] = account.password
    }, function(id)
    created:resolve(id)
  end)

  account.id = Citizen.Await(created)
  phone.setAccount('tor', account)
  return phone.getAccount('tor')
end)

Phone.API.RegisterServerEvent('tor:changeAvatar', function(src, avatar)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("tor")

  if not account then return end

  account.avatar = avatar
  phone.setAccount("tor", account)

  MySQL.Sync.execute("UPDATE tor_accounts SET avatar=@avatar WHERE username=@username", {
    ["@username"] = account.username,
    ["@avatar"] = avatar
  })

  for k, v in pairs(TorChats) do
    for k2, user in pairs(v.users) do
      local found = false

      if user.id == account.id then
        found = true
        user.avatar = account.avatar
      end

      if found then
        local player = GetPlayerFromPhone(user.number)
        if player then
          TriggerClientEvent('tor:refreshChat', player, GetChat(v.id))
        end
      end
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:changeUsername', function(src, username)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("tor")

  if not account then return end

  if IsUsernameBeingUsed(username) then
    return Locales.usernameTaken
  end

  MySQL.Sync.execute("UPDATE tor_accounts SET username=@nUsername WHERE username=@username", {
    ["@username"] = account.username,
    ["@nUsername"] = username
  })

  account.username = username
  phone.setAccount("tor", account)

  for k, v in pairs(TorChats) do
    for k2, user in pairs(v.users) do
      local found = false

      if user.id == account.id then
        found = true
        user.name = account.username
      end

      if found then
        local player = GetPlayerFromPhone(user.number)
        if player then
          TriggerClientEvent('tor:refreshChat', player, GetChat(v.id))
        end
      end
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent("tor:deleteAccount", function(src)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount("tor")

  if not account then return end

  local p = promise.new()
  MySQL.Async.execute("DELETE FROM tor_accounts WHERE username=@username",
    {
      ["@username"] = account.username,
      ["@password"] = account.password,
    }, function()
    p:resolve()
  end)

  Citizen.Await(p)

  phone.removeAccount('tor')

  for k, v in pairs(TorChats) do
    for k2, user in pairs(v.users) do
      local found = false

      if user.id == account.id then
        found = true
        table.remove(v.users, k2)
      end

      if found then
        local player = GetPlayerFromPhone(user.number)
        if player then
          TriggerClientEvent('tor:refreshChat', player, GetChat(v.id))
        end
      end
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent("tor:changePassword", function(src, newPass, oldPass)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')

  if not account then return end

  if account.password ~= oldPass then
    return Locales.passwordIncorrect
  end

  account.password = newPass
  phone.setAccount('tor', account)
  MySQL.Sync.execute("UPDATE tor_accounts SET password=@password WHERE username=@username", {
    ["@username"] = account.username,
    ["@password"] = newPass
  })
end)

Phone.API.RegisterServerEvent("tor:createChat", function(src, data)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local id = nil
  while not id do
    Wait(1)
    local tempId = uuid()
    local found = false
    for k, v in pairs(TorChats) do
      if v.id == tempId then
        found = true
      end
    end
    if not found then
      id = tempId
    end
  end

  TorChats[#TorChats + 1] = { id = id, owner = account.id, name = data.name, private = data.private, feed = {}, users = { { id = account.id, number = phone.getNumber(), name = account.username, avatar = account.avatar } } }
  TriggerClientEvent('tor:refreshChats', src)
  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:getPublicChats', function(src)
  return GetPublicChats(src)
end)

Phone.API.RegisterServerEvent('tor:getChats', function(src)
  return GetChats(src)
end)

Phone.API.RegisterServerEvent('tor:getChat', function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)
  local muted = false

  -- mark read
  for k, user in pairs(chat.users) do
    if user.id == account.id then
      user.notifications = 0
      muted = user.muted
    end
  end

  return { chat = chat, muted = muted }
end)

Phone.API.RegisterServerEvent('tor:deleteChat', function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)
  local users = chat.users

  for k, v in pairs(TorChats) do
    if v.id == id then
      if v.owner == account.id then
        table.remove(TorChats, k)
      end
    end
  end

  for k, v in pairs(users) do
    local player = GetPlayerFromPhone(v.number)
    if player then
      TriggerClientEvent('tor:refreshChats', player)
      TriggerClientEvent('tor:chatDeleted', player, id)
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:editChat', function(src, edit)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  for k, v in pairs(TorChats) do
    if v.id == edit.id then
      if v.owner == account.id then
        v.name = edit.name
        v.private = edit.private
        v.icon = edit.icon
        v.wallpaper = edit.wallpaper
      end
    end
  end

  local chat = GetChat(edit.id)
  for k, v in pairs(chat.users) do
    local player = GetPlayerFromPhone(v.number)
    if player then
      TriggerClientEvent('tor:refreshChats', player)
      TriggerClientEvent('tor:refreshChat', player, chat)
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:joinChat', function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)

  if not chat then
    return Locales.chatDoesNotExist
  end

  local alreadyJoined = false
  for k, v in pairs(chat.users) do
    if v.id == account.id then
      alreadyJoined = true
    end
  end

  if alreadyJoined then
    return
  end

  table.insert(chat.users, { id = account.id, number = phone.getNumber(), name = account.username, avatar = account.avatar })

  TriggerClientEvent('tor:refreshChats', src)
  for k, v in pairs(chat.users) do
    local player = GetPlayerFromPhone(v.number)
    if player then
      TriggerClientEvent('tor:refreshChat', player, chat)
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:leaveChat', function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)
  for k, v in pairs(chat.users) do
    if v.id == account.id then
      table.remove(chat.users, k)
    end
  end

  TriggerClientEvent('tor:refreshChats', src)
  for k, v in pairs(chat.users) do
    local player = GetPlayerFromPhone(v.number)
    if player then
      TriggerClientEvent('tor:refreshChat', player, chat)
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:markRead', function(src, id)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)
  for k, v in pairs(chat.users) do
    if v.id == account.id then
      v.notifications = 0
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:sendMessage', function(src, msg)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(msg.chat)

  msg.from = { id = account.id, name = account.username, avatar = account.avatar }
  msg.date = os.time()

  table.insert(chat.feed, msg)

  for k, v in pairs(chat.users) do
    local player = GetPlayerFromPhone(v.number)
    if player then
      if v.id ~= account.id and not v.muted then
        if not v.notifications then
          v.notifications = 0
        end
        v.notifications = v.notifications + 1
        TriggerClientEvent('phone:notify', player, { app = 'tor', title = account.username, content = msg.content })
      end

      TriggerClientEvent('tor:refreshChat', player, chat)
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

Phone.API.RegisterServerEvent('tor:muteChat', function(src, id, toggle)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return end

  local chat = GetChat(id)
  for k, v in pairs(chat.users) do
    if v.id == account.id then
      v.muted = not toggle
    end
  end

  SetResourceKvp('tor', json.encode(TorChats))
end)

function IsUsernameBeingUsed(username)
  local exists = promise.new()
  MySQL.Async.fetchScalar('SELECT COUNT(1) FROM tor_accounts WHERE username=@username', { ["@username"] = username }, function(result)
    if (result > 0) then
      exists:resolve(true)
      return
    end
    exists:resolve(false)
  end)
  return Citizen.Await(exists)
end

function GetPublicChats(src)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return {} end

  local chats = {}

  for k, v in pairs(TorChats) do
    if not v.private then
      local found = false

      for k, v in pairs(v.users) do
        if v.id == account.id then
          found = true
        end
      end

      if not found then
        table.insert(chats, v)
      end
    end
  end

  return chats
end

function GetChats(src)
  local phone = GetPlayerPhone(src)
  local account = phone.getAccount('tor')
  if not account then return {} end

  local chats = {}

  for k, v in pairs(TorChats) do
    for k2, user in pairs(v.users) do
      if user.id == account.id then
        table.insert(chats, v)
      end
    end
  end

  return chats
end

function GetChat(id)
  local chat
  for k, v in pairs(TorChats) do
    if v.id == id then
      chat = v
    end
  end
  return chat
end

function uuid()
  local res = ""
  local possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for i = 1, 8 do
    local pos = math.floor(math.random() * #possible)
    res = res .. possible:sub(pos, pos)
  end

  return res
end

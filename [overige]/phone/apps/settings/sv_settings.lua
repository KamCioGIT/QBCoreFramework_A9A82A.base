Phone.API.RegisterServerEvent("settings:getProfile", function(source)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('main')

  return { avatar = account.avatar, name = account.name, email = account.email, number = phone.getNumber() }
end)

Phone.API.RegisterServerEvent("settings:setAvatar", function(source, avatar)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('main')
  account.avatar = avatar
  phone.setAccount('main', account)

  MySQL.Sync.execute("UPDATE phone_accounts SET avatar=@avatar WHERE email=@email", {
    ["@email"] = account.email,
    ["@avatar"] = avatar
  })
end)

Phone.API.RegisterServerEvent("phone:changePassword", function(source, oldPass, newPass)
  local phone = GetPlayerPhone(source)
  local account = phone.getAccount('main')

  if not account then return end

  if account.password ~= oldPass then
    return 'Incorrect Password'
  end

  account.password = newPass
  phone.setAccount('main', account)
  MySQL.Sync.execute("UPDATE phone_accounts SET password=@password WHERE email=@email", {
    ["@email"] = account.email,
    ["@password"] = newPass
  })
end)

Phone.API.RegisterServerEvent('mail:getSent', function(src)
  local phone = GetPlayerPhone(src)
  local mail = phone.getMail()

  local mails = {}
  for k, v in pairs(mail) do
    if v.from == phone.getAccount('main').email then
      table.insert(mails, v)
    end
  end

  table.sort(mails, function(a, b) return tonumber(a.date) > tonumber(b.date) end)
  return mails
end)

Phone.API.RegisterServerEvent('mail:getReceived', function(src)
  local phone = GetPlayerPhone(src)
  local mail = phone.getMail()

  local mails = {}
  for k, v in pairs(mail) do
    if v.from ~= phone.getAccount('main').email then
      table.insert(mails, v)
    end
  end

  table.sort(mails, function(a, b) return tonumber(a.date) > tonumber(b.date) end)
  return mails
end)

Phone.API.RegisterServerEvent('mail:sendEmail', function(src, email)
  local phone = GetPlayerPhone(src)
  local target = nil

  email.from = phone.getAccount('main').email
  email.date = os.time()
  email.to = email.to .. '@' .. Locales.emailProvider

  -- find player with email
  for k, v in pairs(Phones) do
    if v.accounts['main'] then
      if email.to == v.accounts['main'].email then
        target = v
      end
    end
  end

  phone.addMail(email)

  -- refresh self
  TriggerClientEvent('mail:refreshSent', src)

  if not target then return end

  -- send email & notification
  target.addMail(email)
  TriggerClientEvent('phone:notify', target.source, { app = 'mail', title = email.from, content = email.content })

  -- refresh target
  TriggerClientEvent('mail:refresh', target.source)
end)

Phone.API.RegisterServerEvent('mail:removeEmail', function(src, emailId)
  local phone = GetPlayerPhone(src)
  phone.deleteEmail(emailId)
  TriggerClientEvent('mail:refreshSent', src)
  TriggerClientEvent('mail:refresh', src)
end)

AddEventHandler('phone:sendEmail', function(target, email)
  local phone = GetPlayerPhone(target)
  if not phone then return end

  email.date = os.time()
  email.to = phone.getAccount('main').email

  phone.addMail(email)

  TriggerClientEvent('phone:notify', target, { app = 'mail', title = email.from, content = email.content })
  TriggerClientEvent('mail:refresh', target)
end)

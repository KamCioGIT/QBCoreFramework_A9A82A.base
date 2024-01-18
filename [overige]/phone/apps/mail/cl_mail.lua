RegisterNUICallback('getMailRec', function(data, cb)
  local mail = Phone.API.TriggerServerEvent('mail:getReceived')
  cb(mail)
end)

RegisterNUICallback('getMailSent', function(data, cb)
  local mail = Phone.API.TriggerServerEvent('mail:getSent')
  cb(mail)
end)

RegisterNUICallback('sendEmail', function(data, cb)
  Phone.API.TriggerServerEvent('mail:sendEmail', data)
  cb('OK')
end)

RegisterNUICallback('removeEmail', function(data, cb)
  Phone.API.TriggerServerEvent('mail:removeEmail', data.id)
  cb('OK')
end)

RegisterNetEvent('mail:refresh', function()
  local mail = Phone.API.TriggerServerEvent('mail:getReceived')
  SendNUIMessage({
    type = 'mail:refresh',
    mail = mail
  })
end)

RegisterNetEvent('mail:refreshSent', function()
  local mail = Phone.API.TriggerServerEvent('mail:getSent')
  SendNUIMessage({
    type = 'mail:refreshSent',
    mail = mail
  })
end)

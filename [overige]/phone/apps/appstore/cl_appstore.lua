RegisterNUICallback('getApps', function(data, cb)
  local apps = {}
  local installedApps = Phone.API.TriggerServerEvent('phone:getInstalledApps')

  local data = nil
  if GetData then
    data = GetData()
  end

  for k, v in pairs(Config.Apps) do
    if not v.default then
      if not v.jobs then
        table.insert(apps, v)
      else
        for k2, v2 in pairs(v.jobs) do
          if data then
            if v2 == data.job.name then
              table.insert(apps, v)
            end
          end
        end
      end
    end
  end

  SetTimeout(250, function()
    cb({ apps = apps, installed = installedApps })
  end)
end)

AddEventHandler("phone:checkWhitelistedApps", function()
  local data = nil
  if GetData then
    data = GetData()
  end

  for k, v in pairs(Phone.Apps) do
    if v.jobs then
      local found = false
      for k2, v2 in pairs(v.jobs) do
        if data then
          if v2 == data.job.name then
            found = true
          end
        end
      end

      if not found then
        Phone.Apps[k].hidden = true
      else
        Phone.Apps[k].hidden = false
      end
    end
  end

  setAppData(Phone.Apps)
end)

RegisterNUICallback('installApp', function(data, cb)
  Phone.API.TriggerServerEvent('phone:installApp', data)

  if DoesPlayerHaveApp(data.app) then
    return
  end

  for k, v in pairs(Config.Apps) do
    if v.id == data.app then
      v.downloading = true
      table.insert(Phone.Apps, v)
    end
  end

  setAppData(Phone.Apps)

  SetTimeout(data.timeout, function()
    for k, v in pairs(Phone.Apps) do
      if v.id == data.app then
        v.downloading = false
      end
    end

    setAppData(Phone.Apps)
  end)

  cb('OK')
end)

RegisterNUICallback('uninstallApp', function(data, cb)
  if not DoesPlayerHaveApp(data.app) then
    return
  end

  Phone.API.TriggerServerEvent('phone:uninstallApp', data)

  for k, v in pairs(Phone.Apps) do
    if v.id == data.app then
      table.remove(Phone.Apps, k)
    end
  end

  setAppData(Phone.Apps)

  TriggerEvent('phone:uninstallApp', data.app)
  cb('OK')
end)

function DoesPlayerHaveApp(app)
  for k, v in pairs(Phone.Apps) do
    if v.id == app then
      return true
    end
  end
  return false
end

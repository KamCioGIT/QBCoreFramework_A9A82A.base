Phone.API.RegisterServerEvent('phone:getInstalledApps', function(src)
  local phone = GetPlayerPhone(src)
  return phone.getApps()
end)

Phone.API.RegisterServerEvent('phone:installApp', function(src, data)
  local phone = GetPlayerPhone(src)
  phone.addApp(data.app)
end)

Phone.API.RegisterServerEvent('phone:uninstallApp', function(src, data)
  local phone = GetPlayerPhone(src)
  phone.removeApp(data.app)
end)

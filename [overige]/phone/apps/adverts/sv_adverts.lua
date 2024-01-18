local Ads = {}

if Config.SaveAds then
  CreateThread(function()
    local oAds = GetResourceKvpString('ads') and json.decode(GetResourceKvpString('ads')) or {}
    Ads = oAds
  end)
end

Phone.API.RegisterServerEvent("ads:get", function()
  local phone = GetPlayerPhone(source)
  local num = phone.getNumber()

  for k, v in pairs(Ads) do
    if v.creator == num then
      v.canDelete = true
    end
  end

  table.sort(Ads, function(a, b) return tonumber(a.date) > tonumber(b.date) end)

  return Ads
end)

Phone.API.RegisterServerEvent("ads:add", function(source, ad)
  local phone = GetPlayerPhone(source)
  local number = ad.number
  local name = ad.name

  if name then
    local acc = phone.getAccount('main')
    name = acc.name
  end

  if number then
    number = phone.getNumber()
  end

  Ads[#Ads + 1] = { id = ad.id, creator = phone.getNumber(), message = ad.msg, title = ad.title, name = name, number = number, images = ad.images, date = os.time() }

  if Config.SaveAds then
    SetResourceKvp('ads', json.encode(Ads))
  end

  TriggerClientEvent("ads:refresh", -1)
end)

Phone.API.RegisterServerEvent("ads:delete", function(source, id)
  local phone = GetPlayerPhone(source)
  local num = phone.getNumber()

  for k, v in pairs(Ads) do
    if v.id == id then
      if v.creator == num then
        table.remove(Ads, k)
      end
    end
  end

  if Config.SaveAds then
    SetResourceKvp('ads', json.encode(Ads))
  end

  TriggerClientEvent("ads:refresh", -1)
end)

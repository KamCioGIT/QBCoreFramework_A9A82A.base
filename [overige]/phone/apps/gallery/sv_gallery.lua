Phone.API.RegisterServerEvent("gallery:get", function (source)
  local phone = GetPlayerPhone(source)
  local gallery = phone.getGallery()
  table.sort(gallery, function(a,b) return tonumber(a.date) > tonumber(b.date) end)
  return gallery
end)

Phone.API.RegisterServerEvent("gallery:add", function (source, img)
  local phone = GetPlayerPhone(source)
  phone.addImageToGallery(img.id, img.img, os.time())
end)

Phone.API.RegisterServerEvent("gallery:delete", function (source, img)
  local phone = GetPlayerPhone(source)
  phone.deleteImage(img.id)
end)
Phone.API.RegisterServerEvent('notes:get', function (src)
  local phone = GetPlayerPhone(src)
  return phone.getNotes()
end)

Phone.API.RegisterServerEvent('notes:create', function (src, note)
  local phone = GetPlayerPhone(src)
  phone.addNote(note.id, note.content)
end)

Phone.API.RegisterServerEvent('notes:update', function (src, note)
  local phone = GetPlayerPhone(src)
  phone.updateNote(note.id, note.content)
end)

Phone.API.RegisterServerEvent('notes:delete', function (src, note)
  local phone = GetPlayerPhone(src)
  phone.deleteNote(note.id)
end)
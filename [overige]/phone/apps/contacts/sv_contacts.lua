Phone.API.RegisterServerEvent("getContacts", function(source)
  local phone = GetPlayerPhone(source)
  local contacts = phone.getContacts()

  local formattedContacts = {}
  for k, v in pairs(Config.DefaultContacts) do
    v.default = true
    table.insert(formattedContacts, v)
  end

  for k, v in pairs(contacts) do
    table.insert(formattedContacts, v)
  end

  return formattedContacts
end)

Phone.API.RegisterServerEvent("addContact", function(source, contact)
  local phone = GetPlayerPhone(source)
  phone.addContact(contact.id, contact.name, contact.number, contact.profile)
end)

Phone.API.RegisterServerEvent("removeContact", function(source, contactId)
  local phone = GetPlayerPhone(source)
  phone.removeContact(contactId)
end)

Phone.API.RegisterServerEvent("editContact", function(source, contact)
  local phone = GetPlayerPhone(source)
  phone.editContact(contact.id, contact.name, contact.number, contact.profile)
end)

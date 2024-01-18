Editable = {}
Editable.Carhud = {}
Editable.Carhud.Fuel = function(vehicle)
    return GetVehicleFuelLevel(vehicle) -- change your function for fuel system here
end

Editable.Carhud.Seatbelt = function(vehicle)
    --if you use custom seatbelt system parse your export/function/event/code here
end

Editable.Carhud.StreetLabel = function(coords)
    local StreetHash1, StreetHash2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local Street1 = GetStreetNameFromHashKey(StreetHash1)
    local Street2 = GetStreetNameFromHashKey(StreetHash2)
    SendNUIMessage({
        type = 'STREETLABEL_UPDATE',
        street = Street1..(Street2 ~= '' and ' '..' | '..' '..Street2 or '')
    })
end

RegisterNetEvent('ZSX_UI:onVehicleCrash')
AddEventHandler('ZSX_UI:onVehicleCrash', function()
    --do some code on vehicle crash
end)

RegisterNUICallback('seatbeltNotify', function(data, cb)
    if data.state then
        --NOTIFY: HAVE SEATBELT
    else
        --NOTIFY: DOESN'T HAVE SEATBELT
    end
end)

RegisterNUICallback('UpdateState', function(cb)
    print('UPDATED STATE', cb.element, cb.state)
end)

Citizen.CreateThread(function()
    if Config.HideRadar then
        DisplayRadar(false)
    end
end)
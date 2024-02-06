local blips = {}
local function CreateBlip(coords, name)
    mechanicBlip = AddBlipForCoord(coords)
    SetBlipSprite(mechanicBlip, Config.BlipOptions.sprite)
    SetBlipDisplay(mechanicBlip, 4)
    SetBlipScale(mechanicBlip, Config.BlipOptions.scale)
    SetBlipColour(mechanicBlip, Config.BlipOptions.color)
    SetBlipAsShortRange(mechanicBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(mechanicBlip)
    blips[#blips+1] = mechanicBlip
end

function SetBlips(data)
    for k, v in pairs(Config.Mechanics) do
        if tonumber(data.m_id) == k then
            CreateBlip(v.bossMenu, json.decode(data.mechanic).name)
        end
    end
end

function RemoveBlips()
    for k, v in pairs(blips) do
        RemoveBlip(v)
    end
end
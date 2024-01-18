Config = {}

Config.FirePoles = {
    {
        pos = {x = 1229.0, y = -1493.98, z = 33.98, h = 223.5, r = 0.15}, -- BOTTOM OF THE POLE
        height = 8,
    }
}

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local isOnPole = false
function IsNearFirePole()
    local pos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Config.FirePoles) do
        local dist = #(pos - vector3(v.pos.x, v.pos.y, v.pos.z + v.height))
        if dist < 2 then
            return true, v
        end
    end

    return false, {}
end

function RappelDownFirePole(pole)
    RequestAnimDict("missrappel")
    while not HasAnimDictLoaded("missrappel") do Citizen.Wait(4) end
    RequestAnimDict("mp_amb_cop")
    while not HasAnimDictLoaded("mp_amb_cop") do Citizen.Wait(4) end
    
    local ped = PlayerPedId()
    local pos = GetEntityCoords(PlayerPedId())
    local z = pole.pos.z + pole.height
    
    SetEntityCollision(PlayerPedId(), false)
    FreezeEntityPosition(PlayerPedId(), false)
    
    SetEntityCoords(PlayerPedId(), pole.pos.x, pole.pos.y, pole.pos.z + pole.height)
    
    TaskPlayAnim(PlayerPedId(), "missrappel", "rope_slide", 2.0, 2.0, -1, 1, 0, false, false, false)

    local Interior = GetInteriorAtCoords(1175.986, -1543.518, 33.80263)
    LoadInterior(Interior)

    local ViewMode = GetFollowPedCamViewMode()

    Citizen.CreateThread(function()
        while true do

            SetFollowPedCamViewMode(4)
            
            z = GetEntityCoords(PlayerPedId()).z

            if z - 2.0 <= pole.pos.z then
                
                FreezeEntityPosition(PlayerPedId(), true)
                
                TaskPlayAnim(PlayerPedId(), "mp_amb_cop", "land_ps", 2.0, 2.0, 500, 1, 0, false, false, false)
                Citizen.Wait(300)
                StopAnimTask(PlayerPedId(), "mp_amb_cop", "land_ps", 1.0)
                
                SetEntityCollision(PlayerPedId(), true)
                FreezeEntityPosition(PlayerPedId(), false)
                
                isOnPole = false

                return
            else
                SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 5.0)
            end
            

            Citizen.Wait(10)
        end
        
        SetFollowPedCamViewMode(ViewMode)
        DisableInterior(Interior, true)
    end)
end

Citizen.CreateThread(function()
    while true do
        
        local near, pole = IsNearFirePole()

        if near then
            DrawText3D(pole.pos.x, pole.pos.y, ((pole.pos.z + pole.height)), '~g~E~s~ - Use Pole')

            if not isOnPole and IsControlJustPressed(0, 38) then
                isOnPole = true
    
                RappelDownFirePole(pole)
            end
        else
            Citizen.Wait(100)
        end


        Citizen.Wait(1)
    end
end)
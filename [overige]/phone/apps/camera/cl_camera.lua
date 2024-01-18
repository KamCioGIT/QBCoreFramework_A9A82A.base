local currentCamMode = false
cameraFocus = false

RegisterNUICallback('openCamera', function(data, cb)
  if #Config.ImgBBProviderKey < 1 then
    print('[^4Phone^7] Message to server developers, make sure to add a ImgBB key into your config, in order to use the camera.')
    ClosePhone(true)
    return
  end

  CreateMobilePhone(1)
  CellCamActivate(true, true)
  DisplayHud(false)
  DisplayRadar(false)
  Wait(350)
  cb("OK")
end)

RegisterNUICallback('switchCam', function(data, cb)
  if IsPedInAnyVehicle(PlayerPedId()) then
    cb('OK')
    return
  end

  currentCamMode = not currentCamMode
  CellFrontCamActivate(currentCamMode)
  Wait(350)
  cb("OK")
end)

RegisterNUICallback('closeCamera', function(data, cb)
  if not Config.WalkWhenOpen then
    SetNuiFocusKeepInput(false)
  end

  cameraFocus = false
  DestroyMobilePhone()
  CellCamActivate(false, false)
  DisplayHud(true)
  DisplayRadar(true)

  if onCall or calling then
    if IsPedInAnyVehicle(PlayerPedId(), true) then
      LoadAnimDict('cellphone@', function()
        TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
      end)
    else
      LoadAnimDict('cellphone@', function()
        TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
      end)
    end

    cb('OK')

    return
  end

  if Phone.Open then
    if IsPedInAnyVehicle(PlayerPedId(), true) then
      LoadAnimDict('anim@cellphone@in_car@ps', function()
        TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_in', -1, -1, -1, 50, 0, false, false, false)
      end)
    else
      LoadAnimDict('cellphone@', function()
        TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_in', -1, -1, -1, 50, 0, false, false, false)
      end)
    end
  end

  cb("OK")
end)

RegisterNUICallback("freeMove", function(data, cb)
  if not Config.WalkWhenOpen then
    SetNuiFocusKeepInput(data.toggle)
  end
  cameraFocus = data.toggle
  cb("OK")
end)

function CellFrontCamActivate(activate)
  local ret = Citizen.InvokeNative(0x2491A93618B7D838, activate)
  return ret
end

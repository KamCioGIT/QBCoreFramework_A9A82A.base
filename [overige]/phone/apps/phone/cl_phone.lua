onCall = nil
calling = false
gettingCalled = 0

local function RefreshNotifications()
  local notifications = Phone.API.TriggerServerEvent("phone:getNotifications")
  SetNotifications("phone", notifications)
end

AddEventHandler("phone:open", function()
  RefreshNotifications()
end)

RegisterNUICallback("getCallHistory", function(data, cb)
  local callHistory = Phone.API.TriggerServerEvent("phone:getCallHistory")
  RefreshNotifications()
  cb(callHistory)
end)

RegisterNUICallback("deleteCallLog", function(data, cb)
  Phone.API.TriggerServerEvent("phone:deleteCallLog", data.id)
  cb("OK")
end)

RegisterNUICallback("getMissedCalls", function(data, cb)
  local notifications = Phone.API.TriggerServerEvent("phone:getNotifications")
  cb(notifications)
end)

RegisterNUICallback("call", function(data, cb)
  if onCall then return end
  if calling then return end

  if GetLengthOfLiteralString(data.number) < 1 then
    return
  end

  if Phone.Data.number == data.number then
    return
  end

  calling = true
  Phone.API.TriggerServerEvent("phone:call", data.number)

  if IsPedInAnyVehicle(PlayerPedId(), true) then
    StopAnimTask(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_in', 3.0)
    LoadAnimDict('cellphone@', function()
      TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
    end)
  else
    StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_text_in', 3.0)
    LoadAnimDict('cellphone@', function()
      TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
    end)
  end

  cb("OK")
end)

RegisterNUICallback("answerCall", function(data, cb)
  if onCall then
    Phone.API.TriggerServerEvent("phone:endCall", onCall)
  end

  Phone.API.TriggerServerEvent("phone:answerCall", data.callid)
  cb("OK")
end)

RegisterNUICallback("endCall", function(data, cb)
  Phone.API.TriggerServerEvent("phone:endCall", data.callid, toboolean(data.missed))
  RefreshNotifications()
  cb("OK")
end)

RegisterNetEvent("phone:answerCall", function(callid)
  gettingCalled = gettingCalled - 1

  if calling then
    calling = false
  end

  if not Phone.Model then
    AddPhone()
  end

  if not onCall then
    if IsPedInAnyVehicle(PlayerPedId(), true) then
      StopAnimTask(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_in', 3.0)
      LoadAnimDict('cellphone@', function()
        TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
      end)
    else
      StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_text_in', 3.0)
      LoadAnimDict('cellphone@', function()
        TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
      end)
    end
  end

  onCall = callid

  -- handle VOIP
  if not Config.VOIP:match('salt') then
    exports[Config.VOIP]:addPlayerToCall(callid)
  end

  SendNUIMessage({
    type = "answerCall:" .. callid,
  })
end)

RegisterNetEvent("phone:endCall", function(callid)
  cancel = false
  gettingCalled = gettingCalled - 1

  if calling then
    calling = false
    cancel = true
  end

  if onCall == callid then
    onCall = nil
    cancel = true
  end

  -- handle VOIP
  if not Config.VOIP:match('salt') then
    exports[Config.VOIP]:removePlayerFromCall()
  end

  if cancel then
    if Phone.Open then
      if IsPedInAnyVehicle(PlayerPedId(), true) then
        LoadAnimDict('anim@cellphone@in_car@ps', function()
          TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_call_to_text', 3.0, 3.0, -1, 50, 1.0, false, false, false)
        end)
      else
        LoadAnimDict('cellphone@', function()
          TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_to_text', 3.0, 3.0, -1, 50, 1.0, false, false, false)
        end)
      end
    else
      if IsPedInAnyVehicle(PlayerPedId(), true) then
        StopAnimTask(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0)
      else
        StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0)
      end
      PhoneAnimation(false)
    end
  end

  SendNUIMessage({
    type = "endCall:" .. callid,
  })
end)

RegisterNetEvent("phone:call", function(notify)
  gettingCalled = gettingCalled + 1
  Notify(notify)
end)

RegisterCommand('answerCall', function()
  if gettingCalled < 2 then
    SendNUIMessage({
      type = "answerCallBtn",
    })
  end
end)

RegisterCommand('declineCall', function()
  if gettingCalled < 2 then
    SendNUIMessage({
      type = "declineCallBtn",
    })
  end
end)

RegisterKeyMapping('answerCall', 'Answer Call', 'keyboard', Config.AnswerCallKey)
RegisterKeyMapping('declineCall', 'Decline Call', 'keyboard', Config.StopCallKey)

-- fix walking when call is started from vehicle
CreateThread(function()
  while true do
    Wait(1)
    if calling or onCall then
      if GetIsTaskActive(PlayerPedId(), 160) then
        StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0)
        LoadAnimDict('cellphone@', function()
          TaskPlayAnim(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
        end)
      elseif GetIsTaskActive(PlayerPedId(), 2) then
        StopAnimTask(PlayerPedId(), 'anim@cellphone@in_car@ps', 'cellphone_text_to_call', 3.0)
        LoadAnimDict('cellphone@', function()
          TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 3.0, 1.0, -1, 50, 0, false, false, false)
        end)
      end
    end
  end
end)

if not Config.OpenPhoneWhilstDead then
  AddEventHandler('phone:playerDied', function()
    SendNUIMessage({
      type = "declineCallBtn",
    })
  end)
end

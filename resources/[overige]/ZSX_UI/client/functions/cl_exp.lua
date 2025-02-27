exports('AddNotify', ZSX.Functions.NUI.AddNotify)
exports('ProgressBar', ZSX.Functions.NUI.ProgressBar.Init)
exports('GetUIState', ZSX.Functions.NUI.Getters.State)
exports('GetPlayerSettings', ZSX.Functions.NUI.Getters.GetSettings)
exports('HideUIComponent', ZSX.Functions.NUI.Helpers.HideUIComponent)
exports('HideUI', ZSX.Functions.NUI.Helpers.HideUIForced)
exports('ForceCloseMenu', ZSX.Functions.NUI.Helpers.ForceCloseMenu)
exports('SetUIState', ZSX.Functions.NUI.Setters.UpdateState)
exports('Initialize', ZSX.Functions.StartUI)
exports('CancelProgressBar', ZSX.Functions.NUI.ProgressBar.Cancel)
exports('InitializeMulticharacter', ZSX.Functions.StartUIMulticharacter)

RegisterNetEvent('ZSX_UI:addNotify')
RegisterNetEvent('ZSX_UI:ProgressBar')
RegisterNetEvent('ZSX_UI:HideUIComponent')
RegisterNetEvent('ZSX_UI:HideUI')
RegisterNetEvent('ZSX_UI:ForceCloseMenu')
RegisterNetEvent('ZSX_UI:GetPlayerSettings')
RegisterNetEvent('ZSX_UI:SetUIState')
RegisterNetEvent('ZSX_UI:Initialize')
RegisterNetEvent('ZSX_UI:CancelProgressBar')

AddEventHandler('ZSX_UI:addNotify', function(icon, header, text, time) ZSX.Functions.NUI.AddNotify(icon, header, text, time) end)
AddEventHandler('ZSX_UI:ProgressBar', function(text, time, data) ZSX.Functions.NUI.ProgressBar.Init(text, time, data) end)
AddEventHandler('ZSX_UI:HideUIComponent', function(component, state) ZSX.Functions.NUI.Helpers.HideUIComponent(component, state) end)
AddEventHandler('ZSX_UI:HideUI', function(state) ZSX.Functions.NUI.Helpers.HideUIForced(state) end)
AddEventHandler('ZSX_UI:ForceCloseMenu', function() ZSX.Functions.NUI.Helpers.ForceCloseMenu() end)
AddEventHandler('ZSX_UI:GetPlayerSettings', function(cb) cb(ZSX.Functions.NUI.Getters.GetSettings()) end)
AddEventHandler('ZSX_UI:SetUIState', function(element, state) ZSX.Functions.NUI.Setters.UpdateState(element, state) end)
AddEventHandler('ZSX_UI:Initialize', function() ZSX.Functions.StartUI() end)
AddEventHandler('ZSX_UI:CancelProgressBar', function() ZSX.Functions.NUI.ProgressBar.Cancel() end)
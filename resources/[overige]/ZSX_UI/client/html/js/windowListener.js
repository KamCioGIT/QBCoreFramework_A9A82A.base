window.addEventListener("message", async e=> {
    var NUI = e.data
    if (NUI.type == 'UPDATE_HUD_VALUES') {
        ZSX.Functions.Game.Hud.Update(NUI.data)
    } else if (NUI.type == 'CARHUD_INIT') {
        ZSX.Functions.Game.CarHud.Init(NUI.state)
    } else if (NUI.type == 'UPDATE_DISPLAYERS_VALUES') {
        ZSX.Functions.Game.Displayers.Update(NUI.data)
    } else if (NUI.type == 'SEATBELT_INIT') {
        ZSX.Functions.Game.CarHud.Seatbelt(NUI.state)
    } else if (NUI.type == 'UPDATE_CARHUD_VALUES') {
        ZSX.Functions.Game.CarHud.Update(NUI.data)
    } else if (NUI.type == 'MENU_OPENER') {
        ZSX.Functions.Game.Menu.Init(true)
    } else if (NUI.type == 'ADD_NOTIFY') {
        ZSX.Functions.Game.Notify.Add(NUI.data)
    } else if (NUI.type == 'INIT_PROGRESSBAR') {
        ZSX.Functions.Game.Progress.Init(NUI.data)
    } else if (NUI.type == 'CFG_TO_JS') {
        ZSX.Functions.Boot.Set(NUI.data)
    } else if (NUI.type == 'COMPONENT_VISIBILITY') {
        if (NUI.state) {ZSX.Functions.Game.CloseComponent(NUI.data)} 
        else if (!NUI.state) {ZSX.Functions.Game.OpenComponent(NUI.data)}
    } else if (NUI.type == 'COMPONENT_VISIBILITY_WHOLE') {
        if (NUI.state) {ZSX.Functions.Game.HideUI()} 
        else if (!NUI.state) {ZSX.Functions.Game.ShowUI()}
    } else if (NUI.type == 'COMPONENT_VISIBILITY_WHOLE_FORCED') {
        ZSX.Functions.Game.HideUI_Dev(NUI.state)
    } else if (NUI.type == 'FORCE_CLOSE_MENU') {
        ZSX.Functions.Game.Menu.Init(false)
    } else if (NUI.type == 'RECEIVE_COLOR') {
        $.post(`https://${GetParentResourceName()}/UpdatePlayerColor`, JSON.stringify({color: $(":root").css("--motive")}))
    } else if (NUI.type == 'LOAD_CONTENT_GAME') {
        ZSX.Functions.Game.OpenAfterConfig(false)
        await sleep(3000)
        ZSX.Variables.Active.Game = true 
    } else if (NUI.type == 'STREETLABEL_UPDATE') {
        ZSX.Functions.Game.CarHud.StreetLabel(NUI.street)
    } else if (NUI.type == 'START_UI') {
        if (!ZSX.Variables.CfgToJs.ConfigurationMenu) {
            ZSX.Functions.Game.OpenAfterConfig(false)
            await sleep(3000)
            ZSX.Variables.Active.Game = true 
            $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Game", state: true}))
            $(".logo-screen").fadeOut(1000)
        } else if (ZSX.Variables.CfgToJs.ConfigurationMenu) {
            if (ZSX.Functions.Boot.Storage()) {
                ZSX.Functions.Game.OpenAfterConfig(false)
                await sleep(3000)
                ZSX.Variables.Active.Game = true 
                $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Game", state: true}))
                $(".logo-screen").fadeOut(1000)
            } else if (!ZSX.Functions.Boot.Storage()) {
                ZSX.Functions.Welcome.Initialize()
            }
        }
    }
})
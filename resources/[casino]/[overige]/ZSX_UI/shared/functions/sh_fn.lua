ZSX = {}

ZSX.Shared = {}

ZSX.Shared.Vehicle = {
    currentSpeed = 0,
    previousSpeed = 0,
    prevVelocity = 0,
    velocity = 0,
    acceleration = 0,
    prevHealth = 0,
    health = 0,
    seatbelt = false
}

ZSX.Shared.Player = {
    Status = {
        health  = 0,
        armour  = 0,
        hunger  = 0,
        thirst  = 0,
        stress  = 0,
        oxygen  = 0,
        stamina = 0,
    },
    Displayers = {
        job = "Unemployed",
        cash = 0,
        bank = 0,
        online = 0,
        maxOnline = 0,
        identifier = 0,
    },
    coords = 0,
}

ZSX.Shared.PlayerSettings = {
    Hud = {
        type = "basic",
        alignment = "row",
    },
    Notify = {
        type = "basic",
        alignment = "left",
        easing = 'cubicBezier'
    },
    Displayers = {
        type = "basic",
    },
    Progress = {
        type = "basic",
    },
    Color = '#ee1c3e',
}

ZSX.Shared.UIStatus = {
    Welcome = true,
    Configuration = false,
    Preview = false,
    Game = false,
    GameMenu = false,
    UIState = false,
    UI_Forced_State = false,
    CarHudState = false,
    ForcedHide = false,
}

ZSX.Shared.Exports = {
    Fuel = nil,
}
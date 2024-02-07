outputLoading = false
playButtonPressSounds = true
printDebugInformation = false

vehicleSyncDistance = 150
environmentLightBrightness = 0.006
lightDelay = 10 -- Time in MS
flashDelay = 15

panelEnabled = true
panelType = "original"
panelOffsetX = 0.0
panelOffsetY = -0.1

allowedPanelTypes = {
    "original",
    "old"
}

-- https://docs.fivem.net/game-references/controls

shared = {
    horn = 86,
}

keyboard = {
    modifyKey = 132,
    stageChange = 208, -- pg up
    guiKey = 199, -- P
    takedown = 317, --PG down
    siren = {
        tone_one = 157, -- 1
        tone_two = 158, -- 2
        tone_three = 160, -- 3
    },
    pattern = {
        primary = 118, -- 9
        secondary = 111, -- 8
        advisor = 117, -- 7
    },
    warning = 108, -- Y
    secondary = 110, -- U
    primary = 107, -- Page Up 
}

controller = {
    modifyKey = 73,
    stageChange = 80,
    takedown = 243, --/
    siren = {
        tone_one = 173,
        tone_two = 85,
        tone_three = 172,
    },
}
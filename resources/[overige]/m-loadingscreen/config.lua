Config = {}
-- For more info check https://codem.gitbook.io/codem-documentation/

Config.Theme = 'mango' --  sky, blvck, cherry, kush, mango, proxima
Config.Logo = 'https://cdn.discordapp.com/attachments/765954269282959450/1060642680712998922/logotransparan.png' -- Default or URL link
Config.BackgroundImage = 'background.png' -- default or custom image/video
-- Backgrounds can be found in html/assets/background/
-- Config.BackgroundImage = 'background.png'



-- To display on left menu (must be an image)
-- Supports max 2 images
Config.AlbumsThumbnail = {
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    },
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    }
}

Config.Albums = {
    {
        source = 'https://i.imgur.com/5v9y4AD.png', -- Must be a link
    },
    {
        source = 'EjaorVlUcn0'  -- Must be a link
    }
}


Config.EnableHintMessages = true
Config.HintMessages = {
    {
        text= 'Tekst 1 TEST',
        time= 8000,
    },
    {
        text= 'Tekst 2 TEST',
        time= 3000,
    },
    {

        text= 'Tekst 3 TEST',
        time= 1000,
    }
}

Config.PlayMusicByDefault = false -- if true plays the music when loading screen is active

Config.ButtonLinks = {
    -- ["twitter"] = 'https://twitter.com',
    ["instagram"] = 'https://www.instagram.com/',
    -- ["reddit"] = 'https://www.reddit.com/',
    ["discord"] = 'https://discord.gg/bECZdaADpY',
}

Config.ServerName = 'SasVegas'

Config.Language = {
    ["WELCOME"] =               'Welkom in',
    ["INSIDE_CITY"] =           'Shots van de server',
    ["FOOTAGES"] =              'Nieuwste afbeeldingen van server',
    ["PATCH_NOTES"] =           'Patch Notes',
    ["PATCH_NOTES_VERSION"] =   'Updates V1.0',
    ["LATEST_UPDATES"] =        'Laatste updates...',
    ["FOLLOW_CITY"] =           'Volg ons op sociale media.',


    ["CITY_LOADING"] =          'Een moment geduld, de server wordt geladen...',
    ["SETTINGS"] =              'Instellingen',
    ["ENABLE_MUSIC"] =          'Zet muziek aan/uit',
    ["SHOW_MENU"] =             'Linkermenu weergeven',
    ["SHOW_HINT"] =             'Toon hint',
    ["SHOW_ALL"] =              'Toon volledige interface',



    ["KEYBINDS_INFO"] =         'Klik op een knop om de functie ervan te zien',
    ["KEYBINDS_INFO_2"] =       'Sommige sneltoetsen kunnen worden gewijzigd in de spelinstellingen',
    ["GO_TO"] =                 'veranderen',
    ["FIVEM_SETTINGS"] =        'ESC>Instellingen>Toetsenbindingen>FiveM',
    ["PRESS"] =                 'Klik',
    ["DOUBLE_PRESS"] =          'Dubbelklik',
    ["COMBINATIONS"] =          'Combinaties',
    ["KEYBINDS_INFO_3"] =       'Klik op een toets om de toewijzing ervan te zien.',
    ["KEYBINDS_INFO_4"] =       'Merk op dat deze sneltoetsen snelkoppelingen naar opdrachten zijn. Er zijn veel commando\'s die nog geen opdrachten hebben in het spel.',

    ["COMMANDS"] =              'Opdrachten',
    ["SHOW_ALL"] =              'Toon alle commando\'s',
    ["SELECT_COMMAND"] =        'Selecteer een opdracht',
    ["DISPLAY_BINDING"] =       'toon opdracht',
    ["COMMANDS_INFO"] =         'Klik op een commando om de functie ervan te zien',
    ["HINT"] =                  'Hint',

}

Config.PatchNotes = {
     "Nieuw Politiebureau",
     "Custom auto\'s",
     "Nieuwe MLO",
     "Battlepass",
}

Config.Keybinds = {
    ["ESC"] = false,
    ["F1"] = {
        ["pressInfo"] = 'Telefonu açar',
        ["doublePressInfo"] = false,
    },
    ["F2"] = {
        ["pressInfo"] = 'Envanteri açar',
    },
    ["F3"] = false,
    ["F4"] = false,
    ["F5"] = false,
    ["F6"] = {
        ["pressInfo"] = 'Meslek menülerini açar',
    },
    ["F7"] = {
        ["pressInfo"] = 'Animasyon menülerini açar',
    },
    ["F8"] = false,
    ["F9"] = {
        ["pressInfo"] = 'Telsiz menüsünü açar',
    },
    ["F10"] = false,
    ["F11"] = {
        ["pressInfo"] = 'Konuşma ayarını değiştirir.',
    },
    ["F12"] = false,
    ["“"] = {
        ["pressInfo"] = 'Polis dispatch menüsünü açar',
    },
    ["1"] = {
        ["pressInfo"] = 'Envanter Kısayolu',
    },
    ["2"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["3"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["4"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["5"] = {
        ["pressInfo"] = 'Envanter Kısayolu',

    },
    ["6"] = {
        ["pressInfo"] = 'Envanter Kısayolu',
    },
    ["7"] = false,
    ["8"] = false,
    ["9"] = false,
    ["0"] = false,
    ["-"] = false,
    ["+"] = false,
    ["BACKSPACE"] = false,
    ["TAB"] = {
        ["pressInfo"] = 'Envanter kısayollarını gösterir',
    },
    ["Q"] = false,
    ["W"] = false,
    ["E"] = false,
    ["R"] = false,
    ["T"] = {
        ["pressInfo"] = 'Chati açar',
    },
    ["Y"] = false,
    ["U"] = {
        ["pressInfo"] = 'Aracı kilitler',
    },
    ["I"] = false,
    ["O"] = false,
    ["P"] = false,
    ["["] = false,
    ["]"] = false,
    ["ENTER"] = {
        ["pressInfo"] = 'Chati açar',
    },
    ["CAPS"] = false,
    ["A"] = false,
    ["S"] = false,
    ["D"] = false,
    ["F"] = false,
    ["G"] = {
        ["pressInfo"] = 'Ellerini kaldıran şahsın üstünü arar.',
    },
    ["H"] = false,
    ["J"] = false,
    ["K"] = false,
    ["L"] = false,
    [";"] =  false,
    ["@"] =  false,
    ["LSHIFT"] =  {
        ["pressInfo"] = 'Run',
        ["doublePressInfo"] = false,
        ["combinations"] = {
            {
                ["key"] = 'E',
                ["info"] = 'Çelme takar',
            },
            {
                ["key"] = 'E',
                ["info"] = 'Aracı iter',
            },
            
        },
    },
    ["Z"] =  false,
    ["X"] =  false,
    ["C"] =  false,
    ["V"] =  false,
    ["B"] =  false,
    ["N"] =  false,
    ["M"] =  false,
    ["<"] =  false,
    [">"] =  false,
    ["?"] =  false,
    ["RSHIFT"] =  false,
    ["LCTRL"] =  false,
    ["ALT"] =  false,
    ["SPACE"] = false,
    ["ALTGR"] = false,
    ["RCTRL"] = false,
}
-- add only 2 commands here
Config.PreviewCommands = {
    ["hud"]= 'HUD ayarlarını açar',
    ["gfix"]= 'Galeride takılı kaldığınızda galeriden çıkmanızı sağlar',
}

Config.Commands = {
    ["hud"]= 'HUD ayarlarını açar',
    ["gfix"]= 'Galeride takılı kaldığınızda galeriden çıkmanızı sağlar',
    ["e"]= 'İstediğiniz animasyonu yapmanızı sağlar',
    ["mdt"]= 'MDTyi açar',
}




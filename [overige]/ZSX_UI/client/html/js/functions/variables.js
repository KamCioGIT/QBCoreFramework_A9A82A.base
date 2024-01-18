ZSX.Variables = {}

ZSX.Variables.CfgToJs = {}
ZSX.Variables.CfgToJs.ManualOverride = false
ZSX.Variables.CfgToJs.Creator = {}
ZSX.Variables.CfgToJs.Optionals = {}
ZSX.Variables.CfgToJs.Optionals['Displayers'] = {Job: false, Cash: false,}

ZSX.Variables.Active = {}

ZSX.Variables.Active.Welcome                = false
ZSX.Variables.Active.Preview                = false
ZSX.Variables.Active.PreviewMenu            = false
ZSX.Variables.Active.PreviewMenuAnimation   = false
ZSX.Variables.Active.PreviewRequest         = false
ZSX.Variables.Active.Game                   = false
ZSX.Variables.Active.GameMenu               = false
ZSX.Variables.Active.GameMenuAnim           = false
ZSX.Variables.Active.GameMenuAddon          = false
ZSX.Variables.Active.GameMenuAddonAnim      = false
ZSX.Variables.Active.UIContentLoaded        = false

ZSX.Variables.Active.Progress = false

ZSX.Variables.Active.Configurator = {}

ZSX.Variables.Active.Configurator.Active            = false
ZSX.Variables.Active.Configurator.PresetsContainer  = false

ZSX.Variables.Active.UI = {}

ZSX.Variables.Active.UI.Hud             = false
ZSX.Variables.Active.UI.Notifications   = false
ZSX.Variables.Active.UI.Configurator    = false

ZSX.Variables.Active.GameMenuNavbar         = "hud" 
ZSX.Variables.Active.GameMenuNavbarAnim     = false
ZSX.Variables.Active.GameMenuAddonOption    = null

ZSX.Variables.Preview = {}

ZSX.Variables.Preview.Component = {}

ZSX.Variables.Preview.Component.Used = null

ZSX.Variables.Preview.Component.Scale = {
    "Hud": 1,
    "Notify": 1,
    "Progress": 1,
    "Displayers": 1,
    'CarHud': 1,
}

ZSX.Variables.SFX = {}

ZSX.Variables.SFX.TransitionWelcome = new Howl({
    src: ["./metadata/sfx/sfx1.wav"],
    volume: 0.1,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.TransitionWoosh = new Howl({
    src: ["./metadata/sfx/sfx2.wav"],
    volume: 0.1,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.Enter = new Howl({
    src: ["./metadata/sfx/sfx3.wav"],
    volume: 0.5,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.TransitionSheesh = new Howl({
    src: ["./metadata/sfx/sfx4.wav"],
    volume: 0.2,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.ClickPreset = new Howl({
    src: ["./metadata/sfx/sfx5.mp3"],
    volume: 0.35,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.Preset = new Howl({
    src: ["./metadata/sfx/sfx6.mp3"],
    volume: 0.2,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.TranstitionSelector = new Howl({
    src: ["./metadata/sfx/sfx7.mp3"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.TranstitionSelectorError = new Howl({
    src: ["./metadata/sfx/sfx8.mp3"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.NotifyEnter = new Howl({
    src: ["./metadata/sfx/notifyEnter.mp3"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.ProgressEnter = new Howl({
    src: ["./metadata/sfx/progressEnter.mp3"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.BeltOn = new Howl({
    src: ["./metadata/sfx/belton.ogg"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.SFX.BeltOff = new Howl({
    src: ["./metadata/sfx/beltoff.ogg"],
    volume: 0.4,
    loop: false,
    html5: false
})

ZSX.Variables.Music             = {}
ZSX.Variables.Music.Handlers    = {}
ZSX.Variables.Music.List        = [
    "./metadata/music/favor-reach.ogg",
    "./metadata/music/geoxor-zenith.ogg",
    "./metadata/music/khan-novocaine.ogg",
    "./metadata/music/sofi-swing.ogg",
    "./metadata/music/underground.ogg",
    "./metadata/music/zhu-mans.ogg",
]

ZSX.Variables.Music.Timestamp   = {
    "./metadata/music/favor-reach.ogg": 122,
    "./metadata/music/geoxor-zenith.ogg": 118,
    "./metadata/music/khan-novocaine.ogg": 76,
    "./metadata/music/sofi-swing.ogg": 93,
    "./metadata/music/underground.ogg": 18,
    "./metadata/music/zhu-mans.ogg": 132,
}


ZSX.Variables.Music.Handlers.RandomSound = ()=> {
    return ZSX.Variables.Music.List[Math.floor(Math.random() * ZSX.Variables.Music.List.length)];
}

ZSX.Variables.Music.Welcome = new Howl({
    src: ZSX.Variables.Music.Handlers.RandomSound(),
    volume: 0.1,
    loop: true,
    html5: false
})

ZSX.Variables.Iterators = {}
ZSX.Variables.Iterators.StepCounterCurrent  = 0

ZSX.Variables.GlobalValues = {}

ZSX.Variables.GlobalValues.Theme = "light"

ZSX.Variables.Configurator = {}

ZSX.Variables.Configurator.HelpNotifyShown = false

ZSX.Variables.Configurator.Selectors = {}

ZSX.Variables.Listener = {}

ZSX.Variables.Listener.Notify = {}
ZSX.Variables.Listener.Notify.Icon   = "fas fa-bell"
ZSX.Variables.Listener.Notify.Header = "Notification"
ZSX.Variables.Listener.Notify.Text   = "Test notification."

ZSX.Variables.Listener.Progress = {}
ZSX.Variables.Listener.Progress.Text = "Test progress."

ZSX.Variables.Listener.CarHud = {}
ZSX.Variables.Listener.CarHud.Units = 'kmh'

ZSX.Variables.Listener.Displayers = {}
ZSX.Variables.Listener.Displayers.Job = "Unemployed"
ZSX.Variables.Listener.Displayers.Cash = "0"
ZSX.Variables.Listener.Displayers.Bank = "0"
ZSX.Variables.Listener.Displayers.Identifier = "1"
ZSX.Variables.Listener.Displayers.Online_Amount = "1"
ZSX.Variables.Listener.Displayers.Online_Max = "128"
ZSX.Variables.Listener.Displayers.Icons = {}
ZSX.Variables.Listener.Displayers.Icons.Job     = "fas fa-suitcase"
ZSX.Variables.Listener.Displayers.Icons.Cash    = "fas fa-dollar-sign"
ZSX.Variables.Listener.Displayers.Icons.Bank    = "fas fa-university"

ZSX.Variables.Components = {}

ZSX.Variables.Components.TypeToText = {
    Hud: {
        "basic":            "Basic",
        "svg":              "Basic SVG",
        "diamond":          "Diamond",
        "hexagon":          "Hexagon",      
        "skew":             "Skew",
        "circle":           "Circle",      
        "icon-percent":     "Icon percentage",              
        "square-progress":  "Square progress",  
    },
    Notify: {
        "basic":            "Basic", 
        "modern":           "Modern", 
        "classic":          "Classic",  
    },
    Progress: {
        "basic":            "Basic", 
        "skew":             "Skew", 
        "classic":          "Classic", 
    },
    Displayers: {
        "basic":            "Basic", 
        "skew":             "Skew", 
        "modern":           "Modern",
    },
    CarHud: {
        'basic':            'Basic',
        'advanced':         'Advanced',
        'modern':           'Modern',
    }
}

ZSX.Variables.Components.Hud = {
    type: "basic",
    alignment: "row",
}

ZSX.Variables.Components.Notify = {
    type: "basic",
    animation: "cubicBezier(0.075, 0.82, 0.165, 1)",
    "text-align": "left"
}

ZSX.Variables.Components.Progress = {
    type: "basic",
}

ZSX.Variables.Components.Displayers = {
    type: "basic",
    alignment: "row"
}

ZSX.Variables.Components.CarHud = {
    type: 'basic',
}

ZSX.Variables.Content = {}

ZSX.Variables.Content.Selectors = {}

ZSX.Variables.Content.Selectors.Hud = {
    "basic":            '<div class="hud_basic">\
                            <div class="progress">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>',

    "svg":        '<div class="hud_svg">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">\
                                        <defs>\
                                            <linearGradient id="configAnimSvgProgress" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#configAnimSvgProgress)" d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>',

    "diamond":          '<div class="hud_diamond">\
                            <div class="progress">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>',
    
    "hexagon":          `<div class="hud_hexagon">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hexagon_gradient_configurator" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hexagon_gradient_configurator')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-heart"></i></div>
                        </div>`,
    

    "skew":             '<div class="hud_skew">\
                            <div class="progress">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>',

    "circle":           '<div class="hud_circle">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-heart"></i>\
                            </div>\
                        </div>',

    "icon-percent":     '<div class="hud_icon-percent">\
                            <div class="icon"><i class="fas fa-heart"></i></div>\
                            <div class="value">100</div>\
                        </div>',

    "square-progress":  '<div class="hud_square-progress">\
                            <div class="icon"><i class="fas fa-heart"></i></div>\
                            <div class="progress">\
                                <div class="value"></div>\
                            </div>\
                        </div>',
}

ZSX.Variables.Content.Selectors.Notify = {
    "basic":    '<div class="notify_basic">\
                    <div class="header-box-content">\
                        <div class="icon"><i class="fas fa-bell"></i></div>\
                        <div class="header-text">Notification</div>\
                    </div>\
                    <div class="text">This is your test notification which you can customize!</div>\
                </div>',
    "classic":  '<div class="notify_classic">\
                    <div class="icon"><i class="fas fa-bell"></i></div>\
                    <div class="header-box-content">\
                        <div class="header">Notification</div>\
                        <div class="text">This is your test notification which you can customize!</div>\
                    </div>\
                </div>',
    "modern":   '<div class="notify_modern">\
                    <div class="icon">\
                        <i class="fas fa-bell"></i>\
                    </div>\
                    <div class="header-box-content">\
                        <div class="header-text">Notification</div>\
                        <div class="text">\
                            This is your test notification which you can customize by your needs! \
                        </div>\
                    </div>\
                </div>',
}

ZSX.Variables.Content.Selectors.ProgressBar = {
    "basic":    '<div class="progress-bar_basic">\
                    <div class="progress">\
                        <div class="value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">Harvesting leafes</div>\
                </div>',
    "skew":     '<div class="progress-bar_skew">\
                    <div class="progress">\
                        <div class="value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">Harvesting leafes</div>\
                </div>',
    "classic":  '<div class="progress-bar_classic">\
                    <div class="progress">\
                        <div class="value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">Harvesting leafes</div>\
                </div>',
}

ZSX.Variables.Content.Selectors.CarHud = {
        'basic': `<div class="carhud-basic carhud-content_basic">
                    <div class="row">
                        <div class="speed-box carhud-speed-box-basic">
                            <div class="speed-int">1</div>
                            <div class="speed-int">9</div>
                            <div class="speed-int">3</div>
                        </div>
                        <div class="col">
                            <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                            <div class="street-label carhud-street-label">Strawberry Ave</div>
                        </div>
                        <div class="icons">
                            <div class="icon">
                                <i class="fas fa-user-slash"></i>
                            </div>
                        </div>
                    </div>
                    <div class="progress">
                        <div class="val"></div>
                    </div>
                </div>`,
    'advanced': `<div class="carhud-content_advanced">
                    <div class="carhud-advanced">
                        <svg id='rpmBase-preview' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 507 410" fill="none">
                            <path class='base' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="#000" stroke-width="30" stroke-dashoffset="1055" stroke-opacity='0.3' stroke-dasharray="2113.102783203125"/>
                            <path class='base' id='carhudProgress2-preview' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="rgb(255,255,255)" stroke-opacity='0.5' stroke-width="30" stroke-dashoffset="1700" stroke-dasharray="2113.102783203125"/>
                            <path class='base' id='carhudProgress2Outline-preview' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="var(--motive)" stroke-width="10" stroke-dashoffset="1700" stroke-dasharray="2113.102783203125"/>
                            <path class='base' id='carhudProgressRPMMAX-preview' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke-width="10" stroke-dashoffset="1950" stroke-dasharray="2113.102783203125"/>
                        </svg>
                        <svg id='fuelBase-preview' viewBox="0 0 507 410" xmlns="http://www.w3.org/2000/svg">
                            <path id="fuelContainer-preview" d="M107.913 328.81C133.541 271.31 136.994 206.362 117.606 146.468C98.2185 86.5746 57.3612 35.9695 2.89904 4.39439"/>
                            <path id="fuelProgress-preview" d="M107.913 328.81C133.541 271.31 136.994 206.362 117.606 146.468C98.2185 86.5746 57.3612 35.9695 2.89904 4.39439"/>
                        </svg>
                        <div class="indicators">
                            <div class="speed-box">
                                <div class="speed carhud-speed-box-advanced">
                                    <div class="speed-0">0</div>
                                    <div class="speed-0">0</div>
                                    <div class="speed-int">9</div>
                                </div>
                                <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                                <div class='street-label'>Strawberry Ave.</div>
                                <div class='belt'>
                                    <i class='fas fa-user-slash'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`,
    'modern': `<div class="carhud-content_modern">
                    <div class="carhud-modern">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 772 772" fill="none">
                        <path d="M386 752C313.612 752 242.85 730.534 182.661 690.318C122.473 650.101 75.5618 592.94 47.8601 526.062C20.1584 459.184 12.9104 385.594 27.0326 314.597C41.1548 243.6 76.0129 178.385 127.199 127.199C178.385 76.0129 243.6 41.1548 314.597 27.0326C385.594 12.9104 459.184 20.1584 526.062 47.8601C592.94 75.5617 650.101 122.473 690.318 182.661C730.534 242.85 752 313.612 752 386L751.963 386C751.963 313.619 730.5 242.864 690.287 182.682C650.075 122.499 592.919 75.5928 526.048 47.8939C459.177 20.195 385.594 12.9477 314.604 27.0685C243.614 41.1893 178.406 76.0439 127.225 127.225C76.0439 178.406 41.1893 243.614 27.0685 314.604C12.9477 385.594 20.195 459.177 47.8939 526.048C75.5928 592.919 122.499 650.075 182.682 690.287C242.864 730.5 313.619 751.963 386 751.963L386 752Z" stroke="black" stroke-opacity="0.2" stroke-width="40"/>
                        <path xmlns="http://www.w3.org/2000/svg" d="M386 752C313.612 752 242.85 730.534 182.661 690.318C122.473 650.101 75.5618 592.94 47.8601 526.062C20.1584 459.184 12.9104 385.594 27.0326 314.597C41.1548 243.6 76.0129 178.385 127.199 127.199C178.385 76.0129 243.6 41.1548 314.597 27.0326C385.594 12.9104 459.184 20.1584 526.062 47.8601C592.94 75.5617 650.101 122.473 690.318 182.661C730.534 242.85 752 313.612 752 386L751.963 386C751.963 313.619 730.5 242.864 690.287 182.682C650.075 122.499 592.919 75.5928 526.048 47.8939C459.177 20.195 385.594 12.9477 314.604 27.0685C243.614 41.1893 178.406 76.0439 127.225 127.225C76.0439 178.406 41.1893 243.614 27.0685 314.604C12.9477 385.594 20.195 459.177 47.8939 526.048C75.5928 592.919 122.499 650.075 182.682 690.287C242.864 730.5 313.619 751.963 386 751.963L386 752Z" stroke="var(--motive)" stroke-width="40" class="carhudProgressAnimModern"/>
                        <path d="M483.316 749.188C550.632 731.151 611.611 694.76 659.445 644.077C707.279 593.394 740.086 530.415 754.204 462.169L754.167 462.161C740.051 530.4 707.247 593.374 659.418 644.051C611.588 694.729 550.616 731.116 483.306 749.152L483.316 749.188Z" stroke="black" stroke-opacity="0.6"/>
                        <path d="M483.316 749.188C538.069 734.517 588.797 707.656 631.704 670.615C674.612 633.573 708.589 587.309 731.095 535.284L731.06 535.269C708.557 587.289 674.583 633.548 631.68 670.586C588.776 707.624 538.054 734.482 483.306 749.152L483.316 749.188Z" stroke="var(--motive)" stroke-width="22" id="carHudProgress3_fuel"/>
                        <path d="M741.61 376.075C739.67 306.564 717.401 239.146 677.556 182.156C637.711 125.166 582.037 81.1034 517.419 55.4152C452.8 29.727 382.069 23.54 313.972 37.6192C245.875 51.6983 183.397 85.4263 134.262 134.633C85.128 183.84 51.4921 246.367 37.5133 314.485C23.5344 382.603 29.8256 453.325 55.6089 517.906C81.3922 582.486 125.537 638.095 182.586 677.856C239.634 717.617 307.085 739.787 376.598 741.625L376.599 741.589C307.093 739.752 239.649 717.584 182.606 677.827C125.563 638.07 81.4227 582.467 55.6419 517.892C29.8612 453.318 23.5707 382.604 37.5481 314.492C51.5256 246.381 85.1581 183.86 134.287 134.658C183.417 85.4563 245.889 51.7318 313.979 37.654C382.07 23.5763 452.793 29.7627 517.405 55.4483C582.018 81.1339 637.686 125.192 677.527 182.177C717.368 239.161 739.635 306.572 741.575 376.076L741.61 376.075Z" stroke="black" stroke-opacity="0.2" stroke-width="20" stroke-dasharray="50 50"/>
                    </svg>
                        <div class="indicators">
                            <div class="speed-box">
                                <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                                <div class="speed carhud-speed-box-advanced">
                                    <div class="speed-0">0</div>
                                    <div class="speed-int">9</div>
                                    <div class="speed-int">8</div>
                                </div>
                                <div class='street-label'>Strawberry Ave.</div>
                            </div>
                            <div class='belt'>
                                <i class='fas fa-user-slash'></i>
                            </div>
                        </div>
                    </div>
                </div>`
}

ZSX.Variables.Content.Selectors.Displayers = {
    "basic":    '<div class="displayer-content_basic">\
                    <div class="row">\
                        <div class="displayer">\
                            <div class="icon displayer-icon-configurator"><i class="fas fa-suitcase"></i></div>\
                            <div class="text displayer-text-configurator">Unemployed</div>\
                        </div>\
                        <div class="displayer">\
                            <div class="icon"><i class="fas fa-dollar-sign"></i></div>\
                            <div class="text">1,931</div>\
                        </div>\
                        <div class="displayer">\
                            <div class="icon"><i class="fas fa-university"></i></div>\
                            <div class="text">9,123,931</div>\
                        </div>\
                    </div>\
                    <div class="row">\
                        <div class="displayer-b">\
                            <div class="icon">ID</div>\
                            <div class="text">23</div>\
                        </div>\
                        <div class="displayer-b">\
                            <div class="icon">Online</div>\
                            <div class="text">1/128</div>\
                        </div>\
                    </div>\
                </div>',
    "skew":     '<div class="displayer-content_skew">\
                    <div class="row">\
                        <div class="displayer">\
                            <div class="icon displayer-icon-configurator"><i class="fas fa-suitcase"></i></div>\
                            <div class="text displayer-text-configurator">Unemployed</div>\
                        </div>\
                        <div class="displayer">\
                            <div class="icon"><i class="fas fa-dollar-sign"></i></div>\
                            <div class="text">1,931</div>\
                        </div>\
                        <div class="displayer">\
                            <div class="icon"><i class="fas fa-university"></i></div>\
                            <div class="text">9,123,931</div>\
                        </div>\
                    </div>\
                    <div class="row">\
                        <div class="displayer-b">\
                            <div class="icon">ID</div>\
                            <div class="text">23</div>\
                        </div>\
                        <div class="displayer-b">\
                            <div class="icon">Online</div>\
                            <div class="text">1/128</div>\
                        </div>\
                    </div>\
                </div>',
    "modern":   '<div class="displayer-content_modern">\
                    <div class="col">\
                        <div class="displayer displayer-content-configurator">\
                            <div class="icon displayer-icon-configurator"><i class="fas fa-suitcase"></i></div>\
                            <div class="text displayer-text-configurator">Unemployed</div>\
                        </div>\
                        <div class="displayer displayer-content-configurator">\
                            <div class="icon displayer-icon-configurator"><i class="fas fa-dollar-sign"></i></div>\
                            <div class="text displayer-text-configurator">1,931</div>\
                        </div>\
                        <div class="displayer displayer-content-configurator">\
                            <div class="icon displayer-icon-configurator"><i class="fas fa-university"></i></div>\
                            <div class="text displayer-text-configurator">9,123,931</div>\
                        </div>\
                        <div class="row">\
                            <div class="col">\
                                <div class="displayer-b">\
                                    <div class="text-box">\
                                        <div class="text">ID</div>\
                                        <div class="map">23</div>\
                                    </div>\
                                </div>\
                                <div class="displayer-b">\
                                    <div class="text-box">\
                                        <div class="text">Online</div>\
                                        <div class="map">1/128</div>\
                                    </div>\
                                </div>\
                            </div>\
                        </div>\
                    </div>\
                </div>',
}

ZSX.Variables.Content.Complete = {}
ZSX.Variables.Content.Complete.Hud = {
    "basic":            '<div class="hud_basic hud-health">\
                            <div class="progress basic-value_health">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-armour">\
                            <div class="progress basic-value_armour">\
                                <div class="icon"><i class="fas fa-vest"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-hunger">\
                            <div class="progress basic-value_hunger">\
                                <div class="icon"><i class="fas fa-hamburger"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-thirst">\
                            <div class="progress basic-value_thirst">\
                                <div class="icon"><i class="fas fa-glass-whiskey"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-stress">\
                            <div class="progress basic-value_stress">\
                                <div class="icon"><i class="fas fa-brain"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-stamina">\
                            <div class="progress basic-value_stamina">\
                                <div class="icon"><i class="fas fa-running"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_basic hud-oxygen">\
                            <div class="progress basic-value_oxygen">\
                                <div class="icon"><i class="fas fa-lungs"></i></div>\
                            </div>\
                        </div>',
    "hexagon":          `<div class="hud_hexagon hud-health">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-health-hexagon" class="hud-health-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-health-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-heart"></i></div>
                        </div>
                        <div class="hud_hexagon hud-armour">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-armour-hexagon" class="hud-armour-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-armour-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-vest"></i></div>
                        </div>
                        <div class="hud_hexagon hud-hunger">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-hunger-hexagon" class="hud-hunger-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-hunger-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-hamburger"></i></div>
                        </div>
                        <div class="hud_hexagon hud-thirst">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-thirst-hexagon" class="hud-thirst-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-thirst-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-glass-whiskey"></i></div>
                        </div>
                        <div class="hud_hexagon hud-stress">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-stress-hexagon" class="hud-stress-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-health-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-brain"></i></div>
                        </div>
                        <div class="hud_hexagon hud-stamina">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-stamina-hexagon" class="hud-stamina-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-stamina-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-running"></i></div>
                        </div>
                        <div class="hud_hexagon hud-oxygen">
                            <svg viewBox="0 0 858 826" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <defs>
                                    <linearGradient id="hud-oxygen-hexagon" class="hud-oxygen-hexagon" gradientTransform="rotate(90)">
                                        <stop offset="0%" stop-color="#242424"/>
                                        <stop offset="0%" stop-color="var(--motive)"/>
                                    </linearGradient>
                                </defs>
                                <path d="M143.257 577.831L141.793 249.042L428.104 83.7405L715.553 249.927L713.847 578.663L427.536 743.964L143.257 577.831Z" fill="url('#hud-oxygen-hexagon')"/>
                                <path d="M192.355 549.538L191.143 277.245L428.257 140.347L666.315 277.977L664.902 550.227L427.787 687.125L192.355 549.538Z" fill="#171717"/>
                            </svg>
                            <div class="icon"><i class="fas fa-lungs"></i></div>
                        </div>`,
                        
    "svg":        '<div class="hud_svg hud-health">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_health" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_health)" d="M462.3 62.6C407.5 15.9 326 24.3 275.7 76.2L256 96.5l-19.7-20.3C186.1 24.3 104.5 15.9 49.7 62.6c-62.8 53.6-66.1 149.8-9.9 207.9l193.5 199.8c12.5 12.9 32.8 12.9 45.3 0l193.5-199.8c56.3-58.1 53-154.3-9.8-207.9z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-armour">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_armour" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_armour)" d="M437.252,239.877,384,160V32A32,32,0,0,0,352,0H320a24.021,24.021,0,0,0-13.312,4.031l-25,16.672a103.794,103.794,0,0,1-115.376,0l-25-16.672A24.021,24.021,0,0,0,128,0H96A32,32,0,0,0,64,32V160L10.748,239.877A64,64,0,0,0,0,275.377V480a32,32,0,0,0,32,32H192V288a31.987,31.987,0,0,1,1.643-10.119L207.135,237.4,150.188,66.564A151.518,151.518,0,0,0,224,86.234a151.55,151.55,0,0,0,73.812-19.672L224,288V512H416a32,32,0,0,0,32-32V275.377A64,64,0,0,0,437.252,239.877ZM131.312,371.312l-48,48a16,16,0,0,1-22.624-22.624l48-48a16,16,0,0,1,22.624,22.624Zm256,48a15.992,15.992,0,0,1-22.624,0l-48-48a16,16,0,0,1,22.624-22.624l48,48A15.993,15.993,0,0,1,387.312,419.312Z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-hunger">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_hunger" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_hunger)" d="M464 256H48a48 48 0 0 0 0 96h416a48 48 0 0 0 0-96zm16 128H32a16 16 0 0 0-16 16v16a64 64 0 0 0 64 64h352a64 64 0 0 0 64-64v-16a16 16 0 0 0-16-16zM58.64 224h394.72c34.57 0 54.62-43.9 34.82-75.88C448 83.2 359.55 32.1 256 32c-103.54.1-192 51.2-232.18 116.11C4 180.09 24.07 224 58.64 224zM384 112a16 16 0 1 1-16 16 16 16 0 0 1 16-16zM256 80a16 16 0 1 1-16 16 16 16 0 0 1 16-16zm-128 32a16 16 0 1 1-16 16 16 16 0 0 1 16-16z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-thirst">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_thirst" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_thirst)" d="M480 32H32C12.5 32-2.4 49.2.3 68.5l56 356.5c4.5 31.5 31.5 54.9 63.4 54.9h273c31.8 0 58.9-23.4 63.4-54.9l55.6-356.5C514.4 49.2 499.5 32 480 32zm-37.4 64l-30 192h-313L69.4 96h373.2z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-stress">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_stress" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_stress)" d="M208 0c-29.9 0-54.7 20.5-61.8 48.2-.8 0-1.4-.2-2.2-.2-35.3 0-64 28.7-64 64 0 4.8.6 9.5 1.7 14C52.5 138 32 166.6 32 200c0 12.6 3.2 24.3 8.3 34.9C16.3 248.7 0 274.3 0 304c0 33.3 20.4 61.9 49.4 73.9-.9 4.6-1.4 9.3-1.4 14.1 0 39.8 32.2 72 72 72 4.1 0 8.1-.5 12-1.2 9.6 28.5 36.2 49.2 68 49.2 39.8 0 72-32.2 72-72V64c0-35.3-28.7-64-64-64zm368 304c0-29.7-16.3-55.3-40.3-69.1 5.2-10.6 8.3-22.3 8.3-34.9 0-33.4-20.5-62-49.7-74 1-4.5 1.7-9.2 1.7-14 0-35.3-28.7-64-64-64-.8 0-1.5.2-2.2.2C422.7 20.5 397.9 0 368 0c-35.3 0-64 28.6-64 64v376c0 39.8 32.2 72 72 72 31.8 0 58.4-20.7 68-49.2 3.9.7 7.9 1.2 12 1.2 39.8 0 72-32.2 72-72 0-4.8-.5-9.5-1.4-14.1 29-12 49.4-40.6 49.4-73.9z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-stamina">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 416 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_stamina" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_stamina)" d="M272 96c26.51 0 48-21.49 48-48S298.51 0 272 0s-48 21.49-48 48 21.49 48 48 48zM113.69 317.47l-14.8 34.52H32c-17.67 0-32 14.33-32 32s14.33 32 32 32h77.45c19.25 0 36.58-11.44 44.11-29.09l8.79-20.52-10.67-6.3c-17.32-10.23-30.06-25.37-37.99-42.61zM384 223.99h-44.03l-26.06-53.25c-12.5-25.55-35.45-44.23-61.78-50.94l-71.08-21.14c-28.3-6.8-57.77-.55-80.84 17.14l-39.67 30.41c-14.03 10.75-16.69 30.83-5.92 44.86s30.84 16.66 44.86 5.92l39.69-30.41c7.67-5.89 17.44-8 25.27-6.14l14.7 4.37-37.46 87.39c-12.62 29.48-1.31 64.01 26.3 80.31l84.98 50.17-27.47 87.73c-5.28 16.86 4.11 34.81 20.97 40.09 3.19 1 6.41 1.48 9.58 1.48 13.61 0 26.23-8.77 30.52-22.45l31.64-101.06c5.91-20.77-2.89-43.08-21.64-54.39l-61.24-36.14 31.31-78.28 20.27 41.43c8 16.34 24.92 26.89 43.11 26.89H384c17.67 0 32-14.33 32-32s-14.33-31.99-32-31.99z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>\
                        <div class="hud_svg hud-oxygen">\
                            <div class="progress">\
                                <div class="icon">\
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">\
                                        <defs>\
                                            <linearGradient id="svg-value_oxygen" x1="0%" y1="100%" x2="0%" y2="0%">\
                                                <stop offset="100%" stop-color="var(--motive)"/>\
                                                <stop offset="100%" stop-color="#141414"/>\
                                            </linearGradient>\
                                        </defs>\
                                        <path fill="url(#svg-value_oxygen)" d="M636.11 390.15C614.44 308.85 580.07 231 534.1 159.13 511.98 124.56 498.03 96 454.05 96 415.36 96 384 125.42 384 161.71v60.11l-32.88-21.92a15.996 15.996 0 0 1-7.12-13.31V16c0-8.84-7.16-16-16-16h-16c-8.84 0-16 7.16-16 16v170.59c0 5.35-2.67 10.34-7.12 13.31L256 221.82v-60.11C256 125.42 224.64 96 185.95 96c-43.98 0-57.93 28.56-80.05 63.13C59.93 231 25.56 308.85 3.89 390.15 1.3 399.84 0 409.79 0 419.78c0 61.23 62.48 105.44 125.24 88.62l59.5-15.95c42.18-11.3 71.26-47.47 71.26-88.62v-87.49l-85.84 57.23a7.992 7.992 0 0 1-11.09-2.22l-8.88-13.31a7.992 7.992 0 0 1 2.22-11.09L320 235.23l167.59 111.72a7.994 7.994 0 0 1 2.22 11.09l-8.88 13.31a7.994 7.994 0 0 1-11.09 2.22L384 316.34v87.49c0 41.15 29.08 77.31 71.26 88.62l59.5 15.95C577.52 525.22 640 481.01 640 419.78c0-9.99-1.3-19.94-3.89-29.63z"/>\
                                    </svg>\
                                </div>\
                            </div>\
                        </div>',

    "diamond":          '<div class="hud_diamond hud-health">\
                            <div class="progress diamond-value_health">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-armour">\
                            <div class="progress diamond-value_armour">\
                                <div class="icon"><i class="fas fa-vest"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-hunger">\
                            <div class="progress diamond-value_hunger">\
                                <div class="icon"><i class="fas fa-hamburger"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-thirst">\
                            <div class="progress diamond-value_thirst">\
                                <div class="icon"><i class="fas fa-glass-whiskey"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-stress">\
                            <div class="progress diamond-value_stress">\
                                <div class="icon"><i class="fas fa-brain"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-stamina">\
                            <div class="progress diamond-value_stamina">\
                                <div class="icon"><i class="fas fa-running"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_diamond hud-oxygen">\
                            <div class="progress diamond-value_oxygen">\
                                <div class="icon"><i class="fas fa-lungs"></i></div>\
                            </div>\
                        </div>',

    "skew":             '<div class="hud_skew hud-health">\
                            <div class="progress skew-value_health">\
                                <div class="icon"><i class="fas fa-heart"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-armour">\
                            <div class="progress skew-value_armour">\
                                <div class="icon"><i class="fas fa-vest"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-hunger">\
                            <div class="progress skew-value_hunger">\
                                <div class="icon"><i class="fas fa-hamburger"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-thirst">\
                            <div class="progress skew-value_thirst">\
                                <div class="icon"><i class="fas fa-glass-whiskey"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-stress">\
                            <div class="progress skew-value_stress">\
                                <div class="icon"><i class="fas fa-brain"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-stamina">\
                            <div class="progress skew-value_stamina">\
                                <div class="icon"><i class="fas fa-running"></i></div>\
                            </div>\
                        </div>\
                        <div class="hud_skew hud-oxygen">\
                            <div class="progress skew-value_oxygen">\
                                <div class="icon"><i class="fas fa-lungs"></i></div>\
                            </div>\
                        </div>',

    "circle":           '<div class="hud_circle hud-health">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_health"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-heart"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-armour">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_armour"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-vest"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-hunger">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_hunger"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-hamburger"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-thirst">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_thirst"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-glass-whiskey"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-stress">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_stress"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-brain"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-stamina">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_stamina"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-running"></i>\
                            </div>\
                        </div>\
                        <div class="hud_circle hud-oxygen">\
                            <svg xmlns="http://www.w3.org/2000/svg">\
                                <circle cx="50%" cy="50%" r="45%" class="hud_circle_progress_smaller circle-value_oxygen"/>\
                            </svg>\
                            <div class="icon">\
                                <i class="fas fa-lungs"></i>\
                            </div>\
                        </div>',

    "icon-percent":     '<div class="hud_icon-percent hud-health">\
                            <div class="icon"><i class="fas fa-heart"></i></div>\
                            <div class="value icon-value_health">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-armour">\
                            <div class="icon"><i class="fas fa-vest"></i></div>\
                            <div class="value icon-value_armour">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-hunger">\
                            <div class="icon"><i class="fas fa-hamburger"></i></div>\
                            <div class="value icon-value_hunger">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-thirst">\
                            <div class="icon"><i class="fas fa-glass-whiskey"></i></div>\
                            <div class="value icon-value_thirst">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-stress">\
                            <div class="icon"><i class="fas fa-brain"></i></div>\
                            <div class="value icon-value_stress">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-stamina">\
                            <div class="icon"><i class="fas fa-running"></i></div>\
                            <div class="value icon-value_stamina">100</div>\
                        </div>\
                        <div class="hud_icon-percent hud-oxygen">\
                            <div class="icon"><i class="fas fa-lungs"></i></div>\
                            <div class="value icon-value_oxygen">100</div>\
                        </div>',

    "square-progress":  '<div class="hud_square-progress hud-health">\
                            <div class="icon"><i class="fas fa-heart"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_health"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-armour">\
                            <div class="icon"><i class="fas fa-vest"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_armour"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-hunger">\
                            <div class="icon"><i class="fas fa-hamburger"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_hunger"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-thirst">\
                            <div class="icon"><i class="fas fa-glass-whiskey"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_thirst"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-stress">\
                            <div class="icon"><i class="fas fa-brain"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_stress"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-stamina">\
                            <div class="icon"><i class="fas fa-running"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_stamina"></div>\
                            </div>\
                        </div>\
                        <div class="hud_square-progress hud-oxygen">\
                            <div class="icon"><i class="fas fa-lungs"></i></div>\
                            <div class="progress">\
                                <div class="value square-value_oxygen"></div>\
                            </div>\
                        </div>',
}

ZSX.Variables.Content.Complete.Notify = {
    "basic":    `<div class="notify_basic">\
                    <div class="header-box-content">\
                        <div class="icon"><i class="fas fa-bell"></i></div>\
                        <div class="header-text">${ZSX.Variables.Listener.Notify.Header}</div>\
                    </div>\
                    <div class="text">${ZSX.Variables.Listener.Notify.Text}</div>\
                </div>`,
    "classic":  `<div class="notify_classic">\
                    <div class="icon"><i class="fas fa-bell"></i></div>\
                    <div class="header-box-content">\
                        <div class="header">${ZSX.Variables.Listener.Notify.Header}</div>\
                        <div class="text">${ZSX.Variables.Listener.Notify.Text}</div>\
                    </div>\
                </div>`,
    "modern":   `<div class="notify_modern">\
                    <div class="icon">\
                        <i class="fas fa-bell"></i>\
                    </div>\
                    <div class="header-box-content">\
                        <div class="header-text">${ZSX.Variables.Listener.Notify.Header}</div>\
                        <div class="text">\
                            ${ZSX.Variables.Listener.Notify.Text}\
                        </div>\
                    </div>\
                </div>`,
}

ZSX.Variables.Content.Complete.ProgressBar = {
    "basic":    `<div class="progress-bar_basic">\
                    <div class="progress">\
                        <div class="value progress-value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">${ZSX.Variables.Listener.Progress.Text}</div>\
                </div>`,
    "skew":     `<div class="progress-bar_skew">\
                    <div class="progress">\
                        <div class="value progress-value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">${ZSX.Variables.Listener.Progress.Text}</div>\
                </div>`,
    "classic":  `<div class="progress-bar_classic">\
                    <div class="progress">\
                        <div class="value progress-value"></div>\
                    </div>\
                    <div class="text text-progress-configurator">${ZSX.Variables.Listener.Progress.Text}</div>\
                </div>`,
}

ZSX.Variables.Content.Complete.Displayers = {
    "basic":    `<div class="displayer-content_basic">\
                    <div class="row">\
                        <div class="displayer displayer-job">\
                            <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                            <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                        </div>\
                        <div class="displayer displayer-cash">\
                            <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                        </div>\
                        <div class="displayer displayer-bank">\
                            <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                        </div>\
                    </div>\
                    <div class="row">\
                        <div class="displayer-b displayer-id">\
                            <div class="icon">ID</div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                        </div>\
                        <div class="displayer-b displayer-online">\
                            <div class="icon">Online</div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Online_Amount}/${ZSX.Variables.Listener.Displayers.Online_Max}</div>\
                        </div>\
                    </div>\
                </div>`,
    "skew":     `<div class="displayer-content_skew">\
                    <div class="row">\
                        <div class="displayer displayer-job">\
                            <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                            <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                        </div>\
                        <div class="displayer displayer-cash">\
                            <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                        </div>\
                        <div class="displayer displayer-bank">\
                            <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                        </div>\
                    </div>\
                    <div class="row">\
                        <div class="displayer-b displayer-id">\
                            <div class="icon">ID</div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                        </div>\
                        <div class="displayer-b displayer-online">\
                            <div class="icon">Online</div>\
                            <div class="text">${ZSX.Variables.Listener.Displayers.Online_Amount}/${ZSX.Variables.Listener.Displayers.Online_Max}</div>\
                        </div>\
                    </div>\
                </div>`,
    "modern":   `<div class="displayer-content_modern">\
                    <div class="col">\
                        <div class="col">\
                            <div class="displayer displayer-content-configurator displayer-job">\
                                <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                                <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                            </div>\
                        <div class="displayer displayer-content-configurator displayer-cash">\
                            <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                            <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                        </div>\
                        <div class="displayer displayer-content-configurator displayer-bank">\
                            <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                            <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                        </div>\
                        <div class="row">\
                            <div class="col">\
                                <div class="displayer-b displayer-id">\
                                    <div class="text-box">\
                                        <div class="text">ID</div>\
                                        <div class="map">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                                    </div>\
                                </div>\
                                <div class="displayer-b displayer-online">\
                                    <div class="text-box">\
                                        <div class="text">Online</div>\
                                        <div class="map">${ZSX.Variables.Listener.Displayers.Online_Amount}/${ZSX.Variables.Listener.Displayers.Online_Max}</div>\
                                    </div>\
                                </div>\
                            </div>\
                        </div>\
                    </div>\
                </div>`,
}

ZSX.Variables.Content.Complete.CarHud = {
    'basic': `<div class="carhud-basic carhud-content_basic">
                <div class="row">
                    <div class="speed-box carhud-speed-box-basic">
                        <div class="speed-int">1</div>
                        <div class="speed-int">9</div>
                        <div class="speed-int">3</div>
                    </div>
                    <div class="col">
                        <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                        <div class="street-label carhud-street-label">Strawberry Ave</div>
                    </div>
                    <div class="icons">
                        <div class="icon fuel">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <defs>
                                <linearGradient id="fuel_svg-basic" x1="0%" y1="100%" x2="0%" y2="0%">
                                    <stop offset="100%" stop-color="var(--motive)"/>
                                    <stop offset="100%" stop-color="#141414"/>
                                </linearGradient>
                            </defs>
                                <path fill="url(#fuel_svg-basic)" d="M336 448H16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h320c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zm157.2-340.7l-81-81c-6.2-6.2-16.4-6.2-22.6 0l-11.3 11.3c-6.2 6.2-6.2 16.4 0 22.6L416 97.9V160c0 28.1 20.9 51.3 48 55.2V376c0 13.2-10.8 24-24 24s-24-10.8-24-24v-32c0-48.6-39.4-88-88-88h-8V64c0-35.3-28.7-64-64-64H96C60.7 0 32 28.7 32 64v352h288V304h8c22.1 0 40 17.9 40 40v27.8c0 37.7 27 72 64.5 75.9 43 4.3 79.5-29.5 79.5-71.7V152.6c0-17-6.8-33.3-18.8-45.3zM256 192H96V64h160v128z"/>
                            </svg>
                        </div>
                        <div class="icon belt">
                            <i class="fas fa-user-slash"></i>
                        </div>
                    </div>
                </div>
                <div class="progress">
                    <div class="val carhud-basic-progress-rpm"></div>
                </div>
            </div>`,
'advanced': `<div class="carhud-content_advanced">
                <div class="carhud-advanced">
                    <svg id='rpmBase' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 507 410" fill="none">
                        <path class='base' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="#000" stroke-width="30" stroke-dashoffset="1055" stroke-opacity='0.4' stroke-dasharray="2113.102783203125"/>
                        <path class='base' id='carhudProgress2' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="rgb(255,255,255)" stroke-opacity='0.5' stroke-width="30" stroke-dashoffset="1700" stroke-dasharray="2113.102783203125"/>
                        <path class='base' id='carhudProgress2Outline' d="M56.3767 406.455C28.9814 371.658 11.3634 330.234 5.32657 286.426C-0.710257 242.617 5.05105 197.997 22.0205 157.135C38.99 116.273 66.558 80.6374 101.902 53.8765C137.245 27.1156 179.095 10.1912 223.165 4.83622C267.235 -0.518723 311.942 5.8882 352.708 23.4009C393.475 40.9137 428.836 68.903 455.171 104.503C481.506 140.103 497.869 182.034 502.583 226.004C507.298 269.973 500.196 314.401 482.003 354.738L481.824 354.657C500.003 314.352 507.099 269.96 502.388 226.025C497.677 182.09 481.327 140.191 455.013 104.619C428.699 69.0469 393.365 41.0794 352.631 23.5804C311.896 6.08138 267.224 -0.320517 223.188 5.03023C179.153 10.381 137.336 27.2921 102.02 54.0321C66.7044 80.772 39.1581 116.38 22.2019 157.21C5.24568 198.04 -0.51113 242.625 5.52097 286.399C11.5531 330.174 29.1573 371.565 56.5311 406.335L56.3767 406.455Z" stroke="var(--motive)" stroke-width="10" stroke-dashoffset="1700" stroke-dasharray="2113.102783203125"/>
                    </svg>
                    <svg id='fuelBase' viewBox="0 0 507 410" xmlns="http://www.w3.org/2000/svg">
                        <path id="fuelContainer" d="M107.913 328.81C133.541 271.31 136.994 206.362 117.606 146.468C98.2185 86.5746 57.3612 35.9695 2.89904 4.39439"/>
                        <path id="fuelProgress" d="M107.913 328.81C133.541 271.31 136.994 206.362 117.606 146.468C98.2185 86.5746 57.3612 35.9695 2.89904 4.39439"/>
                    </svg>
                    <div class="indicators">
                        <div class="speed-box">
                            <div class="speed carhud-speed-box-advanced">
                                <div class="speed-0">0</div>
                                <div class="speed-0">0</div>
                                <div class="speed-int">9</div>
                            </div>
                            <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                            <div class='street-label'>Strawberry Ave.</div>
                            <div class='belt'>
                                <i class='fas fa-user-slash'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>`,
'modern': `<div class="carhud-content_modern">
            <div class="carhud-modern">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 772 772" fill="none">
                    <path d="M386 752C313.612 752 242.85 730.534 182.661 690.318C122.473 650.101 75.5618 592.94 47.8601 526.062C20.1584 459.184 12.9104 385.594 27.0326 314.597C41.1548 243.6 76.0129 178.385 127.199 127.199C178.385 76.0129 243.6 41.1548 314.597 27.0326C385.594 12.9104 459.184 20.1584 526.062 47.8601C592.94 75.5617 650.101 122.473 690.318 182.661C730.534 242.85 752 313.612 752 386L751.963 386C751.963 313.619 730.5 242.864 690.287 182.682C650.075 122.499 592.919 75.5928 526.048 47.8939C459.177 20.195 385.594 12.9477 314.604 27.0685C243.614 41.1893 178.406 76.0439 127.225 127.225C76.0439 178.406 41.1893 243.614 27.0685 314.604C12.9477 385.594 20.195 459.177 47.8939 526.048C75.5928 592.919 122.499 650.075 182.682 690.287C242.864 730.5 313.619 751.963 386 751.963L386 752Z" stroke="black" stroke-opacity="0.2" stroke-width="40"/>
                    <path id="carHudProgressRPMModern" xmlns="http://www.w3.org/2000/svg" d="M386 752C313.612 752 242.85 730.534 182.661 690.318C122.473 650.101 75.5618 592.94 47.8601 526.062C20.1584 459.184 12.9104 385.594 27.0326 314.597C41.1548 243.6 76.0129 178.385 127.199 127.199C178.385 76.0129 243.6 41.1548 314.597 27.0326C385.594 12.9104 459.184 20.1584 526.062 47.8601C592.94 75.5617 650.101 122.473 690.318 182.661C730.534 242.85 752 313.612 752 386L751.963 386C751.963 313.619 730.5 242.864 690.287 182.682C650.075 122.499 592.919 75.5928 526.048 47.8939C459.177 20.195 385.594 12.9477 314.604 27.0685C243.614 41.1893 178.406 76.0439 127.225 127.225C76.0439 178.406 41.1893 243.614 27.0685 314.604C12.9477 385.594 20.195 459.177 47.8939 526.048C75.5928 592.919 122.499 650.075 182.682 690.287C242.864 730.5 313.619 751.963 386 751.963L386 752Z" stroke="var(--motive)" stroke-width="40" class="carHudProgressModern"/>
                    <path d="M483.316 749.188C550.632 731.151 611.611 694.76 659.445 644.077C707.279 593.394 740.086 530.415 754.204 462.169L754.167 462.161C740.051 530.4 707.247 593.374 659.418 644.051C611.588 694.729 550.616 731.116 483.306 749.152L483.316 749.188Z" stroke="black" stroke-opacity="0.6"/>
                    <path id="carHudProgressModernFuel" d="M483.316 749.188C538.069 734.517 588.797 707.656 631.704 670.615C674.612 633.573 708.589 587.309 731.095 535.284L731.06 535.269C708.557 587.289 674.583 633.548 631.68 670.586C588.776 707.624 538.054 734.482 483.306 749.152L483.316 749.188Z" stroke="var(--motive)" stroke-width="22" class="carHudProgressModern_fuel"/>
                    <path d="M741.61 376.075C739.67 306.564 717.401 239.146 677.556 182.156C637.711 125.166 582.037 81.1034 517.419 55.4152C452.8 29.727 382.069 23.54 313.972 37.6192C245.875 51.6983 183.397 85.4263 134.262 134.633C85.128 183.84 51.4921 246.367 37.5133 314.485C23.5344 382.603 29.8256 453.325 55.6089 517.906C81.3922 582.486 125.537 638.095 182.586 677.856C239.634 717.617 307.085 739.787 376.598 741.625L376.599 741.589C307.093 739.752 239.649 717.584 182.606 677.827C125.563 638.07 81.4227 582.467 55.6419 517.892C29.8612 453.318 23.5707 382.604 37.5481 314.492C51.5256 246.381 85.1581 183.86 134.287 134.658C183.417 85.4563 245.889 51.7318 313.979 37.654C382.07 23.5763 452.793 29.7627 517.405 55.4483C582.018 81.1339 637.686 125.192 677.527 182.177C717.368 239.161 739.635 306.572 741.575 376.076L741.61 376.075Z" stroke="black" stroke-opacity="0.6" stroke-width="20" stroke-dasharray="50 50"/>
                </svg>
                    <div class="indicators">
                        <div class="speed-box">
                            <div class="units carhud-units">${ZSX.Variables.Listener.CarHud.Units}</div>
                            <div class="speed carhud-speed-box-modern">
                                <div class="speed-0">0</div>
                                <div class="speed-int">9</div>
                                <div class="speed-int">8</div>
                            </div>
                            <div class='street-label'>Strawberry Ave.</div>
                        </div>
                        <div class='belt'>
                            <i class='fas fa-user-slash'></i>
                        </div>
                    </div>
                </div>
            </div>`
}

ZSX.Variables.Game = {}

ZSX.Variables.Game.UI_Visible = false
ZSX.Variables.Game.Components = {
    "hud": {
        type: "basic",
        visible: false,
        position: null,
        scale: 1,
        alignment: "row",
        status: {
            health: 0,
            armour: 0,
            hunger: 0,
            thirst: 0,
            stress: 0,
        },
        componentsVisible: {
            health: true,
            armour: true,
            hunger: true,
            thirst: true,
            stress: true,
        }
    },
    "notify": {
        type: "basic",
        "text-align": "left",
        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
        visible: false,
        position: null,
        scale: 1,
        lengthTable: 0,
    },
    "progress": {
        type: "basic",
        visible: false,
        position: null,
        scale: 1,
    },
    "displayers": {
        type: "basic",
        visible: false,
        position: null,
        scale: 1,
        componentsVisible: {
            job: true,
            cash: true,
            bank: true,
            id: true,
            online: true,
        }
    },
    "carhud": {
        type: "basic",
        active: false,
        position: null,
        scale: 1,
        seatbelt: false,
    },
}

ZSX.Variables.Game.Notify = {
    "basic":    `<div class="notify_basic notify-text-${ZSX.Variables.Game.Components["notify"]["text-align"]}">\
                    <div class="header-box-content notify-content-${ZSX.Variables.Components.Notify["text-align"]}">\
                        <div class="icon"><i class="${ZSX.Variables.Listener.Notify.Icon}"></i></div>\
                        <div class="header-text">${ZSX.Variables.Listener.Notify.Header}</div>\
                    </div>\
                    <div class="text">${ZSX.Variables.Listener.Notify.Text}</div>\
                </div>`,
    "classic":  `<div class="notify_classic notify-text-${ZSX.Variables.Game.Components["notify"]["text-align"]}">\
                    <div class="icon"><i class="${ZSX.Variables.Listener.Notify.Icon}"></i></div>\
                    <div class="header-box-content">\
                        <div class="header">${ZSX.Variables.Listener.Notify.Header}</div>\
                        <div class="text">${ZSX.Variables.Listener.Notify.Text}</div>\
                    </div>\
                </div>`,
    "modern":   `<div class="notify_modern notify-text-${ZSX.Variables.Game.Components["notify"]["text-align"]}">\
                    <div class="icon">\
                        <i class="${ZSX.Variables.Listener.Notify.Icon}"></i>\
                    </div>\
                    <div class="header-box-content notify-content-${ZSX.Variables.Components.Notify["text-align"]}">\
                        <div class="header-text">${ZSX.Variables.Listener.Notify.Header}</div>\
                        <div class="text">\
                            ${ZSX.Variables.Listener.Notify.Text}\
                        </div>\
                    </div>\
                </div>`,
}

ZSX.Variables.Game.Translations = {}
ZSX.Variables.Game.Translations.Theme = 'Theme'
ZSX.Variables.Game.Translations.Picker = 'Picker'
ZSX.Variables.Game.Translations.Preview = 'Preview'

//Translate only the right side for example:
//'hud':          'Hud',
//Changing name from Hud to Player Interface 
//'hud':          'Player Interface',
//Done :3

ZSX.Variables.Game.Translations.NavbarData = {}
ZSX.Variables.Game.Translations.NavbarData.Element = {
    'hud':          'Hud',
    'notify':       'Notify',
    'displayers':   'Displayers',
    'progress':     'Progress',
    'carhud':       'Car Hud',
}

ZSX.Variables.Game.Translations.NavbarData.ClassName = {
    'basic':            'Basic',
    'svg':              'SVG',
    'diamond':          'Diamond',
    'circle':           'Circle',
    'icon-percent':     'Icon Percent',
    'square-progress':  'Square Progress',
    'skew':             'Skew',
    'modern':           'Modern',
    'classic':          'Classic',
    'advanced':         'Advanced',
    "hexagon":          "Hexagon",
}
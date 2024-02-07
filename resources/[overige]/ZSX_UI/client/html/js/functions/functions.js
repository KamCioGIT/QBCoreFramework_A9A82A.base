const sleep = time => new Promise(res => setTimeout(res, time, "done sleeping"));
ZSX.Functions = {}
ZSX.Functions.Helper = {}
ZSX.Functions.Helper.Storage = e=> {
    if (ZSX.Variables.CfgToJs.Creator['Hud'] && ZSX.Storage.Getters.Hud() == null) return false
    if (ZSX.Variables.CfgToJs.Creator['Notify'] && ZSX.Storage.Getters.Notify() == null) return false
    if (ZSX.Variables.CfgToJs.Creator['Displayers'] && ZSX.Storage.Getters.Displayers() == null) return false
    if (ZSX.Variables.CfgToJs.Creator['Progress'] && ZSX.Storage.Getters.Progress() == null) return false
    if (ZSX.Variables.CfgToJs.Creator['CarHud'] && ZSX.Storage.Getters.CarHud() == null) return false
    return true
}

ZSX.Functions.Boot = {}

    ZSX.Functions.Boot.Storage = ()=> {
        if (ZSX.Functions.Helper.Storage()) {
            ZSX.Variables.Game.Components["hud"] = JSON.parse(ZSX.Storage.Getters.Hud())
            ZSX.Variables.Game.Components["notify"] = JSON.parse(ZSX.Storage.Getters.Notify())
            ZSX.Variables.Game.Components["progress"] = JSON.parse(ZSX.Storage.Getters.Progress())
            ZSX.Variables.Game.Components["displayers"] = JSON.parse(ZSX.Storage.Getters.Displayers())
            ZSX.Variables.Game.Components["carhud"] = JSON.parse(ZSX.Storage.Getters.CarHud())
            ZSX.Variables.Game.Components["hud"].visible = false
            ZSX.Variables.Game.Components["notify"].visible = false
            ZSX.Variables.Game.Components["progress"].visible = false
            ZSX.Variables.Game.Components["displayers"].visible = false
            ZSX.Variables.Game.Components["carhud"].visible = false
            ZSX.Variables.Game.Components["carhud"].active = false
            $(":root").css("--motive", ZSX.Storage.Getters.Theme())
            $.post(`https://${GetParentResourceName()}/UpdatePlayerColor`, JSON.stringify({color: ZSX.Storage.Getters.Theme()}))
            ZSX.Variables.Music.Welcome.volume(0)
            ZSX.Variables.Music.Welcome.play()
            return true
        } else { 
            return false
        }
    }
    
    ZSX.Functions.Boot.Configurator = data=> {
        ZSX.Variables.CfgToJs.Creator = data
        $.map(data, (v,k)=> {
            if (!v) {
                $(`.configurator-${k.toLowerCase()}-setup`).remove()
                $(`.navbar-element-${k.toLowerCase()}`).remove()
                $(`.${k.toLowerCase()}-game_append`).remove()
            }
        })
        var buttonContainer = $('.configurator-setup:last-child').find('.flex-row')
        if (buttonContainer.find('.button-preview-configurator').length == 0) {
            buttonContainer.find('.button-next-configurator').remove()
            buttonContainer.append(`<div class="button button-preview-configurator button-hover-style-config">${ZSX.Variables.Game.Translations.Preview}</div>`)
        }  
    }

    //[ZSX] Render proper content
    var debug = false
    ZSX.Functions.Boot.Set = async (data)=> {
        if (!debug) {
            ZSX.Functions.Boot.Configurator(data.Creator)
            $('.boot-text').html(data.ServerName)
            ZSX.Variables.CfgToJs.ManualOverride = data.AutoStartUI
            ZSX.Variables.CfgToJs.ConfigurationMenu = data.ConfigurationMenu
            ZSX.Variables.Listener.CarHud.Units = data.Units
            ZSX.Variables.CfgToJs.Optionals = data.Optional
            // Icons setup
            ZSX.Variables.Listener.Displayers.Icons.Job     = data.Icons.Displayer_Job
            ZSX.Variables.Listener.Displayers.Icons.Cash    = data.Icons.Displayer_Cash
            ZSX.Variables.Listener.Displayers.Icons.Bank    = data.Icons.Displayer_Bank
            if (!data.UseStress) {
                if (data.Standalone) {
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
                            "hexagon":      `<div class="hud_hexagon hud-health">
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
                                                            <path fill="url(#svg-value_hunger)" d="M272 96c26.51 0 48-21.49 48-48S298.51 0 272 0s-48 21.49-48 48 21.49 48 48 48zM113.69 317.47l-14.8 34.52H32c-17.67 0-32 14.33-32 32s14.33 32 32 32h77.45c19.25 0 36.58-11.44 44.11-29.09l8.79-20.52-10.67-6.3c-17.32-10.23-30.06-25.37-37.99-42.61zM384 223.99h-44.03l-26.06-53.25c-12.5-25.55-35.45-44.23-61.78-50.94l-71.08-21.14c-28.3-6.8-57.77-.55-80.84 17.14l-39.67 30.41c-14.03 10.75-16.69 30.83-5.92 44.86s30.84 16.66 44.86 5.92l39.69-30.41c7.67-5.89 17.44-8 25.27-6.14l14.7 4.37-37.46 87.39c-12.62 29.48-1.31 64.01 26.3 80.31l84.98 50.17-27.47 87.73c-5.28 16.86 4.11 34.81 20.97 40.09 3.19 1 6.41 1.48 9.58 1.48 13.61 0 26.23-8.77 30.52-22.45l31.64-101.06c5.91-20.77-2.89-43.08-21.64-54.39l-61.24-36.14 31.31-78.28 20.27 41.43c8 16.34 24.92 26.89 43.11 26.89H384c17.67 0 32-14.33 32-32s-14.33-31.99-32-31.99z"/>\
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
                } else {
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
                            "hexagon":      `<div class="hud_hexagon hud-health">
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
                                                            <path fill="url(#svg-value_hunger)" d="M272 96c26.51 0 48-21.49 48-48S298.51 0 272 0s-48 21.49-48 48 21.49 48 48 48zM113.69 317.47l-14.8 34.52H32c-17.67 0-32 14.33-32 32s14.33 32 32 32h77.45c19.25 0 36.58-11.44 44.11-29.09l8.79-20.52-10.67-6.3c-17.32-10.23-30.06-25.37-37.99-42.61zM384 223.99h-44.03l-26.06-53.25c-12.5-25.55-35.45-44.23-61.78-50.94l-71.08-21.14c-28.3-6.8-57.77-.55-80.84 17.14l-39.67 30.41c-14.03 10.75-16.69 30.83-5.92 44.86s30.84 16.66 44.86 5.92l39.69-30.41c7.67-5.89 17.44-8 25.27-6.14l14.7 4.37-37.46 87.39c-12.62 29.48-1.31 64.01 26.3 80.31l84.98 50.17-27.47 87.73c-5.28 16.86 4.11 34.81 20.97 40.09 3.19 1 6.41 1.48 9.58 1.48 13.61 0 26.23-8.77 30.52-22.45l31.64-101.06c5.91-20.77-2.89-43.08-21.64-54.39l-61.24-36.14 31.31-78.28 20.27 41.43c8 16.34 24.92 26.89 43.11 26.89H384c17.67 0 32-14.33 32-32s-14.33-31.99-32-31.99z"/>\
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
                }
            }
            ZSX.Functions.Boot.Storage()
            if (!data.ConfigurationMenu) {
                if (data.AutoStartUI) {
                    ZSX.Functions.Game.OpenAfterConfig(false)
                    await sleep(3000)
                    ZSX.Variables.Active.Game = true 
                    $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Game", state: true}))
                    $(".logo-screen").fadeOut(1000)
                } else if (data.AutoStartUI) {
                    $(".logo-screen").fadeOut(1000)
                }
            } else if (data.ConfigurationMenu) {
                if (ZSX.Functions.Boot.Storage()) {
                    if (data.AutoStartUI) {
                        ZSX.Functions.Game.OpenAfterConfig(false)
                        await sleep(3000)
                        ZSX.Variables.Active.Game = true 
                        $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Game", state: true}))
                        $(".logo-screen").fadeOut(1000)
                    } else if (!data.AutoStartUI) {
                        $(".logo-screen").fadeOut(1000)
                    }
                } else if (!ZSX.Functions.Boot.Storage()) {
                    if (data.AutoStartUI) {
                        ZSX.Functions.Welcome.Initialize()
                    } else {
                        $(".logo-screen").fadeOut(1000)
                    }
                }
            }
        }
    }

ZSX.Functions.Welcome = {}

    ZSX.Functions.Welcome.Initialize = async()=> {
        $(".logo-screen").css({display: 'flex'}).hide().fadeIn(1000)
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Configuration", state: true}))
        anime({
            targets: ".welcome-screen",
            left: ["-100%", "0%"],
            duration: 600,
            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
        })
        await sleep(1000)
        ZSX.Variables.SFX.TransitionWelcome.play()
        anime({
            targets: ".header-welcome",
            left: ["100%", "0%"],
            duration: 1000,
            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
            complete: async()=> {
                await sleep(2000)
                if (!debug) $.post(`https://${GetParentResourceName()}/focus`, JSON.stringify({state: true}))
                ZSX.Variables.Music.Welcome.play()
                if (ZSX.Variables.Music.Welcome["_src"] == "./metadata/music/geoxor-zenith.mp3") {
                    $(":root").css({"--theme": "#000"})
                    $(":root").css({"--theme-color": "#fff"})
                    await sleep(125)
                    $(":root").css({"--theme": "#fff"})
                    $(":root").css({"--theme-color": "#000"})
                }
                $(".logo-screen-box").css({opacity: 1})
                anime({
                    targets: ".info-welcome",
                    opacity: [0, 1],
                    duration: 300,
                    easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                    complete: async()=> {
                        ZSX.Variables.Active.Welcome = true
                    }
                })
            }
        })
        $(".header-welcome").animate({opacity: 1}, 400)
    }

    ZSX.Functions.Welcome.Disable = (event)=> {
        ZSX.Variables.Music.Welcome.fade(0.1, 0.01, 1000)
        ZSX.Variables.SFX.TransitionWoosh.play()
        if (ZSX.Variables.Active.Welcome) {
            ZSX.Variables.Active.Welcome = false
            anime({
                targets: ".welcome-screen",
                left: ["0", "-100%"],
                duration: 1000,
                easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                complete: ()=> {
                    if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Welcome", state: false}))
                    if (event) {
                        ZSX.Functions.Configuration.Initialize()
                    }
                }
            })
        }
    }
ZSX.Functions.Preview = {}

    ZSX.Functions.Preview.Handlers = {}

        ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals = ()=> {
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
                                    <div class="displayer displayer-job" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Job ? "style='display: none'" : ''}>\
                                        <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                                        <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                                    </div>\
                                    <div class="displayer displayer-cash" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Cash ? "style='display: none'" : ''}>\
                                        <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                                    </div>\
                                    <div class="displayer displayer-bank" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Bank ? "style='display: none'" : ''}>\
                                        <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                                    </div>\
                                </div>\
                                <div class="row">\
                                    <div class="displayer-b displayer-id" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].ID ? "style='display: none'" : ''}>\
                                        <div class="icon">ID</div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                                    </div>\
                                    <div class="displayer-b displayer-online" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Online ? "style='display: none'" : ''}>\
                                        <div class="icon">Online</div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Online_Amount}/${ZSX.Variables.Listener.Displayers.Online_Max}</div>\
                                    </div>\
                                </div>\
                            </div>`,
                "skew":     `<div class="displayer-content_skew">\
                                <div class="row">\
                                    <div class="displayer displayer-job" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Job ? "style='display: none'" : ''}>\
                                        <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                                        <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                                    </div>\
                                    <div class="displayer displayer-cash" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Cash ? "style='display: none'" : ''}>\
                                        <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                                    </div>\
                                    <div class="displayer displayer-bank" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Bank ? "style='display: none'" : ''}>\
                                        <div class="icon"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                                    </div>\
                                </div>\
                                <div class="row">\
                                    <div class="displayer-b displayer-id" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].ID ? "style='display: none'" : ''}>\
                                        <div class="icon">ID</div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                                    </div>\
                                    <div class="displayer-b displayer-online" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Online ? "style='display: none'" : ''}>\
                                        <div class="icon">Online</div>\
                                        <div class="text">${ZSX.Variables.Listener.Displayers.Online_Amount}/${ZSX.Variables.Listener.Displayers.Online_Max}</div>\
                                    </div>\
                                </div>\
                            </div>`,
                "modern":   `<div class="displayer-content_modern">\
                                <div class="col">\
                                    <div class="col">\
                                        <div class="displayer displayer-content-configurator displayer-job" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Job ? "style='display: none'" : ''}>\
                                            <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Job}"></i></div>\
                                            <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Job}</div>\
                                        </div>\
                                    <div class="displayer displayer-content-configurator displayer-cash" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Cash ? "style='display: none'" : ''}>\
                                        <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Cash}"></i></div>\
                                        <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Cash}</div>\
                                    </div>\
                                    <div class="displayer displayer-content-configurator displayer-bank" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Bank ? "style='display: none'" : ''}>\
                                        <div class="icon displayer-icon-configurator"><i class="${ZSX.Variables.Listener.Displayers.Icons.Bank}"></i></div>\
                                        <div class="text displayer-text-configurator">${ZSX.Variables.Listener.Displayers.Bank}</div>\
                                    </div>\
                                    <div class="row">\
                                        <div class="col">\
                                            <div class="displayer-b displayer-id" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].ID ? "style='display: none'" : ''}>\
                                                <div class="text-box">\
                                                    <div class="text">ID</div>\
                                                    <div class="map">${ZSX.Variables.Listener.Displayers.Identifier}</div>\
                                                </div>\
                                            </div>\
                                            <div class="displayer-b displayer-online" ${!ZSX.Variables.CfgToJs.Optionals['Displayers'].Online ? "style='display: none'" : ''}>\
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
            ZSX.Variables.Game.Notify = {
                "basic":    `<div class="notify_basic notify-text-${ZSX.Variables.Game.Components["notify"]["text-align"]}">\
                                <div class="header-box-content notify-content-${ZSX.Variables.Game.Components["notify"]["text-align"]}">\
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
                                <div class="header-box-content notify-content-${ZSX.Variables.Game.Components["text-align"]}">\
                                    <div class="header-text">${ZSX.Variables.Listener.Notify.Header}</div>\
                                    <div class="text">\
                                        ${ZSX.Variables.Listener.Notify.Text}\
                                    </div>\
                                </div>\
                            </div>`,
            }
        }

        ZSX.Functions.Preview.Handlers.Buttons = (data)=> {
            if (data.type == "scale_reset") {
                $(`.${ZSX.Variables.Preview.Component.Used.toLowerCase()}-container-preview_append`).css({transform: 'scale(1.0)'})
                ZSX.Variables.Preview.Component.Scale[ZSX.Variables.Preview.Component.Used] = 1
                $(".input-menu_range").val(1)
            } else if (data.type == "position_reset") {
                $(`.${ZSX.Variables.Preview.Component.Used.toLowerCase()}-container-preview_append`).css({inset: ""})
            }
        }

        ZSX.Functions.Preview.Handlers.SetElements = async ()=> {
            var currentHud          = ZSX.Variables.Components.Hud["type"]
                currentNotify       = ZSX.Variables.Components.Notify["type"]
                currentProgressbar  = ZSX.Variables.Components.Progress["type"] 
                currentDisplayer    = ZSX.Variables.Components.Displayers["type"]
                currentCarHud       = ZSX.Variables.Components.CarHud["type"]
            ZSX.Variables.Listener.Notify.Header = "Warning"
            ZSX.Variables.Listener.Notify.Text = "You can hover UI elements to manipulate their positions!"
            ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()
            //generating ui components
              $(".hud-container-preview_append").html(ZSX.Variables.Content.Complete.Hud[currentHud])
              $(".notify-container-preview_append").html(ZSX.Variables.Content.Complete.Notify[currentNotify])
              $(".progress-container-preview_append").html(ZSX.Variables.Content.Complete.ProgressBar[currentProgressbar])
              $(".displayers-container-preview_append").html(ZSX.Variables.Content.Complete.Displayers[currentDisplayer])
              $(".carhud-container-preview_append").html(ZSX.Variables.Content.Complete.CarHud[currentCarHud])
            $('.preview-item-draggable').draggable({
                scroll: false,
                drag: (e,ui)=> {
                    $(e.target).css({transform: `scale(1)`})
                },
                stop: (e,ui)=> {
                    ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].position = $(e.target).css("inset")
                    $(e.target).css({transform: `scale(${ZSX.Variables.Preview.Component.Scale[$(e.target).data("element")]})`})
                }
            })

            $(".game-item-draggable").draggable({
                scroll: false,
                drag: (e,ui)=> {
                    $(e.target).css({transform: `scale(1)`})
                },
                stop: (e,ui)=> {
                    ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].position = $(e.target).css("inset")
                    $(e.target).css({transform: `scale(${ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].scale})`})
                }
            })
            //adding options 
            var notifyDiv = $(".notify-container-preview_append")
            if (currentNotify != "classic") {
                var parent = notifyDiv.find($(`.notify_${currentNotify}`))
                var header = parent.find(".header-box-content")
                parent.addClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
                header.addClass(`notify-content-${ZSX.Variables.Components.Notify["text-align"]}`)
            } else if (currentNotify == "classic") {
                var parent = notifyDiv.find($(`.notify_classic`))
                parent.addClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
            }
        }

        ZSX.Functions.Preview.Handlers.Menu = {}
    
            ZSX.Functions.Preview.Handlers.Menu.Handler = (data)=> {
                if (ZSX.Variables.Active.PreviewMenu && !ZSX.Variables.Active.PreviewMenuAnimation) {
                    if (data.header != ZSX.Variables.Preview.Component.Used) {
                        ZSX.Variables.Active.PreviewMenuAnimation = true
                        ZSX.Variables.SFX.TransitionWelcome.play()
                        $(".input-menu_range").val(ZSX.Variables.Preview.Component.Scale[data.header])
                        anime({
                            targets: '.header-box-preview',
                            left: ["0%", "-125%"],
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            duration: 900,
                            complete: async()=> {
                                await sleep(300)
                                ZSX.Variables.Preview.Component.Used = data.header
                                ZSX.Variables.Active.PreviewMenu = false
                                $(".header-preview-menu").html(data.header)
                                $(".text-preview-menu").html(data.text)
                                ZSX.Variables.SFX.TransitionWelcome.play()
                                anime({
                                    targets: '.header-box-preview',
                                    left: ["-125%", "0%"],
                                    easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                                    duration: 900,
                                    complete: ()=> {
                                        ZSX.Variables.Active.PreviewMenu = true
                                        ZSX.Variables.Active.PreviewMenuAnimation = false
                                    }
                                })
                            }
                        })
                    } else if (data.header == ZSX.Variables.Preview.Component.Used) {
                        ZSX.Variables.SFX.TransitionWelcome.play()
                        ZSX.Variables.Active.PreviewMenuAnimation = true
                        $(".header-preview-menu").html(data.header)
                        $(".text-preview-menu").html(data.text)
                        anime({
                            targets: '.menu_preview',
                            left: ["0%", "-25%"],
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            duration: 1000,
                            complete: ()=> {
                                ZSX.Variables.Active.PreviewMenu = false
                                ZSX.Variables.Active.PreviewMenuAnimation = false
                            }
                        })
                    }

                } else if (!ZSX.Variables.Active.PreviewMenu && !ZSX.Variables.Active.PreviewMenuAnimation) {
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    ZSX.Variables.Active.PreviewMenuAnimation = true
                    ZSX.Variables.Preview.Component.Used = data.header
                    $(".input-menu_range").val(ZSX.Variables.Preview.Component.Scale[data.header])
                    $(".header-preview-menu").html(data.header)
                    $(".text-preview-menu").html(data.text)
                    anime({
                        targets: '.menu_preview',
                        left: ["-25%", "0%"],
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        duration: 1000,
                        complete: ()=> {
                            ZSX.Variables.Active.PreviewMenu = true
                            ZSX.Variables.Active.PreviewMenuAnimation = false
                        }
                    })
                }
            }

            ZSX.Functions.Preview.Handlers.Menu.HandleAlignment = (data)=> {
                if (data) {
                    if (data.element == "Hud") {
                        var container = $(".hud-container-preview_append")
                        if (ZSX.Variables.Components.Hud["alignment"] == "row") {
                            container.css({"flex-direction": "column"}) 
                            ZSX.Variables.Components.Hud["alignment"] = "column"
                        } else if (ZSX.Variables.Components.Hud["alignment"] == "column") {
                            container.css({"flex-direction": "row"})
                            ZSX.Variables.Components.Hud["alignment"] = "row"
                        }
                    }
                }
            }

            ZSX.Functions.Preview.Handlers.Menu.ForceClose = ()=> {
                if (ZSX.Variables.Active.PreviewMenu && !ZSX.Variables.Active.PreviewMenuAnimation) {
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    ZSX.Variables.Active.PreviewMenuAnimation = true
                    anime({
                        targets: '.menu_preview',
                        left: ["0%", "-25%"],
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        duration: 1000,
                        complete: ()=> {
                            ZSX.Variables.Active.PreviewMenu = false
                            ZSX.Variables.Active.PreviewMenuAnimation = false
                        }
                    })
                }
            }
    
        ZSX.Functions.Preview.Handlers.Accept = (state)=> {
            ZSX.Variables.SFX.Preset.play()
            if (state) {
                if (!ZSX.Variables.Active.PreviewRequest) {
                    ZSX.Variables.Active.PreviewRequest = true
                    $(".preview-end-request").css({display: "flex"}).hide().fadeIn(1000)
                    anime({
                        targets: ".ui-elements-preview",
                        scale: ["1", "0.8"],
                        duration: 1000,
                        easing: "easeInOutExpo",
                    })
                }
            } else if (!state) {
                if (ZSX.Variables.Active.PreviewRequest) {
                    $(".preview-end-request").fadeOut(1000)
                    anime({
                        targets: ".ui-elements-preview",
                        scale: ["0.8", "1"],
                        duration: 1000,
                        easing: "easeInOutExpo",
                        complete: ()=> {
                            ZSX.Variables.Active.PreviewRequest = false
                        }
                    })
                }
            }

        }

    ZSX.Functions.Preview.Init = async ()=> {
        ZSX.Variables.Music.Welcome.fade(0.03, 0.01, 1000)
        $('.logo-info').html('Preview')
        $(".preview-box-entrance").css({left: "0%"})
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Preview", state: true}))
        await ZSX.Functions.Preview.Handlers.SetElements()
        if (ZSX.Variables.Components.Hud["type"] == "circle") {
            var formula = ($(window).width() * 2.3)/100
            var circleRadius = formula * 0.45
            var circleDashArray = (2 * Math.PI * circleRadius)
            var percent = 0
            var circleDashOffset = (percent*circleDashArray/100) - circleDashArray
            $(".hud_circle_progress_smaller").css({
                "stroke-dasharray": circleDashArray,
                "stroke-dashoffset": circleDashOffset
            })
        }
        ZSX.Variables.SFX.TransitionWoosh.play()
        anime({
            targets: ".configuration-screen",
            top: ["0", "100%"],
            duration: 1000,
            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
            complete: async()=> {
                ZSX.Variables.Active.Configurator.Active = false
                ZSX.Variables.SFX.TransitionWoosh.play()
                ZSX.Variables.Music.Welcome.fade(0.01, 0.03, 1000)
                anime({
                    targets: ".preview-screen",
                    right: ["100%", "0%"],
                    duration: 1000,
                    easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                    complete: async ()=> {
                        await sleep(3000)
                        ZSX.Variables.SFX.TransitionWoosh.play()
                        anime({
                            targets: ".preview-box-entrance",
                            left: ["0%", "100%"],
                            duration: 1000,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                ZSX.Variables.Active.Preview = true
                                if (ZSX.Variables.Components.Hud["type"] == "circle") {
                                    var formula = ($(window).width() * 2.3)/100
                                    var circleRadius = formula * 0.45
                                    var circleDashArray = (2 * Math.PI * circleRadius)
                                    var percent = 100
                                    var circleDashOffset = (percent*circleDashArray/100) - circleDashArray
                                    $(".hud_circle_progress_smaller").css({
                                        "stroke-dasharray": circleDashArray,
                                        "stroke-dashoffset": circleDashOffset
                                    })
                                }
                            }
                        })
                    }
                })
            }
        })
    }

    ZSX.Functions.Preview.End = (state)=> {
        if (state) {
            ZSX.Variables.Active.Preview = false
            ZSX.Variables.Music.Welcome.fade(0.03, 0.01, 1000)
            $('.logo-info').html('Configurator')
            ZSX.Variables.Active.Preview = false
            ZSX.Variables.SFX.TransitionWoosh.play()
            anime({
                targets: ".preview-screen",
                right: ["0%", "100%"],
                duration: 1000,
                easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                complete: ()=> {
                    ZSX.Variables.Music.Welcome.fade(0.01, 0.03, 1000)
                    ZSX.Variables.SFX.TransitionWoosh.play()
                    anime({
                        targets: ".configuration-screen",
                        top: ["100%", "0%"],
                        duration: 1000,
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        complete: ()=> {
                            ZSX.Variables.Active.Configurator.Active = true
                            if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Preview", state: false}))
                        }
                    })
                }
            })
        } else if (!state) {
            ZSX.Variables.Active.Preview = false
            ZSX.Variables.SFX.TransitionWoosh.play()
            anime({
                targets: ".preview-screen",
                right: ["0%", "100%"],
                duration: 1000,
                easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
            })
        }
    }

ZSX.Functions.Configuration = {}

    ZSX.Functions.Configuration.Initialize = async()=> {
        await sleep(2000)
        ZSX.Variables.SFX.TransitionWoosh.play()
        ZSX.Variables.Music.Welcome.fade(0.01, 0.03, 1000)
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Configuration", state: true}))
        anime({
            targets: ".configuration-screen",
            top: ["100%", "0%"],
            duration: 1000,
            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
        })
    }

ZSX.Functions.Configuration.Handlers = {}

    ZSX.Functions.Configuration.Handlers.Select = (element, type, data)=> {
        if (element == "notify") {
            if (type == "type") {
                if (data != ZSX.Variables.Components.Notify["type"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    anime({
                        targets: `.notify_${ZSX.Variables.Components.Notify["type"]}`,
                        opacity: [1,0],
                        left: ["0%", "-30%"],
                        duration: 1200,
                        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        complete: async()=> {
                            ZSX.Variables.Components.Notify["type"] = data
                            $(".notify_append").css({opacity: 0})
                            $(".notify_append").html(ZSX.Variables.Content.Selectors.Notify[data])
                            if (data != "classic") {
                                var parent = $(`.notify_${ZSX.Variables.Components.Notify["type"]}`)
                                var header = parent.find(".header-box-content")
                                parent.addClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
                                header.addClass(`notify-content-${ZSX.Variables.Components.Notify["text-align"]}`)
                            } else if (data == "classic") {
                                var parent = $(`.notify_classic`)
                                parent.addClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
                            }
                            await sleep(300)
                            $(".notify_append").animate({opacity: 1}, 300)
                            ZSX.Variables.SFX.TransitionWelcome.play()
                            anime({
                                targets: `.notify_${ZSX.Variables.Components.Notify["type"]}`,
                                opacity: [0, 1],
                                left: ["30%", "0%"],
                                duration: 1200,
                                easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                            })
                        }
                    })
                } else if (data == ZSX.Variables.Components.Notify["type"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }
            if (type == "animation") {
                if (data != ZSX.Variables.Components.Notify["animation"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    if (data == "cubicBezier(0.075, 0.82, 0.165, 1)") {
                        anime({
                            targets: `.notify_${ZSX.Variables.Components.Notify["type"]}`,
                            opacity: [0, 1],
                            left: ["50%", "0%"],
                            duration: 1200,
                            easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        })
                        ZSX.Variables.Components.Notify["animation"] = "cubicBezier(0.075, 0.82, 0.165, 1)"
                    } else if (data == "easeInOutCubic") {
                        anime({
                            targets: `.notify_${ZSX.Variables.Components.Notify["type"]}`,
                            left: ["50%", "0%"],
                            opacity: [0, 1],
                            duration: 1200,
                            easing: "easeInOutCubic",
                        })
                        ZSX.Variables.Components.Notify["animation"] = "easeInOutCubic"
                    } else if (data == "linear") {
                        anime({
                            targets: `.notify_${ZSX.Variables.Components.Notify["type"]}`,
                            left: ["50%", "0%"],
                            opacity: [0, 1],
                            duration: 1200,
                            easing: "linear",
                        })
                        ZSX.Variables.Components.Notify["animation"] = "linear"
                    }
                } else if (data == ZSX.Variables.Components.Notify["animation"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            } else if (type == "textalign") {
                if (data != ZSX.Variables.Components.Notify["text-align"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    if (ZSX.Variables.Components.Notify["type"] != "classic") {
                        var parent = $(`.notify_${ZSX.Variables.Components.Notify["type"]}`)
                        var header = parent.find(".header-box-content")
                        parent.removeClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
                        header.removeClass(`notify-content-${ZSX.Variables.Components.Notify["text-align"]}`)
                        parent.addClass(`notify-text-${data}`)
                        header.addClass(`notify-content-${data}`)
                        ZSX.Variables.Components.Notify["text-align"] = data
                    } else if (ZSX.Variables.Components.Notify["type"] == "classic") {
                        var parent = $('.notify_classic')
                        parent.removeClass(`notify-text-${ZSX.Variables.Components.Notify["text-align"]}`)
                        parent.addClass(`notify-text-${data}`)
                        ZSX.Variables.Components.Notify["text-align"] = data
                    }
                } else if (data == ZSX.Variables.Components.Notify["text-align"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }   
        } else if (element == "hud") {
            if (type == "hud-selector") {
                if (data != ZSX.Variables.Components.Hud["type"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    anime({
                        targets: `.hud_${ZSX.Variables.Components.Hud["type"]}`,
                        left: ["0%", "-30%"],
                        opacity: [1,0],
                        duration: 800,
                        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        complete: async()=> {
                            $(".hud_append").css({opacity: 0})
                            await sleep(300)
                            ZSX.Variables.SFX.TransitionWelcome.play()
                            ZSX.Variables.Components.Hud["type"] = data
                            $(".hud_append").html(ZSX.Variables.Content.Selectors.Hud[data])
                            if (data == "circle") {
                                var formula = ($(window).width() * 8)/100
                                var circleRadius = formula * 0.45
                                var circleDashArray = (2 * Math.PI * circleRadius)
                                var percent = 100
                                var circleDashOffset = (percent*circleDashArray/100) - circleDashArray
                                $(".hud_circle_progress").css({
                                    "stroke-dasharray": circleDashArray,
                                    "stroke-dashoffset": circleDashOffset
                                })
                            }
                            $(".hud_append").animate({opacity: 1}, 600)
                            anime({
                                targets: `.hud_${ZSX.Variables.Components.Hud["type"]}`,
                                left: ["30%", "0%"],
                                opacity: [0, 1],
                                duration: 800,
                                easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                            })
                        }
                    })
                } else if (data == ZSX.Variables.Components.Hud["type"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }
        } else if (element == "progress") {
            if (type == "type") {
                if (data != ZSX.Variables.Components.Progress["type"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    anime({
                        targets: `.progress-bar_${ZSX.Variables.Components.Progress["type"]}`,
                        opacity: [1,0],
                        left: ["0%", "-30%"],
                        duration: 1200,
                        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        complete: async()=> {
                            ZSX.Variables.Components.Progress["type"] = data
                            $(".progress_append").css({opacity: 0})
                            $(".progress_append").html(ZSX.Variables.Content.Selectors.ProgressBar[data])
                            await sleep(300)
                            $(".progress_append").animate({opacity: 1}, 300)
                            ZSX.Variables.SFX.TransitionWelcome.play()
                            anime({
                                targets: `.progress-bar_${ZSX.Variables.Components.Progress["type"]}`,
                                opacity: [0, 1],
                                left: ["30%", "0%"],
                                duration: 1200,
                                easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                            })
                        }
                    })
                } else if (data == ZSX.Variables.Components.Progress["type"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }
        } else if (element == "displayer") {
            if (type == "type") {
                if (data != ZSX.Variables.Components.Displayers["type"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    anime({
                        targets: `.displayer-content_${ZSX.Variables.Components.Displayers["type"]}`,
                        opacity: [1,0],
                        left: ["0%", "-30%"],
                        duration: 1200,
                        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        complete: async()=> {
                            ZSX.Variables.Components.Displayers["type"] = data
                            $(".displayers_append").css({opacity: 0})
                            $(".displayers_append").html(ZSX.Variables.Content.Selectors.Displayers[data])
                            await sleep(300)
                            $(".displayers_append").animate({opacity: 1}, 300)
                            ZSX.Variables.SFX.TransitionWelcome.play()
                            anime({
                                targets: `.displayer-content_${ZSX.Variables.Components.Displayers["type"]}`,
                                opacity: [0, 1],
                                left: ["30%", "0%"],
                                duration: 1200,
                                easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                            })
                        }
                    })
                } if (data == ZSX.Variables.Components.Displayers["type"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }
        } else if (element == "carhud") {
            if (type == "type") {
                if (data != ZSX.Variables.Components.CarHud["type"]) {
                    ZSX.Variables.SFX.TranstitionSelector.play()
                    ZSX.Variables.SFX.TransitionWelcome.play()
                    anime({
                        targets: `.carhud-content_${ZSX.Variables.Components.CarHud["type"]}`,
                        opacity: [1,0],
                        left: ["0%", "-30%"],
                        duration: 1200,
                        easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                        complete: async()=> {
                            ZSX.Variables.Components.CarHud["type"] = data
                            $(".carhud_append").css({opacity: 0})
                            $(".carhud_append").html(ZSX.Variables.Content.Selectors.CarHud[data])
                            await sleep(300)
                            $(".carhud_append").animate({opacity: 1}, 300)
                            ZSX.Variables.SFX.TransitionWelcome.play()
                            anime({
                                targets: `.carhud-content_${ZSX.Variables.Components.CarHud["type"]}`,
                                opacity: [0, 1],
                                left: ["30%", "0%"],
                                duration: 1200,
                                easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
                            })
                        }
                    })
                } if (data == ZSX.Variables.Components.CarHud["type"]) {
                    ZSX.Variables.SFX.TranstitionSelectorError.play()
                }
            }
        }
    }

    ZSX.Functions.Configuration.Handlers.HelpNotify = (element, state)=> {
        if (state) {
            ZSX.Variables.Configurator.HelpNotifyShown = true
            var helpPosition = ZSX.getOffset(element)
            $(".info-container").css({left: helpPosition.left, top: helpPosition.top - 50})
            $(".info-container").html($(element).data("info"))
            $(".info-container").stop().animate({opacity: 0.9})
        } else if (!state) {
            $(".info-container").stop().animate({opacity: 0}, ()=> {
                ZSX.Variables.Configurator.HelpNotifyShown = false
            })
        }
    }

    ZSX.Functions.Configuration.Handlers.NextStep = ()=> {
        ZSX.Variables.SFX.TransitionSheesh.play()
        var elements = $('.configurator-setup')
        anime({
            targets: elements[ZSX.Variables.Iterators.StepCounterCurrent],
            left: ["0%", "-100%"],
            easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
            duration: 1500,
        })
        ZSX.Variables.Iterators.StepCounterCurrent++
        anime({
            targets: elements[ZSX.Variables.Iterators.StepCounterCurrent],
            left: ["100%", "0%"],
            easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
            duration: 1000,
        })
    }

    ZSX.Functions.Configuration.Handlers.PreviousStep = ()=> {
        ZSX.Variables.SFX.TransitionSheesh.play()
        var elements = $('.configurator-setup')
        anime({
            targets: elements[ZSX.Variables.Iterators.StepCounterCurrent],
            left: ["0%", "100%"],
            easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
            duration: 1000,
        })
        ZSX.Variables.Iterators.StepCounterCurrent--
        anime({
            targets: elements[ZSX.Variables.Iterators.StepCounterCurrent],
            left: ["-100%", "0%"],
            easing: "cubicBezier(0.075, 0.82, 0.165, 1)",
            duration: 1500,
        })
    }

    ZSX.Functions.Configuration.Handlers.CheckboxPreview = async (json)=> {
        if (json.type == "hud") {
            if (json.value == "animation") {
                if (json.checked) {
                    $('.configuration_hud-component-progress').css({animation: "anim 5s infinite"})
                } else if (!json.checked) {
                    $('.configuration_hud-component-progress').css({animation: "0"})
                }
                ZSX.Variables.Components.Hud["use-animation"] = !ZSX.Variables.Components.Hud["use-animation"]
            } if (json.value == "strokeicon") {
                if (json.checked) {
                    $(".configuration_hud-component-icon svg").css({"stroke-width": "0.7vw"})
                } else if (!json.checked) {
                    $(".configuration_hud-component-icon svg").css({"stroke-width": 0})
                }
                ZSX.Variables.Components.Hud["icon-stroke"] = !ZSX.Variables.Components.Hud["icon-stroke"]
            }
        }
    }

    ZSX.Functions.Configuration.End = async()=> {
        ZSX.Variables.CfgToJs.MulticharacterInitialized ? ZSX.Functions.Game.OpenAfterConfigWithoutInterface(true) : ZSX.Functions.Game.OpenAfterConfig(true)
        if (!debug && !ZSX.Variables.CfgToJs.MulticharacterInitialized) $.post(`https://${GetParentResourceName()}/focus`, JSON.stringify({state: false}))
        $('.logo-info').html('Storing items to database')
        ZSX.Variables.Game.Components["hud"].type = ZSX.Variables.Components.Hud["type"]
        ZSX.Variables.Game.Components["hud"].alignment = ZSX.Variables.Components.Hud["alignment"]
        ZSX.Storage.Setters.Hud(ZSX.Variables.Game.Components["hud"])
        ZSX.Storage.Setters.Notify(ZSX.Variables.Game.Components["notify"])
        ZSX.Storage.Setters.Progress(ZSX.Variables.Game.Components["progress"])
        ZSX.Storage.Setters.Displayers(ZSX.Variables.Game.Components["displayers"])
        ZSX.Storage.Setters.CarHud(ZSX.Variables.Game.Components["carhud"])
        ZSX.Storage.Setters.Theme($(":root").css("--motive"))
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdatePlayerSettings`, JSON.stringify({json: ZSX.Variables.Game.Components}))
        ZSX.Variables.Active.Preview = false
        ZSX.Variables.SFX.TransitionWoosh.play()
        ZSX.Variables.Music.Welcome.fade(0.03, 0.00, 600)
        anime({
            targets: ".preview-screen",
            top: ["0%", "100%"],
            duration: 1000,
            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
            complete: async()=> {
                if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Preview", state: false}))
                if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Configuration", state: false}))
                ZSX.Variables.Music.Welcome.seek(ZSX.Variables.Music.Timestamp[ZSX.Variables.Music.Welcome["_src"]])
                ZSX.Variables.Music.Welcome.fade(0.00, 0.08, 2000)
                await sleep(1000)
                $('.logo-info').html('Loading player data')
                await sleep(1351)
                $('.logo-info').html('Cleaning up')
                await sleep(1000)
                $('.logo-info').html('READY')
                await sleep(3000)
                ZSX.Variables.Music.Welcome.fade(0.05, 0.00, 3000)
                ZSX.Variables.SFX.Enter.play()
                $('.logo-screen-box').animate({opacity: 0}, 200,()=> {
                    anime({
                        targets: ".logo-screen",
                        left: ["0%", "-100%"],
                        duration: 1000,
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        complete: async()=> {
                            $.post(`https://${GetParentResourceName()}/focus`, JSON.stringify({state: false}))
                            await sleep(2000)
                            ZSX.Variables.Active.Game = true
                            if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "Game", state: true}))                          
                        }
                    })
                })
            }
        })
    }

ZSX.Functions.Game = {}

    ZSX.Functions.Game.ShowUI = ()=> {
        $(".hud-game_append").animate({opacity: 1}, 200)
        ZSX.Variables.Game.Components['hud']["visible"] = true
        $(".notify-game_append").animate({opacity: 1}, 200)
        ZSX.Variables.Game.Components['notify']["visible"] = true
        $(".progress-game_append").animate({opacity: 1}, 200)
        ZSX.Variables.Game.Components['progress']["visible"] = true
        $(".displayers-game_append").animate({opacity: 1}, 200)
        ZSX.Variables.Game.Components['displayers']["visible"] = true
        if (ZSX.Variables.Game.Components['carhud'].active && ZSX.Variables.CfgToJs.Creator['CarHud']) {
            $(".carhud-game_append").animate({opacity: 0.92}, 200)
        }
        ZSX.Variables.Game.Components['carhud']["visible"] = true
        
        ZSX.Variables.Game.UI_Visibile = true
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "UIState", state: true}))
    }

    ZSX.Functions.Game.HideUI = ()=> {
        $(".hud-game_append").animate({opacity: 0}, 200)
        ZSX.Variables.Game.Components['hud']["visible"] = false
        $(".notify-game_append").animate({opacity: 0}, 200)
        ZSX.Variables.Game.Components['notify']["visible"] = false
        $(".progress-game_append").animate({opacity: 0}, 200)
        ZSX.Variables.Game.Components['progress']["visible"] = false
        $(".displayers-game_append").animate({opacity: 0}, 200)
        ZSX.Variables.Game.Components['displayers']["visible"] = false
        $(".carhud-game_append").animate({opacity: 0}, 200)
        ZSX.Variables.Game.UI_Visibile = false
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "UIState", state: false}))
    }

    ZSX.Functions.Game.HideUI_Dev = state=> {
        if (state) {
            $(".hud-game_append").animate({opacity: 0}, 200)
            ZSX.Variables.Game.Components['hud']["visible"] = false
            $(".notify-game_append").animate({opacity: 0}, 200)
            ZSX.Variables.Game.Components['notify']["visible"] = false
            $(".progress-game_append").animate({opacity: 0}, 200)
            ZSX.Variables.Game.Components['progress']["visible"] = false
            $(".displayers-game_append").animate({opacity: 0}, 200)
            ZSX.Variables.Game.Components['displayers']["visible"] = false
            $(".carhud-game_append").animate({opacity: 0}, 200)
            ZSX.Variables.Game.UI_Visibile = false
        } else {
            $(".hud-game_append").animate({opacity: 1}, 200)
            ZSX.Variables.Game.Components['hud']["visible"] = true
            $(".notify-game_append").animate({opacity: 1}, 200)
            ZSX.Variables.Game.Components['notify']["visible"] = true
            $(".progress-game_append").animate({opacity: 1}, 200)
            ZSX.Variables.Game.Components['progress']["visible"] = true
            $(".displayers-game_append").animate({opacity: 1}, 200)
            ZSX.Variables.Game.Components['displayers']["visible"] = true
            if (ZSX.Variables.Game.Components['carhud'].active && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $(".carhud-game_append").animate({opacity: 0.92}, 200)
            }
            
            ZSX.Variables.Game.UI_Visibile = true
        }
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdateState`, JSON.stringify({element: "ForcedHide", state: state}))
        
    }

    ZSX.Functions.Game.CloseComponent = (data)=> {
        console.log(data.component)
        if (data) {
            if (ZSX.Variables.Game.Components[data.component.toLowerCase()]["visible"]) {
                $(`.${data.component.toLowerCase()}-game_append`).animate({opacity: 0}, 200)
                ZSX.Variables.Game.Components[data.component.toLowerCase()]["visible"] = false
            }
        }
    }

    ZSX.Functions.Game.OpenComponent = (data)=> {
        if (data) {
            if (!ZSX.Variables.Game.Components[data.component.toLowerCase()]["visible"]) {
                $(`.${data.component.toLowerCase()}`).animate({opacity: 1}, 200)
                ZSX.Variables.Game.Components[data.component.toLowerCase()]["visible"] = true
            }
        }
    }

    ZSX.Functions.Game.Menu = {}

    ZSX.Functions.Game.Notify = {}
        
        ZSX.Functions.Game.Notify.Add = async(data)=> {
            ZSX.Variables.SFX.NotifyEnter.play()
            ZSX.Variables.Game.Components["notify"].lengthTable++
            ZSX.Variables.Listener.Notify.Icon  = data.icon
            ZSX.Variables.Listener.Notify.Header = data.header
            ZSX.Variables.Listener.Notify.Text  = data.text
            ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()               
            $(ZSX.Variables.Game.Notify[ZSX.Variables.Game.Components["notify"]["type"]])
            .prependTo(".notify-game_append")
            .animate({opacity: 1}, ZSX.Variables.Game.Components["notify"]["easing"])
            .delay(data.time)
            .animate({opacity: 0, left: "-20%"}, ZSX.Variables.Game.Components["notify"]["easing"])
            .queue(function() {
                ZSX.Variables.Game.Components["notify"].lengthTable--
                $(this).remove();
                $(this).dequeue();
            })
        }

        ZSX.Functions.Game.Notify.Menu = (el)=> {
            if (el == "notify") {
                ZSX.Variables.Game.Components["notify"].lengthTable = 0
                ZSX.Variables.Listener.Notify.Header = "Test"
                ZSX.Variables.Listener.Notify.Text  = "Test notification inside menu."
                ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()                
                $(".notify-game_append").html(ZSX.Variables.Game.Notify[ZSX.Variables.Game.Components["notify"]["type"]])
                $(".notify-game_append").find(`.notify_${ZSX.Variables.Game.Components["notify"]["type"]}`).css({opacity: 1})
            } else if (el != "notify") {
                $(".notify-game_append").find(`.notify_${ZSX.Variables.Game.Components["notify"]["type"]}`).animate({opacity: 0}, ()=> {
                    $(".notify-game_append").find(`.notify_${ZSX.Variables.Game.Components["notify"]["type"]}`).remove()
                })
            }
        }

    ZSX.Functions.Game.Progress = {}

        ZSX.Functions.Game.Progress.Init = (data)=> {
            if (!ZSX.Variables.Active.Progress && !ZSX.Variables.Active.GameMenu) {
                ZSX.Variables.SFX.ProgressEnter.play()
                ZSX.Variables.Active.Progress = true
                ZSX.Variables.Listener.Progress.Text = data.text
                ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()    
                $(".progress-game_append").html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Game.Components["progress"]["type"]])   
                var progressContainer = $('.progress-game_append').find(`.progress-bar_${ZSX.Variables.Game.Components["progress"].type}`)
                progressContainer.animate({opacity: 1}, 300)
                anime({
                    targets: '.progress-value',
                    width: ["0%", "100%"],
                    duration: data.time,
                    easing: 'linear',
                    complete: async()=> {
                        await sleep(200)
                        if (!ZSX.Variables.Active.Progress) return
                        progressContainer.animate({opacity: 0}, 300, ()=> {
                            ZSX.Variables.Active.Progress = false
                        })
                    }
                })
            } else if (!ZSX.Variables.Active.Progress && ZSX.Variables.Active.GameMenu) {
                ZSX.WaitCondition(() => !ZSX.Variables.Active.Progress && !ZSX.Variables.Active.GameMenu)
                .then(()=> {
                    ZSX.Variables.SFX.ProgressEnter.play()
                    ZSX.Variables.Active.Progress = true
                    ZSX.Variables.Listener.Progress.Text = data.text
                    ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()    
                    $(".progress-game_append").html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Game.Components["progress"]["type"]])   
                    var progressContainer = $('.progress-game_append').find(`.progress-bar_${ZSX.Variables.Game.Components["progress"].type}`)
                    progressContainer.animate({opacity: 1}, 300)
                    anime({
                        targets: '.progress-value',
                        width: ["0%", "100%"],
                        duration: data.time,
                        easing: 'linear',
                        complete: async()=> {
                            await sleep(200)
                            progressContainer.animate({opacity: 0}, 300, ()=> {
                                ZSX.Variables.Active.Progress = false
                            })
                        }
                    })
                })
            }
        }

        ZSX.Functions.Game.Progress.Cancel = ()=> {
            if (ZSX.Variables.Active.Progress) {
                var progressContainer = $('.progress-game_append').find(`.progress-bar_${ZSX.Variables.Game.Components["progress"].type}`)
                progressContainer.animate({opacity: 0}, 300)
                ZSX.Variables.Active.Progress = false
            }
        }

        ZSX.Functions.Game.Progress.Menu = (el)=> {
            if (el == "progress") {
                ZSX.Variables.Listener.Progress.Text = "Test progress bar"
                ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()                
                $(".progress-game_append").html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Game.Components["progress"]["type"]])
                $(".progress-game_append").find(`.progress-bar_${ZSX.Variables.Game.Components["progress"]["type"]}`).animate({opacity: 1})
            } else if (el != "progress") {
                $(".progress-game_append").find(`.progress-bar_${ZSX.Variables.Game.Components["progress"]["type"]}`).animate({opacity: 0}, ()=> {
                    $(".progress-game_append").find(`.progress-bar_${ZSX.Variables.Game.Components["progress"]["type"]}`).remove()
                })
            }
        }

    ZSX.Functions.Game.Menu.Init = (state)=> {
        if (state && !ZSX.Variables.Active.GameMenuAnim) {
            ZSX.Functions.Game.Progress.Menu(ZSX.Variables.Active.GameMenuNavbar)
            ZSX.Functions.Game.Notify.Menu(ZSX.Variables.Active.GameMenuNavbar)
            ZSX.Functions.Game.CarHud.Menu(ZSX.Variables.Active.GameMenuNavbar)
            ZSX.Variables.Active.GameMenuAnim = true
            ZSX.Variables.SFX.TransitionWelcome.play()
            ZSX.Variables.Music.Welcome.fade(0.0, 0.01, 100)
            anime({
                targets: ".menu-screen",
                left: ["100%", "0%"],
                opacity: [0,1],
                scale: [0.8, 1],
                duration: 1000,
                easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                complete:()=> {
                    if (!debug) $.post(`https://${GetParentResourceName()}/focus`, JSON.stringify({state: true}))
                    ZSX.Variables.Active.GameMenu = true
                    ZSX.Variables.Active.GameMenuAnim = false
                }
            })
        } else if (!state && !ZSX.Variables.Active.GameMenuAnim) {
            if (!debug) $.post(`https://${GetParentResourceName()}/focus`, JSON.stringify({state: false}))
            ZSX.Functions.Game.Progress.Menu("none")
            ZSX.Functions.Game.Notify.Menu("none")
            ZSX.Functions.Game.CarHud.Menu('none')
            ZSX.Variables.Active.GameMenuAnim = true
            ZSX.Variables.SFX.TransitionWoosh.play()
            ZSX.Variables.Music.Welcome.fade(0.01, 0.0, 100)
            anime({
                targets: ".menu-screen",
                scale: [1, 0.8],
                left: ["0%", "100%" ],
                opacity: [1,0],
                duration: 1000,
                easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                complete:()=> {
                    ZSX.Variables.Active.GameMenu = false
                    ZSX.Variables.Active.GameMenuAnim = false
                }
            })
        }
    }
    
    ZSX.Functions.Game.Menu.Handlers = {}

        ZSX.Functions.Game.Menu.Handlers.Navbar = (target)=> {
            var data = target.data("element")
            if (ZSX.Variables.Active.GameMenuNavbar != data) {
                if (data == "theme") {
                    if (!ZSX.Variables.Active.GameMenuNavbarAnim) {
                        ZSX.Functions.Game.Menu.Handlers.Addon.ForceClose()
                        ZSX.Variables.Active.GameMenuNavbarAnim = true
                        ZSX.Variables.SFX.TransitionWoosh.play()
                        anime({
                            targets: `.menu-game-content-${ZSX.Variables.Active.GameMenuNavbar}`,
                            left: ["0%", "-110%"],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(".game-menu-header").html(ZSX.Variables.Game.Translations.Theme)
                                $(".game-menu-type").html(ZSX.Variables.Game.Translations.Picker)
                            }
                        })
                        anime({
                            targets: `.game-menu-headerbox`,
                            right: ["-2vw", "8vw"],
                            opacity: [1,0],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(".game-menu-header").html(ZSX.Variables.Game.Translations.Theme)
                                $(".game-menu-type").html(ZSX.Variables.Game.Translations.Picker)
                                $(".game-menu-headerbox").css({right: "-2vw"}).animate({opacity: 1})
                                ZSX.Functions.Game.Notify.Menu(data)
                                ZSX.Functions.Game.Progress.Menu(data)
                                ZSX.Functions.Game.CarHud.Menu(data)
                            }
                        })
                        anime({
                            targets: `.menu-game-content-${data}`,
                            left: ["110%", "0%"],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                ZSX.Variables.Active.GameMenuNavbarAnim = false
                            }
                        })
                        ZSX.Variables.Active.GameMenuNavbar = data
                    }
                } else if (data != "theme") {
                    if (!ZSX.Variables.Active.GameMenuNavbarAnim) {
                        ZSX.Functions.Game.Menu.Handlers.Addon.ForceClose()
                        ZSX.Variables.Active.GameMenuNavbarAnim = true
                        ZSX.Variables.SFX.TransitionWoosh.play()
                        anime({
                            targets: `.menu-game-content-${ZSX.Variables.Active.GameMenuNavbar}`,
                            left: ["0%", "-110%"],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(".game-menu-header").html(ZSX.Variables.Game.Translations.NavbarData.Element[data])
                                $(".game-menu-type").html(ZSX.Variables.Game.Translations.NavbarData.ClassName[ZSX.Variables.Game.Components[data].type])
                            }
                        })
                        anime({
                            targets: `.game-menu-headerbox`,
                            right: ["-2vw", "8vw"],
                            opacity: [1,0],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(".game-menu-header").html(ZSX.Variables.Game.Translations.NavbarData.Element[data])
                                $(".game-menu-type").html(ZSX.Variables.Game.Translations.NavbarData.ClassName[ZSX.Variables.Game.Components[data].type])
                                $(".game-menu-headerbox").css({right: "-2vw"}).animate({opacity: 1})
                                ZSX.Functions.Game.Notify.Menu(data)
                                ZSX.Functions.Game.Progress.Menu(data)
                                ZSX.Functions.Game.CarHud.Menu(data)
                            }
                        })
                        anime({
                            targets: `.menu-game-content-${data}`,
                            left: ["110%", "0%"],
                            duration: 600,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                ZSX.Variables.Active.GameMenuNavbarAnim = false
                            }
                        })
                        ZSX.Variables.Active.GameMenuNavbar = data
                    }
                }
            }
        }

        ZSX.Functions.Game.Menu.Handlers.Button = (data)=> {
            if (data.type == "addon") {
                ZSX.Functions.Game.Menu.Handlers.Addon.Init(data)
            } else if (data.type == "reset") {
                if (data.content == "scale") {
                    $(`.${data.element}-game_append`).css({transform: "scale(1.0)"})
                    $(`.input_range-game-menu-${data.element}`).val(1.0)
                    ZSX.Variables.Game.Components[data.element].scale = 1
                } else if (data.content == "position") {
                    $(`.${data.element}-game_append`).css({inset: ""})
                    ZSX.Variables.Game.Components[data.element].position = null
                }
            }
        }

        ZSX.Functions.Game.Menu.Handlers.SelectGame = async(element, type, val)=> {
            if (element == "hud") {
                if (type == "selector") {
                    if (ZSX.Variables.Game.Components["hud"].type != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        anime({
                            targets: '.hud-game_append',
                            opacity: [1,0],
                            duration: 600,
                            easing: "easeInOutExpo",
                            complete: async ()=> {
                                $(".hud-game_append").css({opacity: 0})
                                ZSX.Variables.Game.Components["hud"].type = val
                                $(".hud-game_append").html(ZSX.Variables.Content.Complete.Hud[ZSX.Variables.Game.Components["hud"].type])
                                await $.map(ZSX.Variables.Game.Components["hud"].componentsVisible, (bool, index)=> {
                                    if (!bool) {
                                        $(".hud-game_append").find(`.hud-${index}`).css({display: "none"})
                                    }
                                })
                                $(".hud-game_append").animate({opacity: 1})
                            }
                        })
                    } else if (ZSX.Variables.Game.Components["hud"].type == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                } else if (type == "alignment") {
                    if (ZSX.Variables.Game.Components["hud"].alignment != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        ZSX.Variables.Game.Components["hud"].alignment = val
                        $(".hud-game_append").css({"flex-direction": val})
                    } else if (ZSX.Variables.Game.Components["hud"].alignment == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                }
            } else if (element == "notify") {
                if (type == "selector") {
                    if (ZSX.Variables.Game.Components["notify"].type != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        ZSX.Variables.Game.Components["notify"].type = val
                        ZSX.Functions.Game.Notify.Menu("notify")
                    } else if (ZSX.Variables.Game.Components["notify"].type == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                } else if (type == "anim") {
                    if (ZSX.Variables.Game.Components["notify"].easing != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        ZSX.Variables.Game.Components["notify"].easing = val
                        ZSX.Functions.Game.Notify.Menu("notify")
                    } else if (ZSX.Variables.Game.Components["notify"].easing == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                } else if (type == "alignment") {
                    if (ZSX.Variables.Game.Components["notify"]["text-align"] != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        ZSX.Variables.Game.Components["notify"]["text-align"] = val
                        ZSX.Functions.Game.Notify.Menu("notify")
                    } else if (ZSX.Variables.Game.Components["notify"]["text-align"] == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                }
            } else if (element == "displayers") {
                if (type == "selector") {
                    if (ZSX.Variables.Game.Components["displayers"].type != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        anime({
                            targets: '.displayers-game_append',
                            opacity: [1,0],
                            duration: 600,
                            easing: "easeInOutExpo",
                            complete: ()=> {
                                $(".displayers-game_append").css({opacity: 0})
                                ZSX.Variables.Game.Components["displayers"].type = val
                                $(".displayers-game_append").html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Game.Components["displayers"].type])
                                $(".displayers-game_append").animate({opacity: 1})
                            }
                        })
                    } else if (ZSX.Variables.Game.Components["displayers"].type == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                }
            } else if (element == "progress") {
                if (type == "selector") {
                    if (ZSX.Variables.Game.Components["progress"].type != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        ZSX.Variables.Game.Components["progress"].type = val
                        ZSX.Functions.Game.Progress.Menu("progress")
                    } else if (ZSX.Variables.Game.Components["progress"].type == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                }
            } else if (element == "carhud") {
                if (type == "selector") {
                    if (ZSX.Variables.Game.Components["carhud"].type != val) {
                        ZSX.Variables.SFX.TranstitionSelector.play()
                        $('.carhud-game_append').animate({opacity: 0}, e=> {
                            $('.carhud-game_append').html(ZSX.Variables.Content.Complete.CarHud[val])
                            ZSX.Variables.Game.Components["carhud"].type = val
                            if (ZSX.Variables.Game.Components['carhud']["seatbelt"]) {
                                ZSX.Functions.Game.CarHud.Seatbelt(true)
                            }
                            $('.carhud-game_append').animate({opacity: 0.92})
                        })
                        ZSX.Functions.Game.CarHud.Menu("carhud")
                    } else if (ZSX.Variables.Game.Components["carhud"].type == val) {
                        ZSX.Variables.SFX.TranstitionSelectorError.play()
                    }
                }
            }
            
            $(".game-menu-header").html(ZSX.Variables.Game.Translations.NavbarData.Element[element])
            $(".game-menu-type").html(ZSX.Variables.Game.Translations.NavbarData.ClassName[val])
            await sleep(1000)
            ZSX.Storage.Setters.Hud(ZSX.Variables.Game.Components["hud"])
            ZSX.Storage.Setters.Notify(ZSX.Variables.Game.Components["notify"])
            ZSX.Storage.Setters.Progress(ZSX.Variables.Game.Components["progress"])
            ZSX.Storage.Setters.Displayers(ZSX.Variables.Game.Components["displayers"])
            ZSX.Storage.Setters.CarHud(ZSX.Variables.Game.Components["carhud"])
            
            if (!debug) $.post(`https://${GetParentResourceName()}/UpdatePlayerSettings`, JSON.stringify({json: ZSX.Variables.Game.Components}))
        }

        ZSX.Functions.Game.Menu.Scale = (data)=> {
            if (data) {
                $(`.${data.element}-game_append`).css({transform: `scale(${data.val})`})
                ZSX.Variables.Game.Components[data.element].scale = data.val
                ZSX.Storage.Setters.Hud(ZSX.Variables.Game.Components["hud"])
                ZSX.Storage.Setters.Notify(ZSX.Variables.Game.Components["notify"])
                ZSX.Storage.Setters.Progress(ZSX.Variables.Game.Components["progress"])
                ZSX.Storage.Setters.Displayers(ZSX.Variables.Game.Components["displayers"])
                ZSX.Storage.Setters.CarHud(ZSX.Variables.Game.Components["carhud"])
            }
        }

        ZSX.Functions.Game.Menu.Handlers.Addon = {}

            ZSX.Functions.Game.Menu.Handlers.Addon.Init = (data)=> {
                if (!ZSX.Variables.Active.GameMenuAddon) {
                    $.map(ZSX.Variables.Game.Components["hud"].componentsVisible, (state, index) => {
                        if (state) {
                            $(`.game-addon-component-hud-${index}`).addClass("text-disabled")
                        }
                    })
                    $.map(ZSX.Variables.Game.Components["displayers"].componentsVisible, (state, index) => {
                        if (state) {
                            $(`.game-addon-component-displayers-${index}`).addClass("text-disabled")
                        }
                    })
                    ZSX.Variables.Active.GameMenuAddonOption = `${data.content}-${data.element}`
                    $(`.addon-content-${data.content}-${data.element}`).css({left: "0%"})
                    ZSX.Variables.Active.GameMenuAddon = true
                    ZSX.Variables.Active.GameMenuAddonAnim = true
                    ZSX.Variables.SFX.Preset.play()
                    anime({
                        targets: '.menu-addon-content',
                        left: ["calc(5% + 17vw)", "calc(7% + 17vw)"],
                        opacity: [0,1],
                        duration: 400,
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        complete: ()=> {
                            ZSX.Variables.Active.GameMenuAddonAnim  = false
                        }
                    })
                } else if (ZSX.Variables.Active.GameMenuAddon) {
                    if (ZSX.Variables.Active.GameMenuAddonOption == `${data.content}-${data.element}`) {
                        ZSX.Variables.Active.GameMenuAddon = false
                        ZSX.Variables.Active.GameMenuAddonAnim  = true
                        ZSX.Variables.SFX.Preset.play()
                        anime({
                            targets: '.menu-addon-content',
                            left: ["calc(7% + 17vw)", "calc(5% + 17vw)"],
                            opacity: [1,0],
                            duration: 400,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(`.addon-content-${ZSX.Variables.Active.GameMenuAddonOption}`).css({left: "100%"})
                                ZSX.Variables.Active.GameMenuAddonAnim  = false
                            }
                        })
                    } else if (ZSX.Variables.Active.GameMenuAddonOption == `${data.content}-${data.element}`) {
                        ZSX.Variables.Active.GameMenuAddon = false
                        ZSX.Variables.Active.GameMenuAddonAnim  = true
                        ZSX.Variables.SFX.Preset.play()
                        anime({
                            targets: '.menu-addon-content',
                            left: ["calc(7% + 17vw)", "calc(5% + 17vw)"],
                            opacity: [1,0],
                            duration: 400,
                            easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                            complete: ()=> {
                                $(`.addon-content-${ZSX.Variables.Active.GameMenuAddonOption}`).css({left: "100%"})
                                ZSX.Variables.SFX.Preset.play()
                                ZSX.Variables.Active.GameMenuAddonOption = `${data.content}-${data.element}`
                                $(`.addon-content-${data.content}-${data.element}`).css({left: "0%"})
                                anime({
                                    targets: '.menu-addon-content',
                                    left: ["calc(5% + 17vw)", "calc(7% + 17vw)"],
                                    opacity: [0,1],
                                    duration: 400,
                                    easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                                    complete: ()=> {
                                        ZSX.Variables.Active.GameMenuAddonAnim  = false
                                    }
                                })
                            }
                        })
                    } 
                }
            }

            ZSX.Functions.Game.Menu.Handlers.Addon.ForceClose = ()=> {
                if (ZSX.Variables.Active.GameMenuAddon) {
                    ZSX.Variables.Active.GameMenuAddon = false
                    ZSX.Variables.Active.GameMenuAddonAnim  = true
                    ZSX.Variables.SFX.Preset.play()
                    anime({
                        targets: '.menu-addon-content',
                        left: ["calc(7% + 17vw)", "calc(5% + 17vw)"],
                        opacity: [1,0],
                        duration: 400,
                        easing: "cubicBezier(1.000, -0.005, 0.000, 1.000)",
                        complete: ()=> {
                            $(`.addon-content-${ZSX.Variables.Active.GameMenuAddonOption}`).css({left: "100%"})
                            ZSX.Variables.Active.GameMenuAddonAnim  = false
                        }
                    })
                }
            }

            ZSX.Functions.Game.Menu.Handlers.Addon.HudComponent = (target, data)=> {
                ZSX.Variables.SFX.ClickPreset.play()
                if (ZSX.Variables.Game.Components["hud"].componentsVisible[data]) {
                    ZSX.Variables.Game.Components["hud"].componentsVisible[data] = false
                    target.addClass("text-disabled")
                    $(`.hud-${data}`).stop().animate({opacity: 0}, 300, ()=> {
                        $(`.hud-${data}`).css({display: "none"})
                    })
                } else if (!ZSX.Variables.Game.Components["hud"].componentsVisible[data]) {
                    ZSX.Variables.Game.Components["hud"].componentsVisible[data] = true
                    target.removeClass("text-disabled")
                    $(`.hud-${data}`).css({display: "flex"})
                    $(`.hud-${data}`).stop().animate({opacity: 1}, 300)
                }
            }

            ZSX.Functions.Game.Menu.Handlers.Addon.DisplayerComponent = (target, data)=> {
                ZSX.Variables.SFX.ClickPreset.play()
                if (ZSX.Variables.Game.Components["displayers"].componentsVisible[data]) {
                    ZSX.Variables.Game.Components["displayers"].componentsVisible[data] = false
                    target.addClass("text-disabled")
                    $(`.displayer-${data}`).stop().animate({opacity: 0}, 300, ()=> {
                        $(`.displayer-${data}`).css({display: "none"})
                    })
                } else if (!ZSX.Variables.Game.Components["displayers"].componentsVisible[data]) {
                    ZSX.Variables.Game.Components["displayers"].componentsVisible[data] = true
                    target.removeClass("text-disabled")
                    $(`.displayer-${data}`).css({display: "flex"})
                    $(`.displayer-${data}`).stop().animate({opacity: 1}, 300)
                }
            }

    ZSX.Functions.Game.ApplySettings = (state)=> {
        var hudContainer = $(".hud-game_append")
            notifyContainer = $(".notify-game_append")
            progressContainer = $(".progress-game_append")
            displayersContainer = $(".displayers-game_append")
            carhudContainer = $(".carhud-game_append")

        if (state) {
            ZSX.Variables.Game.Components["hud"].scale          = ZSX.Variables.Preview.Component.Scale["Hud"]
            ZSX.Variables.Game.Components["notify"].scale       = ZSX.Variables.Preview.Component.Scale["Notify"]
            ZSX.Variables.Game.Components["displayers"].scale   = ZSX.Variables.Preview.Component.Scale["Displayers"]
            ZSX.Variables.Game.Components["progress"].scale     = ZSX.Variables.Preview.Component.Scale["Progress"]
            ZSX.Variables.Game.Components["carhud"].scale       = ZSX.Variables.Preview.Component.Scale["CarHud"]
        }

        if (ZSX.Variables.CfgToJs.Creator['Hud']) hudContainer.css({inset: ZSX.Variables.Game.Components["hud"]["position"], transform: `scale(${ZSX.Variables.Game.Components["hud"]["scale"]})`, "flex-direction": ZSX.Variables.Game.Components["hud"]["alignment"]})
        if (ZSX.Variables.CfgToJs.Creator['Notify']) notifyContainer.css({inset: ZSX.Variables.Game.Components["notify"]["position"], transform: `scale(${ZSX.Variables.Game.Components["notify"]["scale"]})`})
        if (ZSX.Variables.CfgToJs.Creator['Progress']) progressContainer.css({inset: ZSX.Variables.Game.Components["progress"]["position"], transform: `scale(${ZSX.Variables.Game.Components["progress"]["scale"]})`})
        if (ZSX.Variables.CfgToJs.Creator['Displayers']) displayersContainer.css({inset: ZSX.Variables.Game.Components["displayers"]["position"], transform: `scale(${ZSX.Variables.Game.Components["displayers"]["scale"]})`})
        if (ZSX.Variables.CfgToJs.Creator['CarHud']) carhudContainer.css({inset: ZSX.Variables.Game.Components["carhud"]["position"], transform: `scale(${ZSX.Variables.Game.Components["carhud"]["scale"]})`})
        
        if (state) {
            ZSX.Variables.Game.Components["hud"]["type"]            = ZSX.Variables.Components.Hud["type"]
            ZSX.Variables.Game.Components["hud"]["alignment"]       = ZSX.Variables.Components.Hud["alignment"]
            ZSX.Variables.Game.Components["notify"]["type"]         = ZSX.Variables.Components.Notify["type"]
            ZSX.Variables.Game.Components["notify"]["text-align"]   = ZSX.Variables.Components.Notify["text-align"]
            ZSX.Variables.Game.Components["notify"]["easing"]       = ZSX.Variables.Components.Notify["animation"]
            ZSX.Variables.Game.Components["progress"]["type"]       = ZSX.Variables.Components.Progress["type"]
            ZSX.Variables.Game.Components["displayers"]["type"]     = ZSX.Variables.Components.Displayers["type"]
            ZSX.Variables.Game.Components["carhud"]["type"]         = ZSX.Variables.Components.CarHud["type"]
        }
        ZSX.Functions.Game.ShowUI()
    }

    ZSX.Functions.Game.Hud = {}

        ZSX.Functions.Game.Hud.Update = (data)=> {
            if (data.health < 0) data.health = 0
            if (data && ZSX.Variables.CfgToJs.Creator['Hud']) {
                if (ZSX.Variables.Game.Components["hud"].type == "basic" || ZSX.Variables.Game.Components["hud"].type == "diamond" || ZSX.Variables.Game.Components["hud"].type == "skew") {
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_health`).animate({height: data.health + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_armour`).animate({height: data.armour + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_hunger`).animate({height: data.hunger + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_thirst`).animate({height: data.thirst + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_stress`).animate({height: data.stress + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_stamina`).animate({height: data.stamina + "%"}, 100)
                    $(`.${ZSX.Variables.Game.Components["hud"].type}-value_oxygen`).animate({height: data.oxygen + "%"}, 100)
                } else if (ZSX.Variables.Game.Components["hud"].type == "svg") {
                    $('#svg-value_health').html(`<stop offset="${data.health}%" stop-color="var(--motive)"/> <stop offset="${data.health}%" stop-color="#141414"/>`)
                    $('#svg-value_armour').html(`<stop offset="${data.armour}%" stop-color="var(--motive)"/> <stop offset="${data.armour}%" stop-color="#141414"/>`)
                    $('#svg-value_hunger').html(`<stop offset="${data.hunger}%" stop-color="var(--motive)"/> <stop offset="${data.hunger}%" stop-color="#141414"/>`)
                    $('#svg-value_thirst').html(`<stop offset="${data.thirst}%" stop-color="var(--motive)"/> <stop offset="${data.thirst}%" stop-color="#141414"/>`)
                    $('#svg-value_stress').html(`<stop offset="${data.stress}%" stop-color="var(--motive)"/> <stop offset="${data.stress}%" stop-color="#141414"/>`)
                    $('#svg-value_stamina').html(`<stop offset="${data.stamina}%" stop-color="var(--motive)"/> <stop offset="${data.stamina}%" stop-color="#141414"/>`)
                    $('#svg-value_oxygen').html(`<stop offset="${data.oxygen}%" stop-color="var(--motive)"/> <stop offset="${data.oxygen}%" stop-color="#141414"/>`)                         
                } else if (ZSX.Variables.Game.Components["hud"].type == "icon-percent") {
                    $(".icon-value_health").html(Math.floor(data.health))
                    $(".icon-value_armour").html(Math.floor(data.armour))
                    $(".icon-value_hunger").html(Math.floor(data.hunger))
                    $(".icon-value_thirst").html(Math.floor(data.thirst))
                    $(".icon-value_stress").html(Math.floor(data.stress))
                    $(".icon-value_stamina").html(Math.floor(data.stamina))
                    $(".icon-value_oxygen").html(Math.floor(data.oxygen))
                    if (data.oxygen < 100) $(".icon-value_oxygen").animate({opacity: 1})
                    if (data.oxygen == 100) $(".icon-value_oxygen").animate({opacity: 0})
                    if (data.stamina < 100) $(".icon-value_stamina").animate({opacity: 1})
                    if (data.stamina == 100) $(".icon-value_stamina").animate({opacity: 0})
                } else if (ZSX.Variables.Game.Components["hud"].type == "square-progress") {
                    $(".square-value_health").css({width: data.health + "%"}, 100)
                    $(".square-value_armour").css({width: data.armour + "%"}, 100)
                    $(".square-value_hunger").css({width: data.hunger + "%"}, 100)
                    $(".square-value_thirst").css({width: data.thirst + "%"}, 100)
                    $(".square-value_stress").css({width: data.stress + "%"}, 100)
                    $(".square-value_stamina").css({width: data.stamina + "%"}, 100)
                    $(".square-value_oxygen").css({width: data.oxygen + "%"}, 100)
                } else if (ZSX.Variables.Game.Components["hud"].type == "circle") {
                    var ResponsiveSVG = {}
                    ResponsiveSVG.Values = {}
                    ResponsiveSVG.Values.Health = data.health
                    ResponsiveSVG.Values.Armour = data.armour
                    ResponsiveSVG.Values.Hunger = data.hunger
                    ResponsiveSVG.Values.Thirst = data.thirst
                    ResponsiveSVG.Values.Stress = data.stress
                    ResponsiveSVG.Values.Stamina = data.stamina
                    ResponsiveSVG.Values.Oxygen = data.oxygen
                    ResponsiveSVG.Content = {}
                    ResponsiveSVG.Content.Formula = ($(window).width() * 2.3)/100
                    ResponsiveSVG.Content.circleRadius = ResponsiveSVG.Content.Formula * 0.45
                    ResponsiveSVG.Content.circleDashArray = (2 * Math.PI * ResponsiveSVG.Content.circleRadius)
                    ResponsiveSVG.Content.circleDashOffsetHealth = (ResponsiveSVG.Values.Health * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetArmour = (ResponsiveSVG.Values.Armour * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetHunger = (ResponsiveSVG.Values.Hunger * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetThirst = (ResponsiveSVG.Values.Thirst * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetStress = (ResponsiveSVG.Values.Stress * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetStamina = (ResponsiveSVG.Values.Stamina * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    ResponsiveSVG.Content.circleDashOffsetOxygen = (ResponsiveSVG.Values.Oxygen * ResponsiveSVG.Content.circleDashArray/100) - ResponsiveSVG.Content.circleDashArray
                    $(".circle-value_health").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetHealth
                    })
                    $(".circle-value_armour").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetArmour
                    })
                    $(".circle-value_hunger").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetHunger
                    })
                    $(".circle-value_thirst").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetThirst
                    })
                    $(".circle-value_stress").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetStress
                    })
                    $(".circle-value_stamina").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetStamina
                    })
                    $(".circle-value_oxygen").css({
                        "stroke-dasharray": ResponsiveSVG.Content.circleDashArray,
                        "stroke-dashoffset": ResponsiveSVG.Content.circleDashOffsetOxygen
                    })
                } else if (ZSX.Variables.Game.Components["hud"].type == "hexagon") {
                    $('.hud-health-hexagon').find("stop:first").attr('offset', (100-data.health) + '%')
                    $('.hud-armour-hexagon').find("stop:first").attr('offset', (100-data.armour) + '%')
                    $('.hud-hunger-hexagon').find("stop:first").attr('offset', (100-data.hunger) + '%')
                    $('.hud-thirst-hexagon').find("stop:first").attr('offset', (100-data.thirst) + '%')
                    $('.hud-stress-hexagon').find("stop:first").attr('offset', (100-data.stress) + '%')
                    $('.hud-stamina-hexagon').find("stop:first").attr('offset', (100-data.stamina) + '%')
                    $('.hud-oxygen-hexagon').find("stop:first").attr('offset', (100-data.oxygen) + '%')
                }
                if (data.oxygen < 100) $('.hud-oxygen').animate({opacity: 1})
                if (data.oxygen == 100)$('.hud-oxygen').animate({opacity: 0})
                if (data.stamina < 100) $('.hud-stamina').animate({opacity: 1})
                if (data.stamina == 100) $('.hud-stamina').animate({opacity: 0})
                ZSX.Variables.Game.Components["hud"].status["health"] = data.health
                ZSX.Variables.Game.Components["hud"].status["armour"] = data.armour
                ZSX.Variables.Game.Components["hud"].status["hunger"] = data.hunger
                ZSX.Variables.Game.Components["hud"].status["thirst"] = data.thirst
                ZSX.Variables.Game.Components["hud"].status["stress"] = data.stress
                ZSX.Variables.Game.Components["hud"].status["stamina"] = data.stamina
                ZSX.Variables.Game.Components["hud"].status["oxygen"] = data.oxygen
            }
        }

    ZSX.Functions.Game.Displayers = {}

        ZSX.Functions.Game.Displayers.Update = (data)=> {
            if (data && ZSX.Variables.CfgToJs.Creator['Displayers']) {
                ZSX.Variables.Listener.Displayers.Job = data.job
                ZSX.Variables.Listener.Displayers.Cash = data.cash
                ZSX.Variables.Listener.Displayers.Bank = data.bank
                ZSX.Variables.Listener.Displayers.Identifier = data.identifier
                ZSX.Variables.Listener.Displayers.Online_Amount = data.online
                ZSX.Variables.Listener.Displayers.Online_Max = data.maxOnline
                ZSX.Functions.Preview.Handlers.ReUseTemplateLiterals()
                $(".displayers-game_append").html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Game.Components["displayers"].type])
            }
        }

    ZSX.Functions.Game.CarHud = {}

        ZSX.Functions.Game.CarHud.Init = state=> {
            if (state && ZSX.Variables.CfgToJs.Creator['CarHud'] && ZSX.Variables.Game.UI_Visibile) {
                $(".carhud-game_append").animate({opacity: 0.92}, 600)
                ZSX.Variables.Game.Components['carhud'].active = true
                $('.belt').css({opacity: 0.4, color: 'white'})
                ZSX.Variables.Game.Components['carhud'].seatbelt = false
            } else if (!state && ZSX.Variables.CfgToJs.Creator['CarHud'] && ZSX.Variables.Game.UI_Visibile) {
                $(".carhud-game_append").animate({opacity: 0}, 600)
                ZSX.Variables.Game.Components['carhud'].active = false
                $('.belt').css({opacity: 0.4, color: 'white'})
                ZSX.Variables.Game.Components['carhud'].seatbelt = false
            }
        }

        ZSX.Functions.Game.CarHud.Seatbelt = state=> {
            if (state && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $('.belt').css({opacity: 1, color: 'var(--motive)'})
                ZSX.Variables.Game.Components['carhud'].seatbelt = true
                ZSX.Variables.SFX.BeltOn.play()
            } else if (!state && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $('.belt').css({opacity: 0.4, color: 'white'})
                ZSX.Variables.Game.Components['carhud'].seatbelt = false
                ZSX.Variables.SFX.BeltOff.play()
            }
        }

        ZSX.Functions.Game.CarHud.Menu = (el)=> {
            if (el == "carhud") {
                if (!ZSX.Variables.Game.Components['carhud'].active) {
                    $(".carhud-game_append").animate({opacity: 0.92})
                }
            } else if (el != "carhud") {
                if (!ZSX.Variables.Game.Components['carhud'].active) {
                    $(".carhud-game_append").animate({opacity: 0})
                }
            }
        }
        
        ZSX.Functions.Game.CarHud.CalculateRPM = (percentage)=> {
            if (!document.querySelector('#carhudProgress2')) return 0
            var progressLength = document.querySelector('#carhudProgress2').getTotalLength()
            var outlineLength = document.querySelector('#carhudProgress2Outline').getTotalLength()
            var data = {
                progress: progressLength - (progressLength * (percentage/100))/2.2,
                outline: outlineLength - (outlineLength * (percentage/100))/2.2,
            }  
            return data
        }

        ZSX.Functions.Game.CarHud.CalculateRPMModern = (percentage)=> {
            if (!(document.querySelector('#carHudProgressRPMModern'))) return 0
            var progressLength = document.querySelector('#carHudProgressRPMModern').getTotalLength()
            var data = {
                progress: progressLength - (progressLength * (percentage/100))/2.2,
            }  
            return data
        }

        ZSX.Functions.Game.CarHud.CalculateFuel = percentage=> {
            if (!document.querySelector('#fuelProgress')) return 0
            var fuelLength = document.querySelector('#fuelProgress').getTotalLength()
            return fuelLength - (fuelLength * (percentage/100))
        }

        ZSX.Functions.Game.CarHud.CalculateFuelModern = percentage=> {
            if (!document.querySelector('#carHudProgressModernFuel')) return 0
            var fuelLength = document.querySelector('#carHudProgressModernFuel').getTotalLength()
            return fuelLength - (fuelLength * (percentage/100))*.5
        }

        ZSX.Functions.Game.CarHud.StreetLabel = street=> {
            $('.street-label').html(street)
        }

        ZSX.Functions.Game.CarHud.Update = (data)=> {
            if (ZSX.Variables.Game.Components['carhud'].type == 'advanced' && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $('.carhud-game_append').find('#rpmBase').find('#carhudProgress2').css({'stroke-dashoffset': ZSX.Functions.Game.CarHud.CalculateRPM(data.rpm).progress})
                $('.carhud-game_append').find('#rpmBase').find('#carhudProgress2Outline').css({'stroke-dashoffset': ZSX.Functions.Game.CarHud.CalculateRPM(data.rpm).outline})
                $('.carhud-game_append').find('#fuelBase').find('#fuelProgress').css({'stroke-dashoffset': ZSX.Functions.Game.CarHud.CalculateFuel(data.fuel)})
                $('.street-label').html(data.streetLabel)
                var speed = Math.floor(data.speed) + ''
                if (speed == 0) {
                    $('.carhud-speed-box-advanced').html(`<div class="speed-0">0</div><div class="speed-0">0</div><div class="speed-0">0</div>`)
                }else if (speed < 10 && speed > 0) {
                    $('.carhud-speed-box-advanced').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed}</div>`)
                } else if (speed < 100 && speed > 9) {
                    $('.carhud-speed-box-advanced').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>`)
                } else if (speed > 99) {
                    $('.carhud-speed-box-advanced').html(`
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>
                    <div class="speed-int">${speed.substring(2,3)}</div>`)
                }
            } else if (ZSX.Variables.Game.Components['carhud'].type == 'basic' && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $('.carhud-basic-progress-rpm').css({width: data.rpm + '%'})
                $('#fuel_svg-basic').html(`<stop offset="${data.fuel}%" stop-color="var(--motive)"/><stop offset="${data.fuel}%" stop-color="#141414"/>`)
                $('.street-label').html(data.streetLabel)
                
                var speed = Math.floor(data.speed) + ''
                if (speed == 0) {
                    $('.carhud-speed-box-basic').html(`<div class="speed-0">0</div><div class="speed-0">0</div><div class="speed-0">0</div>`)
                }else if (speed < 10 && speed > 0) {
                    $('.carhud-speed-box-basic').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed}</div>`)
                } else if (speed < 100 && speed > 9) {
                    $('.carhud-speed-box-basic').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>`)
                } else if (speed > 99) {
                    $('.carhud-speed-box-basic').html(`
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>
                    <div class="speed-int">${speed.substring(2,3)}</div>`)
                }
            } else if (ZSX.Variables.Game.Components['carhud'].type == 'modern' && ZSX.Variables.CfgToJs.Creator['CarHud']) {
                $('.carhud-game_append').find('.carHudProgressModern').css({'stroke-dashoffset': ZSX.Functions.Game.CarHud.CalculateRPMModern(data.rpm).progress})
                $('.carhud-game_append').find('#carHudProgressModernFuel').css({'stroke-dashoffset': ZSX.Functions.Game.CarHud.CalculateFuelModern(data.fuel)})
                $('.street-label').html(data.streetLabel)
                var speed = Math.floor(data.speed) + ''
                if (speed == 0) {
                    $('.carhud-speed-box-modern').html(`<div class="speed-0">0</div><div class="speed-0">0</div><div class="speed-0">0</div>`)
                }else if (speed < 10 && speed > 0) {
                    $('.carhud-speed-box-modern').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed}</div>`)
                } else if (speed < 100 && speed > 9) {
                    $('.carhud-speed-box-modern').html(`
                    <div class="speed-0">0</div>
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>`)
                } else if (speed > 99) {
                    $('.carhud-speed-box-modern').html(`
                    <div class="speed-int">${speed.substring(0,1)}</div>
                    <div class="speed-int">${speed.substring(1,2)}</div>
                    <div class="speed-int">${speed.substring(2,3)}</div>`)
                }
            }
        }

    ZSX.Functions.Game.OpenAfterConfig = async(state)=> {
        var hudContainer = $(".hud-game_append")
            progressContainer = $(".progress-game_append")
            displayersContainer = $(".displayers-game_append")
            carhudContainer = $(".carhud-game_append")
            
        ZSX.Functions.Game.ApplySettings(state)
        if (!state) {
            $(".game-item-draggable").draggable({
                scroll: false,
                drag: (e,ui)=> {
                    $(e.target).css({transform: `scale(1)`})
                },
                stop: (e,ui)=> {
                    ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].position = $(e.target).css("inset")
                    $(e.target).css({transform: `scale(${ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].scale})`})
                    ZSX.Storage.Setters.Hud(ZSX.Variables.Game.Components["hud"])
                    ZSX.Storage.Setters.Notify(ZSX.Variables.Game.Components["notify"])
                    ZSX.Storage.Setters.Progress(ZSX.Variables.Game.Components["progress"])
                    ZSX.Storage.Setters.Displayers(ZSX.Variables.Game.Components["displayers"])
                    ZSX.Storage.Setters.CarHud(ZSX.Variables.Game.Components["carhud"])
                }
            })
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.html(ZSX.Variables.Content.Complete.Hud[ZSX.Variables.Game.Components["hud"].type])
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Game.Components["progress"].type])
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Game.Components["displayers"].type])
            if (ZSX.Variables.CfgToJs.Creator['CarHud'])        carhudContainer.html(ZSX.Variables.Content.Complete.CarHud[ZSX.Variables.Game.Components["carhud"].type])
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.animate({opacity: 0.92}, 1000)
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.animate({opacity: 0.92}, 1000)
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.animate({opacity: 0.92}, 1000)
        } else if (state) {
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.animate({opacity: 0.92}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.animate({opacity: 0.92}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.animate({opacity: 0.92}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.html(ZSX.Variables.Content.Complete.Hud[ZSX.Variables.Components.Hud["type"]])
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Components.Progress["type"]])
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Components.Displayers["type"]])
            if (ZSX.Variables.CfgToJs.Creator['CarHud'])        carhudContainer.html(ZSX.Variables.Content.Complete.CarHud[ZSX.Variables.Game.Components["carhud"].type])
        }
        if (!debug) $.post(`https://${GetParentResourceName()}/pre-setData`, JSON.stringify({}))
    }

    ZSX.Functions.Game.OpenAfterConfigWithoutInterface = async(state)=> {
        var hudContainer = $(".hud-game_append")
            progressContainer = $(".progress-game_append")
            displayersContainer = $(".displayers-game_append")
            carhudContainer = $(".carhud-game_append")
            
        ZSX.Functions.Game.ApplySettings(state)
        if (!state) {
            $(".game-item-draggable").draggable({
                scroll: false,
                drag: (e,ui)=> {
                    $(e.target).css({transform: `scale(1)`})
                },
                stop: (e,ui)=> {
                    ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].position = $(e.target).css("inset")
                    $(e.target).css({transform: `scale(${ZSX.Variables.Game.Components[$(e.target).data("element").toLowerCase()].scale})`})
                    ZSX.Storage.Setters.Hud(ZSX.Variables.Game.Components["hud"])
                    ZSX.Storage.Setters.Notify(ZSX.Variables.Game.Components["notify"])
                    ZSX.Storage.Setters.Progress(ZSX.Variables.Game.Components["progress"])
                    ZSX.Storage.Setters.Displayers(ZSX.Variables.Game.Components["displayers"])
                    ZSX.Storage.Setters.CarHud(ZSX.Variables.Game.Components["carhud"])
                }
            })
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.html(ZSX.Variables.Content.Complete.Hud[ZSX.Variables.Game.Components["hud"].type])
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Game.Components["progress"].type])
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Game.Components["displayers"].type])
            if (ZSX.Variables.CfgToJs.Creator['CarHud'])        carhudContainer.html(ZSX.Variables.Content.Complete.CarHud[ZSX.Variables.Game.Components["carhud"].type])
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.animate({opacity: 0.0}, 1000)
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.animate({opacity: 0.0}, 1000)
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.animate({opacity: 0.0}, 1000)
        } else if (state) {
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.animate({opacity: 0.0}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.animate({opacity: 0.0}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.animate({opacity: 0.0}, 400)
            if (ZSX.Variables.CfgToJs.Creator['Hud'])           hudContainer.html(ZSX.Variables.Content.Complete.Hud[ZSX.Variables.Components.Hud["type"]])
            if (ZSX.Variables.CfgToJs.Creator['Progress'])      progressContainer.html(ZSX.Variables.Content.Complete.ProgressBar[ZSX.Variables.Components.Progress["type"]])
            if (ZSX.Variables.CfgToJs.Creator['Displayers'])    displayersContainer.html(ZSX.Variables.Content.Complete.Displayers[ZSX.Variables.Components.Displayers["type"]])
            if (ZSX.Variables.CfgToJs.Creator['CarHud'])        carhudContainer.html(ZSX.Variables.Content.Complete.CarHud[ZSX.Variables.Game.Components["carhud"].type])
        }
        if (!debug) $.post(`https://${GetParentResourceName()}/pre-setData`, JSON.stringify({}))
    }
ZSX.Functions.Helper.SetValues = async ()=> {
    await $.map(ZSX.Variables.Content.Complete, (ui_element, key_of_ui)=> {
        $(`#configurator${key_of_ui}Type`).empty()
        $(`#game${key_of_ui}Type`).empty()
        $.map(ui_element, (_, key_ui_type)=> {
            console.log('[ZSX_UI] Appended element: "' + key_ui_type + '" | To: ' + key_of_ui)
            $(`#configurator${key_of_ui}Type`).append(`<option value="${key_ui_type.toLowerCase()}">${ZSX.Variables.Game.Translations.NavbarData.ClassName[key_ui_type.toLowerCase()]}</option>`)
            $(`#game${key_of_ui}Type`).append(`<option value="${key_ui_type.toLowerCase()}">${ZSX.Variables.Game.Translations.NavbarData.ClassName[key_ui_type.toLowerCase()]}</option>`)
        })
    })
    customSelect("#configuratorTextAlign")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#configuratorHudType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#configuratorNotifyType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#configuratorProgressType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#configuratorDisplayersType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#configuratorCarHudType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Configuration.Handlers.Select($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })

    customSelect("#gameHudType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameHudAlign")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameNotifyType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameNotifyAlign")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameDisplayersType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameProgressType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
    customSelect("#gameCarHudType")[0].select.addEventListener('change', (e) => { 
        ZSX.Functions.Game.Menu.Handlers.SelectGame($(e.target).data("element"), $(e.target).data("type"), $(e.target).val())
    })
}

window.onload = ()=> {
    ZSX.Functions.Helper.SetValues()
    ZSX.Functions.Configuration.Handlers.Picker = Pickr.create({
        el: '.color-picker',
        theme: 'classic',
    
        components: {
    
            preview: true,
            opacity: false,
            hue: true,

            interaction: {
                hex: true,
                rgba: true,
                input: true,
            }
        }
    })

    ZSX.Functions.Game.Menu.Handlers.Picker = Pickr.create({
        el: '.color-picker-game',
        theme: 'classic',
    
        components: {
    
            preview: true,
            opacity: false,
            hue: true,
            
            interaction: {
                hex: true,
                rgba: true,
                input: true,
            }
        }
    })

    ZSX.Functions.Configuration.Handlers.Picker.on('change', (color) => {
        var rgb = color.toRGBA().toString(3)
        $(':root').css({
            "--motive": rgb
        })
        ZSX.Storage.Setters.Theme($(":root").css("--motive"))
    }).on('hide', ()=> {
        ZSX.Variables.SFX.Preset.play()
    }).on('show', ()=> {
        ZSX.Variables.SFX.Preset.play()
    })

    ZSX.Functions.Game.Menu.Handlers.Picker.on('change', (color) => {
        var rgb = color.toRGBA().toString(3)
        $(':root').css({
            "--motive": rgb
        })
        if (!debug) $.post(`https://${GetParentResourceName()}/UpdatePlayerColor`, JSON.stringify({color: rgb}))
        ZSX.Storage.Setters.Theme($(":root").css("--motive"))
    }).on('hide', ()=> {
        ZSX.Variables.SFX.Preset.play()
    }).on('show', ()=> {
        ZSX.Variables.SFX.Preset.play()
    })
}
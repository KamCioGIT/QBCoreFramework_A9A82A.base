$(async ()=> {
    if (!debug) {
        $.post(`https://${GetParentResourceName()}/GetConfig`, JSON.stringify({cool: true}))
    } else {
        ZSX.Functions.Welcome.Initialize()
    }
    $(".info-welcome").click(()=> {
        ZSX.Functions.Welcome.Disable(true)
    })

    $(".custom-select-opener").click(()=> {
        ZSX.Variables.SFX.ClickPreset.play()
    })

    $('.button-info-configurator').on('mouseenter',(e)=> {
        ZSX.Functions.Configuration.Handlers.HelpNotify(e.target, true)
    })

    $('.button-info-configurator').on('mouseleave',(e)=> {
        ZSX.Functions.Configuration.Handlers.HelpNotify(e.target, false)
    })
    
    $('.button-next-configurator').click(()=> {
        ZSX.Functions.Configuration.Handlers.NextStep()
    })

    $('.button-previous-configurator').click(()=> {
        ZSX.Functions.Configuration.Handlers.PreviousStep()
    })

    $('.button-end-configurator').click(()=> {
        ZSX.Functions.Configuration.End()
    })
    
    $(document).on('click', '.button-preview-configurator', ()=> {
        ZSX.Functions.Preview.Init()
    })

    $('.button-preview-end-request').click((e)=> {
        if ($(e.target).data("request")) {
            ZSX.Functions.Configuration.End()
        } else if (!$(e.target).data("request")) {
            ZSX.Functions.Preview.Handlers.Accept(false)
        }
    })

    $('.configurator-checkbox').click( e =>{
        var json = {
            type: $(e.target).data("type"),
            value: $(e.target).data("value"),
            checked: $(e.target).is(':checked'),
        }

        ZSX.Functions.Configuration.Handlers.CheckboxPreview(json)
    })

    $(".info-keys-cont").on("mouseenter", (e)=> {
        var helpPosition = ZSX.getOffset(e.target)
        $(".info-container-preview").css({left: helpPosition.left + 10, top: helpPosition.top - 150})
        $(".info-container-preview").stop().animate({opacity: 1})
    })

    $(".info-keys-cont").on("mouseleave", ()=> {
        $(".info-container-preview").stop().animate({opacity: 0})
    })
    
    $(".preview-menu_opener").on("mousedown", e => {
        e.preventDefault()
        if (e.which == 3) {
            var target      = $(e.target)
                targetData  = target.data("element")
                json        = { 
                    header: targetData,
                    text:   ZSX.Variables.Components.TypeToText[targetData][ZSX.Variables.Components[targetData].type]
                }
            ZSX.Functions.Preview.Handlers.Menu.Handler(json)
        } else if (e.which == 2) {
            var target      = $(e.target)
                targetData      = target.data("element")
                targetAlignment = target.data("alignment")
                json            = { 
                    element:    targetData,
                    alignments: targetAlignment,
                }
            ZSX.Functions.Preview.Handlers.Menu.HandleAlignment(json)
        }
    })

    $(".button-preview-menu-close").click(()=> {
        ZSX.Functions.Preview.Handlers.Menu.ForceClose()
    })

    $(".input-menu_range").on("input change", e => {
        $(`.${ZSX.Variables.Preview.Component.Used.toLowerCase()}-container-preview_append`).css({transform: `scale(${$(e.target).val()})`})
        ZSX.Variables.Preview.Component.Scale[ZSX.Variables.Preview.Component.Used] = $(e.target).val()
    })

    $(".input_range-game-menu").on("input change", e => {
        var data = {
            element: $(e.target).data("element"),
            val: $(e.target).val()
        }
        ZSX.Functions.Game.Menu.Scale(data)
    })

    $(".button-preview-menu").click( e => {
        var json = {
            type: $(e.target).data("type")
        }
        ZSX.Functions.Preview.Handlers.Buttons(json)
    })

    $(".navbar-game-menu-item").click( e => {
        ZSX.Functions.Game.Menu.Handlers.Navbar($(e.target))
    })
    
    $(document).on('click', ".menu-game-addon-hide-hud-component", e => {
        ZSX.Functions.Game.Menu.Handlers.Addon.HudComponent($(e.target), $(e.target).data("component"))
    })

    $(document).on('click', ".menu-game-addon-hide-displayer-component", e => {
        ZSX.Functions.Game.Menu.Handlers.Addon.DisplayerComponent($(e.target), $(e.target).data("component"))
    })

    $(".button-game-menu").click( e => {
        var data = {
            type: $(e.target).data("type"),
            element: $(e.target).data("element"),
            content: $(e.target).data("content")
        }
        ZSX.Functions.Game.Menu.Handlers.Button(data)
    })

    window.onresize = ()=> {
        var Component = {}
        Component.Configurator = {}
        Component.Configurator.Formula = ($(window).width() * 8)/100
        Component.Configurator.circleRadius = Component.Configurator.Formula * 0.45
        Component.Configurator.circleDashArray = (2 * Math.PI * Component.Configurator.circleRadius)
        Component.Configurator.Percent = 100
        Component.Configurator.circleDashOffset = (Component.Configurator.Percent * Component.Configurator.circleDashArray/100) - Component.Configurator.circleDashArray
        $(".hud_circle_progress").css({
            "stroke-dasharray": Component.Configurator.circleDashArray,
            "stroke-dashoffset": Component.Configurator.circleDashOffset
        })

        Component.Content = {}
        Component.Content.Formula = ($(window).width() * 2.3)/100
        Component.Content.circleRadius = Component.Content.Formula * 0.45
        Component.Content.circleDashArray = (2 * Math.PI * Component.Content.circleRadius)
        Component.Content.Percent = 100
        Component.Content.circleDashOffset = (Component.Content.Percent * Component.Content.circleDashArray/100) - Component.Content.circleDashArray
        $(".hud_circle_progress_smaller").css({
            "stroke-dasharray": Component.Content.circleDashArray,
            "stroke-dashoffset": Component.Content.circleDashOffset
        })
    }
})
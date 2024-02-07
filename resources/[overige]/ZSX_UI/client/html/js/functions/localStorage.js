ZSX.Storage = {}

ZSX.Storage.Getters = {}

    ZSX.Storage.Getters.Hud = ()=> {
        return localStorage.getItem("storage_hud")
    }

    ZSX.Storage.Getters.Notify = ()=> {
        return localStorage.getItem("storage_notify")
    }

    ZSX.Storage.Getters.Progress = ()=> {
        return localStorage.getItem("storage_progress")
    }

    ZSX.Storage.Getters.Displayers = ()=> {
        return localStorage.getItem("storage_displayers")
    }

    ZSX.Storage.Getters.CarHud = ()=> {
        return localStorage.getItem("storage_carhud")
    }

    ZSX.Storage.Getters.Theme = ()=> {
        return localStorage.getItem("storage_theme")
    }


ZSX.Storage.Setters = {}

    ZSX.Storage.Setters.Hud = (json)=> {
        localStorage.setItem("storage_hud", JSON.stringify(json))
    }

    ZSX.Storage.Setters.Notify = (json)=> {
        localStorage.setItem("storage_notify", JSON.stringify(json))
    }

    ZSX.Storage.Setters.Progress = (json)=> {
        localStorage.setItem("storage_progress", JSON.stringify(json))
    }

    ZSX.Storage.Setters.Displayers = (json)=> {
        localStorage.setItem("storage_displayers", JSON.stringify(json))
    }

    ZSX.Storage.Setters.CarHud = (json)=> {
        return localStorage.setItem("storage_carhud", JSON.stringify(json))
    }

    ZSX.Storage.Setters.Theme = (color)=> {
        localStorage.setItem("storage_theme", color)
    }
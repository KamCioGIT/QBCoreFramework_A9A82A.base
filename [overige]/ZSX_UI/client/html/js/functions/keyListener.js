document.addEventListener('keyup', (e) => {
    if (e.code === "Backspace" && ZSX.Variables.Active.Preview)  ZSX.Functions.Preview.End(true)
    else if (e.code === "Enter" && ZSX.Variables.Active.Preview) ZSX.Functions.Preview.Handlers.Accept(true)
    else if (e.code === "F9" && ZSX.Variables.Active.Game && !ZSX.Variables.Active.GameMenu && !ZSX.Variables.Active.GameMenuAnim)  ZSX.Functions.Game.Menu.Init(true)
    else if (e.code === "F9" || e.code === "Escape" && ZSX.Variables.Active.Game && ZSX.Variables.Active.GameMenu && !ZSX.Variables.Active.GameMenuAnim)  ZSX.Functions.Game.Menu.Init(false)
});

document.addEventListener("contextmenu", e => e.preventDefault())
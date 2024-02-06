local Translations = {
    error = {
        not_enough      = "Je hebt niet genoeg contant geld..",
        no_slots        = "Er zijn geen slots meer",
        occured         = "Er is een fout opgetreden",
        have_keys       = "Deze persoon heeft al sleutels",
        p_have_keys     = "%{value} Deze persoon heeft al sleutels",
        not_owner       = "Je bezit geen traphouse of bent niet de eigenaar",
        not_online      = "Deze persoon is niet in de stad",
        no_money        = "Er zit geen geld in de kast",
        incorrect_code  = "Deze code is onjuist",
        up_to_6         = "Je kunt maximaal 6 personen toegang geven tot het Traphuis!",
        cancelled       = "Acquisities geannuleerd",
    },
    success = {
        added           = "%{value} is toegevoegd aan het traphuis!",
    },
    info = {
        enter           = "Ga Traphuis binnen",
        give_keys       = "Geef sleutels van Traphouse",
        pincode         = "Traphouse-pincode: %{value}",
        taking_over     = "Overname",
        pin_code_see    = "~b~G~w~ - Zie pincode",
        pin_code        = "Pincode: %{value}",
        multikeys       = "~b~/multikeys~w~ [id] - Om sleutels te geven",
        take_cash       = "~b~E~w~ - Neem contant geld op (~g~€%{value}~w~)",
        inventory       = "~b~H~w~ - Bekijk inventaris",
        take_over       = "~b~E~w~ - Overname (~g~€5000~w~)",
        leave           = "~b~E~w~ - Verlaat Traphouse",
    },
    targetInfo = {
        options         = "Traphouse-opties",
        enter           = "Ga Traphuis binnen",
        give_keys       = "Geef sleutels van Traphouse",
        pincode         = "Traphouse-pincode: %{value}",
        taking_over     = "Overnemen",
        pin_code_see    = "Zie Pincode",
        pin_code        = "Pincode: %{value}",
        multikeys       = "Geef sleutels (gebruik /multikey [id])",
        take_cash       = "Neem contant geld (€%{value})",
        inventory       = "Voorraad bekijken",
        take_over       = "Overnemen (€5000)",
        leave           = "Verlaat Traphouse",
        close_menu      = "⬅ Menu sluiten",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

local Translations = {
    success = {
        you_have_been_clocked_in    = "Je bent ingeklokt",
    },
    text = {
        point_enter_warehouse       = "[E] Magazijn binnengaan",
        enter_warehouse             = "Ga magazijn binnen",
        exit_warehouse              = "Magazijn verlaten",
        point_exit_warehouse        = "[E] Magazijn verlaten",
        clock_out                   = "[E] Uitklokken",
        clock_in                    = "[E] Inklokken",
        hand_in_package             = "Inleverpakket",
        point_hand_in_package       = "[E] Hand-in-pakket",
        get_package                 = "Pakket ophalen",
        point_get_package           = "[E] Pakket ophalen",
        picking_up_the_package      = "Het pakket ophalen",
        unpacking_the_package       = "Het pakket uitpakken",
    },
    error = {
        you_have_clocked_out        = "Je bent uitgeklokt"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
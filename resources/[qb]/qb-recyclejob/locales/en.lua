local Translations = {
    success = {
        you_have_been_clocked_in =  "Je bent ingeklokt",
    },
    text = {
        point_enter_warehouse =     "[E] Magazijn binnengaan",
        enter_warehouse=            "Ga magazijn binnen",
        exit_warehouse=             "Verlaat magazijn",
        point_exit_warehouse =      "[E] Verlaat magazijn",
        clock_out =                 "[E] Klok uit",
        clock_in =                  "[E] Inklokken",
        hand_in_package =           "Hand-in-pakket",
        point_hand_in_package =     "[E] Hand-in-pakket",
        get_package =               "Pakket ophalen",
        point_get_package =         "[E] Pakket ophalen",
        picking_up_the_package =    "Pakket ophalen",
        unpacking_the_package =     "Het pakket uitpakken",
    },
    error = {
        you_have_clocked_out =      "Je bent uitgeklokt"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
local Translations = {
    error = {
        no_deposit =            "€%{value} aanbetaling vereist",
        cancelled =             "Geannuleerd",
        vehicle_not_correct =   "Dit is geen bedrijfsvoertuig!",
        no_driver =             "Je moet de chauffeur zijn om dit te doen..",
        no_work_done =          "Je hebt nog geen werk gedaan..",
        backdoors_not_open =    "De achterdeuren van het voertuig zijn niet open",
        get_out_vehicle =       "Om deze actie uit te voeren, moet je uit het voertuig stappen",
        too_far_from_trunk =    "Je moet de dozen uit de kofferbak van je voertuig halen",
        too_far_from_delivery = "Je moet dichter bij het afleverpunt zijn"
    },
    success = {
        paid_with_cash =        "€%{value} aanbetaling contant betaald",
        paid_with_bank =        "€%{value} aanbetaling betaald vanaf bank",
        refund_to_cash =        "€%{value} aanbetaling contant betaald",
        you_earned =            "Je hebt €%{value} verdiend",
        payslip_time =          "Je bent naar alle winkels geweest. Tijd voor je loonstrook!",
    },
    menu = {
        header =                "Beschikbare vrachtwagens",
        close_menu =            "⬅ Menu sluiten",
    },
    mission = {
        store_reached =         "Winkel bereikt, pak een doos in de kofferbak met [E] en lever af bij marker",
        take_box =              "Neem een doos met producten",
        deliver_box =           "Bezorg doos met producten",
        another_box =           "Koop nog een doos met producten",
        goto_next_point =       "Je hebt alle producten afgeleverd, naar het volgende punt",
        return_to_station =     "U heeft alle producten afgeleverd, keer terug naar station",
        job_completed =         "U heeft uw route voltooid, verzamel uw looncheque"
    },
    info = {
        deliver_e =             "~g~E~w~ - Producten leveren",
        deliver =               "Producten bezorgen",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

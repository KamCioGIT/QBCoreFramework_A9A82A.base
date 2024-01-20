local Translations = {
    error = {
        finish_work =           "Eerst al je werk afmaken",
        vehicle_not_correct =   "Dit is niet het juiste voertuig",
        failed =                "Je hebt gefaald",
        not_towing_vehicle =    "U moet zich in uw trekvoertuig bevinden",
        too_far_away =          "Je bent te ver weg",
        no_work_done =          "Je hebt nog geen werk gedaan",
        no_deposit =            "€%{value} Aanbetaling vereist",
    },
    success = {
        paid_with_cash =        "€%{value} aanbetaling betaald met contant geld",
        paid_with_bank =        "€%{value} aanbetaling betaald vanaf bank",
        refund_to_cash =        "€%{value} aanbetaling betaald met contant geld",
        you_earned =            "Je hebt €%{value} verdiend",
    },
    menu = {
        header =                "Beschikbare vrachtwagens",
        close_menu =            "⬅ Menu sluiten",
    },
    mission = {
        delivered_vehicle =     "U heeft een voertuig afgeleverd",
        get_new_vehicle =       "Een nieuw voertuig kan worden opgehaald",
        towing_vehicle =        "Het voertuig hijsen...",
        goto_depot =            "Breng het voertuig naar het Hayes-depot",
        vehicle_towed =         "Voertuig gesleept",
        untowing_vehicle =      "Verwijder het voertuig",
        vehicle_takenoff =      "Voertuig weggehaald",
    },
    info = {
        tow =                   "Plaats een auto op de achterkant van uw laadbak",
        toggle_npc =            "Npc-taak omschakelen",
        skick =                 "Poging tot misbruik",
    },
    label = {
        payslip =               "Loonstrook",
        vehicle =               "Voertuig",
        npcz =                  "NPCZone",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

local Translations = {
    text = {
        weazle_overlay =            "SasVegas-overlay ~INPUT_PICKUP~ \nFilm-overlay: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles =      "SasVegas Nieuwsvoertuigen",
        close_menu =                "⬅ Menu sluiten",
        weazel_news_helicopters =   "SasVegas Nieuwshelikopters",
        store_vehicle =             "~g~E~w~ - Het voertuig stallen",
        vehicles =                  "~g~E~w~ - Voertuigen",
        store_helicopters =         "~g~E~w~ - Bewaar de helikopters",
        helicopters =               "~g~E~w~ - Helikopters",
        enter =                     "~g~E~w~ - Enter",
        go_outside =                "~g~E~w~ - Ga naar buiten",
        breaking_news =             "BELANGRIJK NIEUWS",
        title_breaking_news =       "7:00 uur / Vandaag exclusief SasVegas Nieuws",
        bottom_breaking_news =      "Wij brengen u het LAATSTE NIEUWS live zoals het gebeurt"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

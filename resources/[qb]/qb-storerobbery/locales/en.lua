local Translations = {
    error = {
        minimum_store_robbery_police        = "Niet genoeg politie (%{MinimumStoreRobberyPolice} vereist)",
        not_driver                          = "Jij bent niet de bestuurder",
        demolish_vehicle                    = "Je mag nu geen voertuigen slopen",
        process_canceled                    = "Proces geannuleerd..",
        you_broke_the_lock_pick             = "Je hebt de lockpick gebroken",
    },
    text = {
        the_cash_register_is_empty          = "De kassa is leeg",
        try_combination                     = "~g~E~w~ - Probeer combinatie",
        safe_opened                         = "Veilig geopend",
        emptying_the_register               = "Het register leegmaken..",
        safe_code                           = "Veilige code: "
    },
    email = {
        shop_robbery                        = "10-31 | Winkeloverval",
        someone_is_trying_to_rob_a_store    = "Iemand probeert een winkel in %{street} te beroven (CAMERA ID: %{cameraId1})",
        storerobbery_progress               = "Winkeloverval bezig"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

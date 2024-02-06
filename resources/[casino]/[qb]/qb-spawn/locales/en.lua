local Translations = {
    ui = {
        last_location = "Laatste Locatie",
        confirm = "Bevestig",
        where_would_you_like_to_start = "Waar wil je starten?",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

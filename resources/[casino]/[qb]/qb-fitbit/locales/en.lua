local Translations = {
    success = {
        hunger_set =        'Fitbit: Hongerwaarschuwing ingesteld op %{hungervalue}%',
        thirst_set =        'Fitbit: Dorstwaarschuwing ingesteld op %{thirstvalue}%',
    },
    warning = {
        hunger_warning =    'Je honger is %{hunger}%',
        thirst_warning =    'Je dorst is %{thirst}%'
    },
    info = {
        fitbit = 'FITBIT '
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

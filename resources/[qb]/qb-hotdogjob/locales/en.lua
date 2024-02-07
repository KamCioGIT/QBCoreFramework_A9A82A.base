local Translations = {
    error = {
        no_money =                  'Niet genoeg geld',
        too_far =                   'Je bent te ver van je hotdogkraam',
        no_stand =                  'Je hebt geen hotdogkraam',
        cust_refused =              'Klant geweigerd!',
        no_stand_found =            'Je hotdogkraam was nergens te bekennen, je krijgt je borg niet terug!',
        no_more =                   'Je hebt hier geen %{value} meer over voor de raad',
        deposit_notreturned =       'Je had geen hotdogkraam',
        no_dogs =                   'Je hebt geen hotdogs',
    },
    success = {
        deposit =                   'Je hebt een aanbetaling van €%{deposit} gedaan!',
        deposit_returned =          'Uw €%{aanbetaling} aanbetaling is teruggestort!',
        sold_hotdogs =              '%{value} x Hotdog(\'s) verkocht voor €%{value2}',
        made_hotdog =               'Je hebt een %{value} Hotdogs gemaakt',
        made_luck_hotdog =          'Je hebt %{value} x %{value2} Hotdogs gemaakt',
    },
    info = {
        command =                   "Stand verwijderen (alleen beheerder)",
        blip_name =                 'Hotdogkraam',
        start_working =             '[E] Begin met werken',
        start_work =                'Begin met werken',
        stop_working =              '[E] Stop met werken',
        stop_work =                 'Stop met werken',
        grab_stall =                '[~g~G~s~] Grijpkraam',
        drop_stall =                '[~g~G~s~] Vrijgaveblokkering',
        grab =                      'Pak kraam',
        prepare =                   'Hotdog bereiden',
        toggle_sell =               'Toggle Verkopen',
        selling_prep =              '[~g~E~s~] Hotdog bereiden [Verkoop: ~g~Verkoop~w~]',
        not_selling =               '[~g~E~s~] Hotdog bereiden [Uitverkoop: ~r~Niet verkocht~w~]',
        sell_dogs =                 '[~g~7~s~] Verkoop %{value} x HotDogs voor €%{value2} / [~g~8~s~] Afwijzen',
        sell_dogs_target =          'Verkoop %{value} x HotDogs voor €%{value2}',
        admin_removed =             "Hotdogkraam verwijderd",
        label_a =                   "Perfect (A)",
        label_b =                   "Zeldzaam (B)",
        label_c =                   "Normaal (C)"
    },
        keymapping = {
        gkey =                      'Laat de hotdogkraam los',
        
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

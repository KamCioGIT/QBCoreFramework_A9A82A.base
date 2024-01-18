local Translations = {
    success = {
        withdraw =      'Opnemen succesvol',
        deposit =       'Storting succesvol',
        transfer =      'Overdracht succesvol',
        account =       'Account aangemaakt',
        rename =        'Account hernoemd',
        delete =        'Account verwijderd',
        userAdd =       'Gebruiker toegevoegd',
        userRemove =    'Gebruiker verwijderd',
        card =          'Kaart aangemaakt',
        give =          '€%s contant geld gegeven',
        receive =       '€%s contant ontvangen',
    },
    error = {
        error =         'Er is een fout opgetreden',
        access =        'Geen bevoegdheid',
        account =       'Account niet gevonden',
        accounts =      'Max. aantal aangemaakte accounts',
        user =          'Gebruiker al toegevoegd',
        noUser =        'Gebruiker niet gevonden',
        money =         'Niet genoeg geld',
        pin =           'Ongeldige pincode',
        card =          'Geen bankpas gevonden',
        amount =        'Ongeldige hoeveelheid',
        toofar =        'Je bent te ver weg',
    },
    progress = {
        atm =           'Toegang tot geldautomaat',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

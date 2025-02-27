local Translations = {
    error = {
        not_in_range = 'Te ver van het stadhuis'
    },
    success = {
        recived_license = 'U heeft uw %{value} ontvangen voor $50'
    },
    info = {
        new_job_app = 'Je sollicitatie is verzonden naar de baas van (%{job})',
        bilp_text = 'Stadsdiensten',
        city_services_menu = '~g~E~w~ - Stadsdiensten Menu',
        id_card = 'ID Kaart',
        driver_license = 'Rijbewijs',
        weaponlicense = 'Vuurwapen Licentie',
        new_job = 'Gefeliciteerd met je nieuwe baan! (%{job})'
    },
    email = {
        jobAppSender = "%{job}",
        jobAppSub = "Bedankt voor je sollicitatie voor %(job).",
        jobAppMsg = "Hallo %{gender} %{lastname}<br /><br />%{job} heeft uw sollicitatie ontvangen.<br /><br />De baas onderzoekt uw verzoek en zal contact met u opnemen voor een sollicitatiegesprek zo spoedig mogelijk.<br /><br />Nogmaals bedankt voor uw sollicitatie.",
        mr = 'Dhr',
        mrs = 'Mvr',
        sender = 'Gemeente',
        subject = 'Aanvraag Rijles',
        message = 'Hallo %{gender} %{lastname}<br /><br />We hebben zojuist bericht gekregen dat iemand rijles wil gaan volgen<br />Als je bereid bent om les te geven, neem dan contact met ons op:<br />Naam: <strong>%{firstname} %{lastname}</strong><br />Telefoonnummer: <strong>%{phone}</strong><br/><br/>Vriendelijke groeten,<br />Gemeente SasVegas'
    }
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
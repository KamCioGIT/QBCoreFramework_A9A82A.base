local Translations = {
    error = {
        negative            = 'Probeert u een negatief bedrag te verkopen?',
        no_melt             = 'Je hebt me niets gegeven om te smelten...',
        no_items            = 'Niet genoeg items',
        inventory_full      = 'Voorraad te vol om alle mogelijke items te ontvangen. Zorg ervoor dat de voorraad de volgende keer niet vol is. Verloren items: %{value}'
    },
    success = {
        sold                = 'Je hebt %{value} x %{value2} verkocht voor $%{value3}',
        items_received      = 'Je hebt %{value} x %{value2} ontvangen',
    },
    info = {
        title               = 'pandjeshuis',
        subject             = 'Smeltende voorwerpen',
        message             = 'We zijn klaar met het smelten van je items. Je kunt ze altijd komen ophalen.',
        open_pawn           = 'Open het pandjeshuis',
        sell                = 'Artikelen verkopen',
        sell_pawn           = 'Verkoop voorwerpen aan het pandjeshuis',
        melt                = 'Smeltitems',
        melt_pawn           = 'Open de smeltwinkel',
        melt_pickup         = 'Gesmolten items ophalen',
        pawn_closed         = 'pandjeshuis is gesloten. Kom terug tussen %{value}:00 AM - %{value2}:00 PM',
        sell_items          = 'Verkoopprijs $%{value}',
        back                = '⬅ Ga terug',
        melt_item           = 'Smelt %{value}',
        max                 = 'Maximaal bedrag %{value}',
        submit              = 'Smelten',
        melt_wait           = 'Geef mij %{value} minuten en ik laat je spullen smelten',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

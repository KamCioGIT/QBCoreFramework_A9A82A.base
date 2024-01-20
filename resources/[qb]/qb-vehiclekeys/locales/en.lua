local Translations = {
    notify = {
        ydhk =                  'Je hebt geen sleutels van dit voertuig.',
        nonear =                'Er is niemand in de buurt om sleutels aan te overhandigen',
        vlock =                 'Voertuig op slot!',
        vunlock =               'Voertuig ontgrendeld!',
        vlockpick =             'Het is je gelukt om het deurslot open te krijgen!',
        fvlockpick =            'Je vindt de sleutels niet en raakt gefrustreerd.',
        vgkeys =                'Je overhandigt de sleutels.',
        vgetkeys =              'Je krijgt sleutels van het voertuig!',
        fpid =                  'Vul de spelers-ID en Plaat-argumenten in',
        cjackfail =             'Carjacking mislukt!',
        vehclose =              'Er is geen voertuig dichtbij!',
    },      
    progress = {        
        takekeys =              'Sleutels uit lichaam halen...',
        hskeys =                'Op zoek naar de autosleutels...',
        acjack =                'Poging tot carjacking...',
    },      
    info = {        
        skeys =                 '~g~[H]~w~ - Zoeken naar sleutels',
        tlock =                 'Voertuigsloten omschakelen',
        palert =                'Voertuigdiefstal is aan de gang. Typ: ',
        engine =                'Toggle-motor',
    },      
    addcom = {      
        givekeys =              'Overhandig de sleutels aan iemand. Indien geen identiteitsbewijs, doorgeven aan dichtstbijzijnde persoon of iedereen in het voertuig.',
        givekeys_id =           'ID kaart',
        givekeys_id_help =      'Speler-ID',
        addkeys =               'Voegt sleutels toe aan een voertuig voor iemand.',
        addkeys_id =            'ID kaart',
        addkeys_id_help =       'Speler-ID',
        addkeys_plate =         'bord',
        addkeys_plate_help =    'Bord',
        rkeys =                 'Sleutels van een voertuig voor iemand verwijderen.',
        rkeys_id =              'ID kaart',
        rkeys_id_help =         'Speler-ID',
        rkeys_plate =           'bord',
        rkeys_plate_help =      'Bord',
    }

}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

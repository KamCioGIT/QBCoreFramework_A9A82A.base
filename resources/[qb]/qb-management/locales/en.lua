-- Add translations by MC
local Translations = {
    headers = {
        ['bsm'] =           'Baasmenu - ',
    },
    body = {
        ['manage'] =        'Beheer medewerkers',
        ['managed'] =       'Controleer uw medewerkerslijst',
        ['hire'] =          'Huur werknemers',
        ['hired'] =         'Huur burgers in de buurt in',
        ['storage'] =       'Toegang tot opslag',
        ['storaged'] =      'Open opslag',
        ['outfits'] =       'Kleding',
        ['outfitsd'] =      'Zie opgeslagen outfits',
        ['money'] =         'Geldbeheer',
        ['moneyd'] =        'Controleer uw bedrijfssaldo',
        ['mempl'] =         'Beheer medewerkers - ',
        ['mngpl'] =         'Beheren ',
        ['grade'] =         'Cijfer: ',
        ['fireemp'] =       'Brandmedewerker',
        ['hireemp'] =       'Huur werknemers in -',
        ['cid'] =           'Burger-ID: ',
        ['balance'] =       'Saldo: €',
        ['deposit'] =       'Borg',
        ['depositd'] =      'Geld op rekening storten',
        ['withdraw'] =      'Terugtrekken',
        ['withdrawd'] =     'Geld opnemen van rekening',
        ['depositm'] =      'Stortingsgeld <br> Beschikbaar saldo: €',
        ['withdrawm'] =     'Geld opnemen <br> Beschikbaar saldo: €',
        ['submit'] =        'Bevestigen',
        ['amount'] =        'Hoeveelheid',
        ['return'] =        'Terug',
        ['exit'] =          'Sluiten',
    },
    drawtext = {
        ['label'] =         '[E] Open werk management',
    },
    target = {
        ['label'] =         'Baasmenu',
    },
    headersgang = {
        ['bsm'] =           'Bendebeheer -',
    },
    bodygang = {
        ['manage'] =        'Beheer bendeleden',
        ['managed'] =       'Rekruteer of ontsla bendeleden',
        ['hire'] =          'Leden werven',
        ['hired'] =         'Huur bendeleden in',
        ['storage'] =       'Toegang tot opslag',
        ['storaged'] =      'Open bendevoorraad',
        ['outfits'] =       'Kleding',
        ['outfitsd'] =      'Omkleden',
        ['money'] =         'Geldbeheer',
        ['moneyd'] =        'Controleer uw bendesaldo',
        ['mempl'] =         'Beheer bendeleden - ',
        ['mngpl'] =         'Beheren ',
        ['grade'] =         'Cijfer: ',
        ['fireemp'] =       'Vuur',
        ['hireemp'] =       'Huur bendeleden in -',
        ['cid'] =           'Burger-ID: ',
        ['balance'] =       'Saldo: €',
        ['deposit'] =       'Borg',
        ['depositd'] =      'Geld op rekening storten',
        ['withdraw'] =      'Terugtrekken',
        ['withdrawd'] =     'Geld opnemen van rekening',
        ['depositm'] =      'Stortingsgeld <br> Beschikbaar saldo: €',
        ['withdrawm'] =     'Geld opnemen <br> Beschikbaar saldo: €',
        ['submit'] =        'Bevestigen',
        ['amount'] =        'Hoeveelheid',
        ['return'] =        'Opbrengst',
        ['exit'] =          'Uitgang',
    },
    drawtextgang = {
        ['label'] =         '[E] Open bendebeheer',
    },
    targetgang = {
        ['label'] =         'Bendemenu',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

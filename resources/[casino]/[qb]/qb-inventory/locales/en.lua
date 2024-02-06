--[[
English base language translation for qb-inventory
Translation done by wanderrer (Martin Riggs#0807 on Discord)
]]--
local Translations = {
    progress = {
        ["crafting"] =      "Bouwen...",
        ["snowballs"] =     "Sneeuwballen verzamelen..",
    },
    notify = {
        ["failed"] =        "Mislukt",
        ["canceled"] =      "Geannuleerd",
        ["vlocked"] =       "Voertuig vergrendeld",
        ["notowned"] =      "Je bent niet de eigenaar van dit item!",
        ["missitem"] =      "Je hebt dit item niet!",
        ["nonb"] =          "Niemand in de buurt!",
        ["noaccess"] =      "Niet toegankelijk",
        ["nosell"] =        "Je kunt dit item niet verkopen..",
        ["itemexist"] =     "Artikel bestaat niet",
        ["notencash"] =     "Je hebt niet genoeg contant geld..",
        ["noitem"] =        "Je hebt niet de juiste items..",
        ["gsitem"] =        "Kun je jezelf geen item geven?",
        ["tftgitem"] =      "Je bent te ver weg om items te geven!",
        ["infound"] =       "Item dat u probeerde op te geven, is niet gevonden!",
        ["iifound"] =       "Onjuist artikel gevonden, probeer het opnieuw!",
        ["gitemrec"] =      "Jij ontving ",
        ["gitemfrom"] =     " Van ",
        ["gitemyg"] =       "Jij gaf ",
        ["gitinvfull"] =    "De inventaris van de andere spelers is vol!",
        ["giymif"] =        "Je inventaris is vol!",
        ["gitydhei"] =      "Je hebt niet genoeg van het artikel",
        ["gitydhitt"] =     "Je hebt niet genoeg items om over te dragen",
        ["navt"] =          "Geen geldig type..",
        ["anfoc"] =         "Argumenten niet correct ingevuld..",
        ["yhg"] =           "Je hebt gegeven ",
        ["cgitem"] =        "Kan geen item geven!",
        ["idne"] =          "Artikel bestaat niet",
        ["pdne"] =          "Speler is niet online",
    },
    inf_mapping = {
        ["opn_inv"] =       "Open voorraad",
        ["tog_slots"] =     "Toggle keybind slots",
        ["use_item"] =      "Gebruikt het item in slot ",
    },
    menu = {
        ["vending"] =       "Automaat",
        ["craft"] =         "Maken",
        ["o_bag"] =         "Open zak",
    },
    interaction = {
        ["craft"] =         "~g~E~w~ - Maken",
    },
    label = {
        ["craft"] =         "Bouwen",
        ["a_craft"] =       "Attachment maken",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

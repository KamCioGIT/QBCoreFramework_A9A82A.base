local Translations = {
    error = {
        you_dont_have_a_cryptostick =                   'Je hebt geen cryptostick',
        cryptostick_malfunctioned =                     'Cryptostick defect'
    },
    success = {
        you_have_exchanged_your_cryptostick_for =       'U heeft uw Cryptostick ingewisseld voor: %{amount} QBit(s)'
    },
    credit = {
        there_are_amount_credited =                     'Je hebt %{amount} Qbit(s) ontvangen!',
        you_have_qbit_purchased =                       'Je hebt %{dataCoins} Qbit(s) gekocht!'
    },
    debit = {
        you_have_sold =                                 'Je hebt %{dataCoins} Qbit(s) verkocht!'
    },
    text = {
        enter_usb =                                     '[E] - Voer USB in',
        system_is_rebooting =                           'Systeem is opnieuw aan het opstarten - %{rebootInfoPercentage} %',
        you_have_not_given_a_new_value =                'Je hebt geen nieuwe waarde opgegeven... Huidige waarde: %{crypto}',
        this_crypto_does_not_exist =                    'Deze crypto bestaat niet, beschikbare crypto(s): Qbit',
        you_have_not_provided_crypto_available_qbit =   'Je hebt geen Crypto opgegeven, beschikbaar: Qbit',
        the_qbit_has_a_value_of =                       'Qbit heeft een waarde van: %{crypto}',
        you_have_with_a_value_of =                      'Je hebt %{playerPlayerDataMoneyCrypto} QBit(s) met een waarde van: %{mypocket},-'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

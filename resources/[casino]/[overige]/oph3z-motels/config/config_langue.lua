Config.Langue = {
    ["NotPermissionsMotelSell"] = {"Dit motel is niet beschikbaar voor verkoop", "error", 5000},
    ["NotPermissionsMotelTransfer"] = {"Dit motel is niet beschikbaar voor vervoer", "error", 5000},
    ["RoomTimeExpired"] = {"Dit motel is niet beschikbaar voor vervoer", "error", 5000},
    ["RoomTimeUp"] = {"De duur van uw motelkamer is verlengd.", "success", 5000},
    ["InsufficientBankFunds"] = {"Er staat niet genoeg geld op uw bankrekening.", "error", 5000},
    ["InsufficientCashFunds"] = {"U heeft niet genoeg contant geld bij de hand.", "error", 5000},
    ["AlreadyOwnerEmployess"] = {"De persoon die u probeert in te huren, is al de eigenaar.", "error", 5000},
    ["PlayerNotFound"] = {"Speler niet gevonden", "error", 5000},
    ["NotEnoughMoneySalary"] = {"Uw salaris kon niet worden uitbetaald. Er zit niet genoeg geld in de kassa van het motel.", "error", 5000},
    ["NotEnoughMoney"] = {"We hebben niet genoeg geld in ons motelbedrijf voor deze transactie.", "error", 5000},
    ["RoomExitExpired"] = "Uw motelkamer is verwijderd omdat uw verblijf is verlopen en uw laatste locatie zich in de kamer bevond.",
    ["UpgradeRoom"] = function(roomNumber, roomType)
        return {"Het type motelkamer "..roomNumber.." is veranderd in "..roomType.."", "success", 5000}
    end,
    ["RoomRepaired"] = function(roomNumber)
        return {"Kamer gerepareerd: Kamer "..roomNumber.." is met succes heropend voor gebruik.", "success", 5000}
    end,
    ["UpgradeRoomRequest"] = function(roomNumber, roomType)
        return {"U heeft een typewijziging voor de motelkamer aangevraagd "..roomNumber.." naar "..roomType.."", "success", 5000}
    end,
    ["CancelRequest"] = function(roomNumber)
        return {"U heeft het kamerwijzigingsverzoek voor kamernummer afgewezen "..roomNumber..".", "success", 5000}
    end,
    ["EmployesSalary"] = function(salary)
        return {"Uw motelbedrijfssalaris is betaald. Ontvangen salaris: €"..salary..".", "success", 5000}
    end,
    ["NotEnoughMoneySalaryOwner"] = function(motelName)
        return {"Wegens onvoldoende saldo in de kassa van "..motelName.." motel, de salarissen van de werknemers kunnen niet worden betaald.", "error", 5000}
    end,
    ["MaxMotelBuznizLimit"] = function(motelCount)
        return {"Je kunt niet meer motelbedrijven kopen. Je hebt al een totaal van "..motelCount.." motelbedrijven.", "error", 5000}
    end,
    ["MaxMotelRoomLimit"] = function(motelCount)
        return {"U kunt niet meer motelkamers kopen. Je hebt al een totaal van "..motelCount.." Motel Kamers.", "error", 5000}
    end,
    ["MaxMotelRoomFriendsimit"] = function(motelCount)
        return {"U kunt niet meer motelkamers kopen. Je hebt al een totaal van "..motelCount.." Motel Kamers.", "error", 5000}
    end,
    ["PurchaseMotelSuccess"] = function(motelName)
        return {"U heeft met succes het genoemde motelbedrijf gekocht "..motelName..". Een fijne dag verder!", "success", 5000}
    end,
    ["SaveDashboard"] = function(motelName)
        return {"U heeft de motelnaam succesvol gewijzigd in "..motelName..".", "success", 5000}
    end,
    ["MotelSellSuccess"] = function(motelName, sellPrice, tax, addPrice)
        return {"Motelverkoop"..motelName.." is verkocht. Verkoopprijs: €"..sellPrice.."BTW: €"..tax.."Totaalbedrag: €"..addPrice.."Dank voor uw aankoop.", "success", 5000}
    end,
    ["MotelTransferSuccess"] = function(motelName, transferFirstName, transferLastName)
        return {"Moteltransfer: U heeft uw motel overgedragen aan "..transferFirstName.." "..transferLastName..".\n\nMotelnaam: "..motelName, "success", 5000}
    end,
    ["MotelTransferSuccess2"] = function(motelName)
        return {"Moteltransfer Het motel met de naam "..motelName.." is naar u overgedragen.", "success", 5000}
    end,
    ["AcceptRoomOffer"] = function(motelName, roomNumber, price)
        return {"Motelkamerhuur U heeft een kamernummer gehuurd "..roomNumber.." bij "..motelName.." voor €"..price..".\n\nEen fijne dag verder!", "success", 5000}
    end,
    ["AlreadyFriends"] = function(firstName, lastName)
        return {"al vrienden", firstName.." "..lastName.." is al toegevoegd als vriend aan deze motelkamer.", "error", 5000}
    end,
    ["AddFriendsSuccess"] = function(firstName, lastName)
        return {"Vriend toegevoegd: Je hebt succesvol toegevoegd "..firstName.." "..lastName.." als een vriend.", "success", 5000}
    end,
    ["KickFriendSuccess"] = function(firstName, lastName)
        return {"Vriend er uit geschopt: Je hebt met succes "..firstName.." "..lastName.." uit de kamer gestuurt", "success", 5000}
    end,
    ["RankDownSuccess"] = function(name)
        return {"Rang omlaag: De rang van "..name.." is afgenomen.", "success", 5000}
    end,
    ["RankUpSuccess"] = function(name)
        return {"Rang hoger: De rang van "..name.." is toegenomen.", "success", 5000}
    end,
    ["SalaryChangeSuccess"] = function(name, newsalary)
        return {"Salariswijziging: Het salaris van "..name.." is bijgewerkt naar €"..newsalary..".", "success", 5000}
    end,
    ["AlreadyEmployee"] = function(name)
        return {"De persoon die u probeert in te huren, "..name..", is al werknemer.", "error", 5000}
      end,
    ["JobOfferAccepted"] = function (motelname)
        return {"Vacatureaanbod: U heeft het vacatureaanbod van "..motelname.." motel.", "success", 5000}
    end
}
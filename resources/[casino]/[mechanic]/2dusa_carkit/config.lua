----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                    	----
----------------------------------------------------------------

----------------------------------------------------------------
----                        OPTIONS                         ----
----------------------------------------------------------------
Config = {}
Config.FixAllWheels = false -- Fix all wheels when minigame done or just fix closest
Config.StopAction = 'X' -- Key to stop action whatever you doing 

Config.RemoveItems = true -- Remove item when process done
Config.Items = { -- Item spawn codes
    repairItem = 'repairkit',
    cleanItem = 'cleaningkit',
    tyreItem = 'tyrekit',
    solidWheel = 'wheel'
}

----------------------------------------------------------------
----                  CONFIGURE LANGUAGE                    ----
----------------------------------------------------------------
Config.Locale = 'nl' -- en / de / fr / es / tr
Config.Translations = {
    ['en'] = {
        ['deletetyre'] = "Delete Burst Tyre",
        ['cantrepair'] = "You cant repair your vehicle when you are inside it",
        ['repairdone'] = "Vehicle repaired successfully!",
        ['stoprepair'] = "Stop Repair",
        ['nonearby'] = "No vehicle nearby!",
        ['nonearbytire'] = "No tire nearby!",
        ['tyredone'] = "Finished tyre repair",
        ['tyrealreadygood'] = "This tyre is already in a good condition",
        ['cleandone'] = "Your vehicle has been cleaned!",
    },
    ['nl'] = {
        ['deletetyre'] = "Burst-band verwijderen",
        ['cantrepair'] = "U kunt uw voertuig niet repareren als u erin zit",
        ['repairdone'] = "Voertuig succesvol gerepareerd!",
        ['stoprepair'] = "Reparatie stoppen",
        ['nonearby'] = "Geen voertuig in de buurt!",
        ['nonearbytire'] = "Geen band in de buurt!",
        ['tyredone'] = "Bandenreparatie voltooid",
        ['tyrealreadygood'] = "Deze band verkeert al in een goede staat",
        ['cleandone'] = "Uw voertuig is gereinigd!",
    },
    ['de'] = {
        ['deletetyre'] = "Reifen platzen löschen",
        ['cantrepair'] = "Du kannst dein Fahrzeug nicht reparieren, wenn du drin bist",
        ['repairdone'] = "Fahrzeug erfolgreich repariert!",
        ['stoprepair'] = "Reparatur abbrechen",
        ['nonearby'] = "Kein Fahrzeug in der Nähe!",
        ['nonearbytire'] = "Kein Reifen in der Nähe!",
        ['tyredone'] = "Reifenreparatur abgeschlossen",
        ['tyrealreadygood'] = "Dieser Reifen ist bereits in gutem Zustand",
        ['cleandone'] = "Dein Fahrzeug wurde gereinigt!"              
    },
    ['es'] = {
        ['deletetyre'] = "Eliminar neumático reventado",
        ['cantrepair'] = "No puedes reparar tu vehículo cuando estás dentro de él",
        ['repairdone'] = "¡Vehículo reparado exitosamente!",
        ['stoprepair'] = "Detener reparación",
        ['nonearby'] = "¡No hay ningún vehículo cercano!",
        ['nonearbytire'] = "¡No hay neumático cercano!",
        ['tyredone'] = "Reparación de neumático terminada",
        ['tyrealreadygood'] = "Este neumático ya está en buen estado",
        ['cleandone'] = "¡Tu vehículo ha sido limpiado!"          
    },
    ['fr'] = {
        ['deletetyre'] = "Supprimer pneu éclaté",
        ['cantrepair'] = "Vous ne pouvez pas réparer votre véhicule lorsque vous êtes à l'intérieur",
        ['repairdone'] = "Véhicule réparé avec succès !",
        ['stoprepair'] = "Arrêter la réparation",
        ['nonearby'] = "Aucun véhicule à proximité !",
        ['nonearbytire'] = "Aucun pneu à proximité !",
        ['tyredone'] = "Réparation du pneu terminée",
        ['tyrealreadygood'] = "Ce pneu est déjà en bon état",
        ['cleandone'] = "Votre véhicule a été nettoyé !"                    
    },
    ['tr'] = {
        ['deletetyre'] = "Lastiği Sil",
        ['cantrepair'] = "Araç içindeyken aracınızı tamir edemezsiniz",
        ['repairdone'] = "Araç başarıyla tamir edildi!",
        ['stoprepair'] = "Tamiri Durdur",
        ['nonearby'] = "Yakınında araç yok!",
        ['nonearbytire'] = "Yakınında lastik yok!",
        ['tyredone'] = "Lastik tamiri tamamlandı",
        ['tyrealreadygood'] = "Bu lastik zaten iyi durumda",
        ['cleandone'] = "Araçınız temizlendi!"
    },
}
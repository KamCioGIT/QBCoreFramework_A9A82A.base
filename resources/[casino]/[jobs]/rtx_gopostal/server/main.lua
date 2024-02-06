QBCore = exports[Config.QBCoreFrameworkResourceName]:GetCoreObject()

local displayurl = ""

counter1data = ""
counter2data = ""

function SecondsToMinutes(value)
	local ms = tonumber(value)
	return math.floor(ms / 60)..":"..(ms % 60)
end

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:CheckMissionProgressFinal", function(source, cb, vehicledamage)
	local playersource = source
	local missiondata = GetPlayerMissionDataX(tonumber(playersource))
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer.PlayerData.job.name == "gopostal" or Config.GoPostalJobForEveryone == true then	
		if missiondata == nil then
			table.insert(PlayerGoPostalMissionData, {
				id = tonumber(playersource),
				inmission = false,					
				missionstarttime = 0,
				missionreward = 0,
				selectedmission = "",
				missionpart = "",
				missionpackagedeliverydata = {remainingshipments = 10, nextshipmentid = nil},
				missionvehicledata = {
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},	
					{taken = false},
					{taken = false},	
				},				
			})	
			cb(false)
		else
			if missiondata.inmission == true then
				if missiondata.selectedmission == "packagesdelivery" and missiondata.missionpart == "packagesdeliverygopostalofficemissionend" and missiondata.missionpackagedeliverydata.remainingshipments == 0 then
					local timereformated = ("%.3f"):format((GetGameTimer() - missiondata.missionstarttime)/1000)
					missiondata.missionstarttime = SecondsToMinutes(math.floor(tonumber(timereformated)))
					missiondata.missionreward = Config.MissionReward.packagedelivery
					if Config.MissionBonusVehicleNoDamage.bonuspackages then
						local gopostalmaximumenginehealth = 1000
						local gopostalenginehealth = vehicledamage
						local calculatednumber = math.floor(gopostalenginehealth / gopostalmaximumenginehealth * 100)
						local gopostaldamagebonus = 0
						if calculatednumber >= 90 and calculatednumber <= 100 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardpackages*1
						elseif calculatednumber >= 70 and calculatednumber <= 90 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardpackages*0.70	
						elseif calculatednumber >= 50 and calculatednumber <= 70 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardpackages*0.50		
						elseif calculatednumber >= 25 and calculatednumber <= 50 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardpackages*0.25
						elseif calculatednumber >= 1 and calculatednumber <= 25 then
							gopostaldamagebonus = 0
						end	
						missiondata.missionreward = missiondata.missionreward+gopostaldamagebonus
					end
					local missiondatacurrent = {completed = true, finishedtime = missiondata.missionstarttime, missionreward = missiondata.missionreward}
					cb(missiondatacurrent)
				elseif missiondata.selectedmission == "warehousedelivery" and missiondata.missionpart == "warehousedeliverygopostalofficemissionend" then
					local timereformated = ("%.3f"):format((GetGameTimer() - missiondata.missionstarttime)/1000)
					missiondata.missionstarttime = SecondsToMinutes(math.floor(tonumber(timereformated)))
					missiondata.missionreward = Config.MissionReward.warehousedelivery
					if Config.MissionBonusVehicleNoDamage.bonuswarehouse then
						local gopostalmaximumenginehealth = 1000
						local gopostalenginehealth = vehicledamage
						local calculatednumber = math.floor(gopostalenginehealth / gopostalmaximumenginehealth * 100)
						local gopostaldamagebonus = 0
						if calculatednumber >= 90 and calculatednumber <= 100 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardwarehouse*1
						elseif calculatednumber >= 70 and calculatednumber <= 90 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardwarehouse*0.70	
						elseif calculatednumber >= 50 and calculatednumber <= 70 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardwarehouse*0.50		
						elseif calculatednumber >= 25 and calculatednumber <= 50 then
							gopostaldamagebonus = Config.MissionBonusVehicleNoDamage.bonusrewardwarehouse*0.25
						elseif calculatednumber >= 1 and calculatednumber <= 25 then
							gopostaldamagebonus = 0
						end	
						missiondata.missionreward = missiondata.missionreward+gopostaldamagebonus
					end
					local missiondatacurrent = {completed = true, finishedtime = missiondata.missionstarttime, missionreward = missiondata.missionreward}
					cb(missiondatacurrent)				
				else
					local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
					local resetedvehicledata = {
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},	
						{taken = false},
						{taken = false},	
					}		
					missiondata.inmission = false
					missiondata.missionstarttime = 0
					missiondata.missionreward = 0					
					missiondata.selectedmission = ""
					missiondata.missionpart = ""
					missiondata.missionpackagedeliverydata = reseteddeliverydata
					missiondata.missionvehicledata = resetedvehicledata		
					cb(false)	
				end
			else
				local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
				local resetedvehicledata = {
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},	
					{taken = false},
					{taken = false},	
				}		
				missiondata.inmission = false
				missiondata.missionstarttime = 0
				missiondata.missionreward = 0				
				missiondata.selectedmission = ""
				missiondata.missionpart = ""
				missiondata.missionpackagedeliverydata = reseteddeliverydata
				missiondata.missionvehicledata = resetedvehicledata		
				cb(false)
			end
		end
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:MissionEndCheck", function(source, cb)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	local missiondata = GetPlayerMissionDataX(tonumber(playersource))
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer.PlayerData.job.name == "gopostal" or Config.GoPostalJobForEveryone == true then	
		if missiondata == nil then
			table.insert(PlayerGoPostalMissionData, {
				id = tonumber(playersource),
				inmission = false,									
				missionstarttime = 0,
				missionreward = 0,
				selectedmission = "",
				missionpart = "",
				missionpackagedeliverydata = {remainingshipments = 10, nextshipmentid = nil},
				missionvehicledata = {
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},	
					{taken = false},
					{taken = false},	
				},				
			})	
			cb(false)
		else
			if missiondata.inmission == true then
				if missiondata.selectedmission == "packagesdelivery" and missiondata.missionpart == "packagesdeliverygopostalofficemissionend" and missiondata.missionpackagedeliverydata.remainingshipments == 0 then
					local missiondatafinal = {completed = true, missionreward = missiondata.missionreward}
					xPlayer.Functions.AddMoney('cash', missiondata.missionreward)
					cb(missiondatafinal)
					local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
					local resetedvehicledata = {
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},	
						{taken = false},
						{taken = false},	
					}		
					missiondata.inmission = false
					missiondata.missionstarttime = 0
					missiondata.missionreward = 0		
					missiondata.selectedmission = ""
					missiondata.missionpart = ""
					missiondata.missionpackagedeliverydata = reseteddeliverydata
					missiondata.missionvehicledata = resetedvehicledata	
				elseif missiondata.selectedmission == "warehousedelivery" and missiondata.missionpart == "warehousedeliverygopostalofficemissionend" then
					local missiondatafinal = {completed = true, missionreward = missiondata.missionreward}
					xPlayer.Functions.AddMoney('cash', missiondata.missionreward)
					cb(missiondatafinal)
					local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
					local resetedvehicledata = {
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},	
						{taken = false},
						{taken = false},	
					}		
					missiondata.inmission = false
					missiondata.missionstarttime = 0
					missiondata.missionreward = 0		
					missiondata.selectedmission = ""
					missiondata.missionpart = ""
					missiondata.missionpackagedeliverydata = reseteddeliverydata
					missiondata.missionvehicledata = resetedvehicledata							
				else
					local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
					local resetedvehicledata = {
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},	
						{taken = false},
						{taken = false},	
					}		
					missiondata.inmission = false
					missiondata.missionstarttime = 0
					missiondata.missionreward = 0		
					missiondata.selectedmission = ""
					missiondata.missionpart = ""
					missiondata.missionpackagedeliverydata = reseteddeliverydata
					missiondata.missionvehicledata = resetedvehicledata					
					cb(false)	
				end
			else
				local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
				local resetedvehicledata = {
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},	
					{taken = false},
					{taken = false},	
				}		
				missiondata.inmission = false
				missiondata.missionstarttime = 0
				missiondata.missionreward = 0					
				missiondata.selectedmission = ""
				missiondata.missionpart = ""
				missiondata.missionpackagedeliverydata = reseteddeliverydata
				missiondata.missionvehicledata = resetedvehicledata		
				cb(false)
			end
		end
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:QuitMission", function(source, cb)
	local playersource = source
	local missiondata = GetPlayerMissionDataX(tonumber(playersource))
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer.PlayerData.job.name == "gopostal" or Config.GoPostalJobForEveryone == true then	
		if missiondata == nil then
			table.insert(PlayerGoPostalMissionData, {
				id = tonumber(playersource),
				inmission = false,									
				missionstarttime = 0,
				missionreward = 0,
				selectedmission = "",
				missionpart = "",
				missionpackagedeliverydata = {remainingshipments = 10, nextshipmentid = nil},
				missionvehicledata = {
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},
					{taken = false},	
					{taken = false},
					{taken = false},	
				},				
			})
		else
			if missiondata.inmission == true then
				if missiondata.selectedmission == "packagesdelivery" or missiondata.selectedmission == "warehousedelivery" then
					local reseteddeliverydata = {remainingshipments = 10, nextshipmentid = nil}
					local resetedvehicledata = {
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},
						{taken = false},	
						{taken = false},
						{taken = false},	
					}		
					missiondata.inmission = false
					missiondata.missionstarttime = 0
					missiondata.missionreward = 0					
					missiondata.selectedmission = ""
					missiondata.missionpart = ""
					missiondata.missionpackagedeliverydata = reseteddeliverydata
					missiondata.missionvehicledata = resetedvehicledata					
					cb(true)			
				end
			end
		end
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:SendLetter", function(source, cb, letterfirstname, letterlastname, lettertext)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local sendername = {firstname = xPlayer.PlayerData.charinfo.firstname, lastname = xPlayer.PlayerData.charinfo.lastname}
		MySQL.Async.execute('INSERT INTO gopostalletters (sender,senderfirstname,senderlastname,recipientfirstname,recipientlastname,lettertext) VALUES (@sender,@senderfirstname,@senderlastname,@recipientfirstname,@recipientlastname,@lettertext)',
		{
			['@sender'] = xPlayer.PlayerData.citizenid,
			['@senderfirstname'] = sendername.firstname,
			['@senderlastname'] = sendername.lastname,
			['@recipientfirstname'] = letterfirstname,
			['@recipientlastname'] = letterlastname,
			['@lettertext'] = lettertext,
		}, function (sended)
			cb(true)				
		end)			
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:DeleteLetter", function(source, cb, letterid)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local recipientname = {firstname = xPlayer.PlayerData.charinfo.firstname, lastname = xPlayer.PlayerData.charinfo.lastname}	
		MySQL.Async.fetchAll("SELECT * FROM gopostalletters WHERE id = @id", {
			["@id"] = letterid
		}, function(letterdata)
			if letterdata[1] ~= nil then
				if tostring(letterdata[1].recipientfirstname) == recipientname.firstname and tostring(letterdata[1].recipientlastname) == recipientname.lastname then
					MySQL.Async.execute('DELETE FROM gopostalletters WHERE id = @id', {
						['@id'] = letterid
					}, function(changed)
						cb(true)			
					end)	
				else
					cb(false)
				end
			end
		end)		
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:GetInventory", function(source, cb)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local playerinventory = {}
		for k in pairs(xPlayer.PlayerData.items) do
			if Config.ItemBlacklist[xPlayer.PlayerData.items[k].name] == nil then
				local itemlabel = ""
				if QBCore.Shared.Items[xPlayer.PlayerData.items[k].name] ~= nil then
					itemlabel = QBCore.Shared.Items[xPlayer.PlayerData.items[k].name]["label"]
				else
					itemlabel = xPlayer.PlayerData.items[k].name
				end
				local itemamount = 1
				if xPlayer.PlayerData.items[k].amount ~= nil then
					itemamount = xPlayer.PlayerData.items[k].amount
				elseif xPlayer.PlayerData.items[k].count ~= nil then	
					itemamount = xPlayer.PlayerData.items[k].count
				end
				table.insert(playerinventory, {
					name = xPlayer.PlayerData.items[k].name, 
					label = itemlabel, 
					count = itemamount, 			
				})	
			end
		end			
		cb(playerinventory)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:CheckItem", function(source, cb, itemname, itemcount)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		if Config.ItemBlacklist[itemname] == nil then
			if xPlayer.Functions.GetItemByName(itemname).amount >= itemcount then
				cb(true)
			else
				cb(false)
			end		
		else
			cb(false)
		end
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:SendPackage", function(source, cb, packagefirstname, packagelastname, packageprice, packageitems)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local itemchecked = false
		if #packageitems == 0 then
			cb(false)
		end
		for i, packageitem in ipairs(packageitems) do
			if Config.ItemBlacklist[packageitem.itemname] == nil then
				if xPlayer.Functions.GetItemByName(packageitem.itemname).amount >= packageitem.itemcount then
					itemchecked = true
					xPlayer.Functions.RemoveItem(packageitem.itemname, packageitem.itemcount)
				else
					itemchecked = false
					cb(false)
					break
				end		
			else
				itemchecked = false
				cb(false)
				break
			end
		end			
		if itemchecked == true then
			local sendername = {firstname = xPlayer.PlayerData.charinfo.firstname, lastname = xPlayer.PlayerData.charinfo.lastname}
			MySQL.Async.execute('INSERT INTO gopostalpackages (sender,senderfirstname,senderlastname,recipientfirstname,recipientlastname,packageprice,packageitems) VALUES (@sender,@senderfirstname,@senderlastname,@recipientfirstname,@recipientlastname,@packageprice,@packageitems)',
			{
				['@sender'] = xPlayer.PlayerData.citizenid,
				['@senderfirstname'] = sendername.firstname,
				['@senderlastname'] = sendername.lastname,
				['@recipientfirstname'] = packagefirstname,
				['@recipientlastname'] = packagelastname,
				['@packageprice'] = packageprice,
				['@packageitems'] = json.encode(packageitems),
			}, function (sended)
				cb(true)				
			end)
		end
	else
		cb(false)
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:ReturnPackage", function(source, cb, packageid)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local recipientname = {firstname = xPlayer.PlayerData.charinfo.firstname, lastname = xPlayer.PlayerData.charinfo.lastname}	
		MySQL.Async.fetchAll("SELECT * FROM gopostalpackages WHERE id = @id", {
			["@id"] = packageid
		}, function(packagedata)
			if packagedata[1] ~= nil then
				if tostring(packagedata[1].recipientfirstname) == recipientname.firstname and tostring(packagedata[1].recipientlastname) == recipientname.lastname then
					MySQL.Async.execute("UPDATE gopostalpackages SET recipientfirstname = @recipientfirstname, recipientlastname = @recipientlastname, packageprice = @packageprice WHERE id = @id", {
						['@id'] = packageid,
						['@recipientfirstname'] = tostring(packagedata[1].senderfirstname),
						['@recipientlastname'] = tostring(packagedata[1].senderlastname),
						['@packageprice'] = 0
					}, function(changed)
						cb(true)					
					end)
				else
					cb(false)
				end
			end
		end)			
	end
end)

RTXGOPOSTAL.RegisterServerCallback("rtx_gopostal:TakePackage", function(source, cb, packageid)
	local playersource = source
	local xPlayer = QBCore.Functions.GetPlayer(playersource)
	if xPlayer then
		local recipientname = {firstname = xPlayer.PlayerData.charinfo.firstname, lastname = xPlayer.PlayerData.charinfo.lastname}
		MySQL.Async.fetchAll("SELECT * FROM gopostalpackages WHERE id = @id", {
			["@id"] = packageid
		}, function(packagedata)
			if packagedata[1] ~= nil then
				if tostring(packagedata[1].recipientfirstname) == recipientname.firstname and tostring(packagedata[1].recipientlastname) == recipientname.lastname then
					if xPlayer.Functions.GetMoney('cash') >= tonumber(packagedata[1].packageprice) then
						xPlayer.Functions.RemoveMoney('cash', tonumber(packagedata[1].packageprice))	
						local packageitems = json.decode(packagedata[1].packageitems)	
						for i, packageitem in ipairs(packageitems) do	
							xPlayer.Functions.AddItem(packageitem.itemname, packageitem.itemcount, false, {})
						end		
						MySQL.Async.execute('DELETE FROM gopostalpackages WHERE id = @id', {
							['@id'] = packageid
						}, function(changed)
							cb(true)			
						end)							
					else
						cb(false)
					end
				else
					cb(false)
				end
			end
		end)			
	end
end)

local function checkqueue()
	SetTimeout(10000, function()
		local queuefound = false
		for i, queuedata in ipairs(Config.GoPostalQueueCounter1) do
			if queuedata.used == false then
				counter2data = tostring(i)
				local xPlayer = QBCore.Functions.GetPlayer(queuedata.playerid)
				if xPlayer and queuedata.called == false then			
					TriggerClientEvent("rtx_gopostal:QueueCalled", queuedata.playerid)
					if Config.GoPostalServiceVoice then
						TriggerClientEvent("rtx_gopostal:Voice", -1, "number "..i.." at the counter 2")
					end
					queuedata.called = true
					queuefound = true			
				else
					queuedata.used = true
				end
				break
			end
		end		
		for i, queuedata in ipairs(Config.GoPostalQueueCounter2) do
			if queuedata.used == false  then
				counter1data = tostring(i)
				local xPlayer = QBCore.Functions.GetPlayer(queuedata.playerid)
				if xPlayer and queuedata.called == false then		
					TriggerClientEvent("rtx_gopostal:QueueCalled", queuedata.playerid)
					if Config.GoPostalServiceVoice then
						TriggerClientEvent("rtx_gopostal:Voice", -1, "number "..i.." at the counter 7")
					end
					queuedata.called = true
					queuefound = true					
				else
					queuedata.used = true
				end
				break
			end
		end		
		if queuefound then
			displayurl = "?data1="..counter2data.."&data2="..counter1data..""
			TriggerClientEvent("rtx_gopostal:SetQueueUrl", -1, "?data1="..counter2data.."&data2="..counter1data.."")
		end
		checkqueue()
	end)
end

Citizen.CreateThread(function()
	checkqueue()
end)
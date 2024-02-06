Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(1196963537805922486)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('SasVegasRP Large')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('This is a lage icon with text')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_name')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('This is a lsmall icon with text')


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join Server", "fivem://85.215.81.46/localhost:30120")
        SetDiscordRichPresenceAction(1, "Join Discord", "https://discord.gg/bECZdaADpY")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)
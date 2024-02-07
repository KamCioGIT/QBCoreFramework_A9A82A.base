Lib = {

	NumChar = {},
	LetChar = {},

	-- Function to generate random numbers:
	GetRandomNumber = function(length)
		math.randomseed(GetGameTimer())
		if length > 0 then
			return Lib.GetRandomNumber(length - 1) .. Lib.NumChar[math.random(1, #Lib.NumChar)]
		else
			return ''
		end
	end,

	-- Function to generate random letters:
	GetRandomLetter = function(length)
		Citizen.Wait(1)
		math.randomseed(GetGameTimer())
		if length > 0 then
			return Lib.GetRandomLetter(length - 1) .. Lib.LetChar[math.random(1, #Lib.LetChar)]
		else
			return ''
		end
	end,
	
	RoundNumber = function(num, numDecimalPlaces)
		local mult = 10^(numDecimalPlaces or 0)
		return math.floor(num * mult + 0.5) / mult
	end,
	
	Trim = function(input)
		if input then
			return (string.gsub(input, "^%s*(.-)%s*$", "%1"))
		else
			return nil
		end
	end,

	Type = function(value)
		return type(value)
	end,

	CreateObject = function(model, coords, heading, cb)
		if type(model) == 'string' then model = joaat(model) end
		local coords = type(coords) == "vector3" and coords or vector3(coords.x, coords.y, coords.z)
		local entity = CreateObject(model, coords, true, true)
		local attempts = 0
		while not DoesEntityExist(entity) and attempts < 50 do
			Wait(1)
			attempts = attempts + 1
		end
		SetEntityHeading(entity, heading)
		cb(NetworkGetNetworkIdFromEntity(entity))
	end,
}
	
for i = 48,  57 do table.insert(Lib.NumChar, string.char(i)) end
for i = 65,  90 do table.insert(Lib.LetChar, string.char(i)) end
for i = 97, 122 do table.insert(Lib.LetChar, string.char(i)) end

Core.RegisterCallback('t1ger_lib:server:createObject', function(source, cb, model, coords, heading)
	Lib.CreateObject(model, coords, heading, cb)
end)
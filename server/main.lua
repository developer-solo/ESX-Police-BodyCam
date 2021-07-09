ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT firstname,lastname FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			firstname = identity['firstname'],
			lastname = identity['lastname'],
		}
	else
		return nil
	end
end

ESX.RegisterServerCallback('solo_bodycam:getName', function(source, cb)
    local name = getIdentity(source)
    cb(string.upper(name.firstname .. " " .. name.lastname))
end)

ESX.RegisterUsableItem('bodycam', function(source)
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 TriggerClientEvent('solo_bodycam:itembodycam', source, xPlayer.getInventoryItem('bodycam').count)
end)

if GetCurrentResourceName() ~= "solo_bodycam" then
    print("                                             #")
    print("                                             ###")
    print("###### ###### ###### ###### ######  ##############")
    print("#      #    # #    # #    # #    #  ################    Rename the script  '" .. GetCurrentResourceName() .. "' back to  'solo_bodycam'")
    print("###    ###### ###### #    # ######  ##################  Do not rename the script!")
    print("#      # ##   # ##   #    # # ##    ################    Why change it when you didn't do it !!!")
    print("###### #   ## #   ## ###### #   ##  ##############")
    print("                                             ###")
    print("                                             #")
    StopResource(GetCurrentResourceName())
end

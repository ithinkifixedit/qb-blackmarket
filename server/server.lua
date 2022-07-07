QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

--- SD CARD USEABLITY

QBCore.Functions.CreateUseableItem("sdcard", function(source, item)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Usesdcard", src)
	end
end)

--- Removes sd card after opening black market

RegisterServerEvent('blackmarket:removeitem')
AddEventHandler('blackmarket:removeitem', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    ply.Functions.RemoveItem("jokercard", 1)
end)
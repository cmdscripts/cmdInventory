local ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('useItem')
AddEventHandler('useItem', function(itemName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.removeInventoryItem(itemName, 1)
    else
        print('no xplayer')
    end
end)

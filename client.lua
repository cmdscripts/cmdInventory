local ESX = exports["es_extended"]:getSharedObject()

RageMenu:RegisterKey("F2", "F2", "Open Inventory", function()
    OpenInventoryMenu()
end)

function OpenInventoryMenu()
    local mainMenu = RageMenu:CreateMenu('Inventory', 'Inventory')
    local playerInventory = ESX.GetPlayerData().inventory

    for a, b in pairs(playerInventory) do
        local subMenu = RageMenu:CreateMenu(b.label, b.name)

        subMenu:AddButton('Use', 'Use ' .. b.label):On('click', function()
            TriggerServerEvent('useItem', b.name)
        end)

        mainMenu:AddSubmenu(subMenu, b.label, b.name)
    end

    RageMenu:OpenMenu(mainMenu)
end
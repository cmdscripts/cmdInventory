local ESX = exports["es_extended"]:getSharedObject()

RageMenu:RegisterKey("F3", "F3", "Open Inventory", function()
    OpenInventoryMenu()
end)

function OpenInventoryMenu()
    local mainMenu = RageMenu:CreateMenu('Inventory', 'Inventory')
    local playerWeight

    ESX.TriggerServerCallback('getPlayerWeight', function(weight)

        mainMenu:AddPlaceholder("Weight: " .. weight .. " kg")
        local playerInventory = ESX.GetPlayerData().inventory

        for a, b in pairs(playerInventory) do
            local subMenu = RageMenu:CreateMenu(b.label, b.label)

            subMenu:AddButton('Use', 'Use ' .. b.label):On('click', function()
                TriggerServerEvent('useItem', b.name)
            end)

            subMenu:AddButton('Give', 'Give ' .. b.label):On('click', function()
                -- code
            end)

            subMenu:AddButton('Drop', 'Drop ' .. b.label):On('click', function()
                TriggerServerEvent('dropItem', b.name)
            end)

            mainMenu:AddSubmenu(subMenu, b.label, b.label)
        end

        RageMenu:OpenMenu(mainMenu)
    end)
end

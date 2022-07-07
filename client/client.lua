QBCore = nil
PlayerData = {}
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


--- SD CARD Functions // Waypoint
RegisterNetEvent("consumables:client:Usesdcard", function()
    local ped = PlayerPedId()
    RequestAnimDict('missheist_jewel@hacking')
    TaskPlayAnim(ped, "missheist_jewel@hacking", "hack_loop", 8.0, 1.0, -1, 9, 0, 0, 0, 0)
	QBCore.Functions.Progressbar("decrypt_sdcard", "Decrypting SDCard", 15000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
		}, {}, {}, {}, function()
		local ped = PlayerPedId()
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sdcard"], "remove")
        SetNewWaypoint(Config.Waypoint.coords.x, Config.Waypoint.coords.y)
		TriggerEvent("DoLongHudText", 'Check GPS for location!')
	end)
end)

--PED SPAWNING
local BLACKMARKETNPC2 = { x=-174.91,y=-1266.04,z=32.6, rotation = 110.29, NetworkSync = false}
Citizen.CreateThread(function()
  BlackmarketHash2 = GetHashKey("mp_m_bogdangoon")
  RequestModel(BlackmarketHash2)
  while not HasModelLoaded(BlackmarketHash2) do
       Wait(1)
  end
  pedblackmarket2 = CreatePed(0, BlackmarketHash2 , BLACKMARKETNPC2.x,BLACKMARKETNPC2.y,BLACKMARKETNPC2.z, BLACKMARKETNPC2.rotation, BLACKMARKETNPC2.NetworkSync)
  FreezeEntityPosition(pedblackmarket2, true)
  SetEntityInvincible(pedblackmarket2, true)
  SetBlockingOfNonTemporaryEvents(pedblackmarket2, true)
  TaskStartScenarioInPlace(pedblackmarket2, "EAR_TO_TEXT_FAT", 0, true)
end)

--- Blackmarket Shop Events 
RegisterNetEvent('ithinkifixedit:shops:blackmarket')
AddEventHandler('ithinkifixedit:shops:blackmarket', function()  
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        if result then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "jail_slushy" , {
                ['label'] = "Black Market",
                ['items'] = {
                    [1] = {
                        name = "weapon_combatpistol",
                        price = 50,
                        amount = 250,
                        info = {},
                        type = "item",
                        slot = 1,
                    },
                    [2] = {
                        name = "weapon_vintagepistol",
                        price = 75,
                        amount = 250,
                        info = {},
                        type = "item",
                        slot = 2,
                    },
                    [3] = {
                        name = "weapon_dbshotgun",
                        price = 100,
                        amount = 250,
                        info = {},
                        type = "item",
                        slot = 3,
                    },
                    [4] = {
                        name = "weapon_compactrifle",
                        price = 2500,
                        amount = 250,
                        info = {},
                        type = "item",
                        slot = 4,
                    },
                    [5] = {
                        name = "weapon_gusenberg",
                        price = 100,
                        amount = 250,
                        info = {},
                        type = "item",
                        slot = 5,
                    },
                }
            })
            TriggerServerEvent('blackmarket:removeitem')
        else
            TriggerEvent("DoLongHudText", "Errr Wheres my playing card?", 2)
        end
    end, "jokercard")
end)


--- Near black market Text Check
Citizen.CreateThread(function()
  while true do
  Citizen.Wait(10)
      local coords = GetEntityCoords(GetPlayerPed(-1))
      if (GetDistanceBetweenCoords(coords, Config.Blackmarket.coords.x, Config.Blackmarket.coords.y, Config.Blackmarket.coords.z, true) < 15.0)  then
          DrawText3D2(Config.Blackmarket.coords.x, Config.Blackmarket.coords.y, Config.Blackmarket.coords.z, "~y~[E] ~w~Open Blackmarket Dealer")
          if IsControlJustPressed (0, 38) then 
            TriggerEvent('ithinkifixedit:shops:blackmarket')
          end
      end
  end
end)




-- Draw Text function
function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
  local onScreen,_x,_y=World3dToScreen2d(x, y, z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end

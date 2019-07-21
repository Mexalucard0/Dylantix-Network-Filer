can_putbag = true

Citizen.CreateThread(function()
  while true do
    Wait(0)
    while can_putbag do
      Wait(0)
      if not IsPedInAnyVehicle(GetPlayerPed(-1),false) then
        if IsControlJustPressed(0,74) then
          TriggerServerEvent('closest')
        end
      end
    end
  end
end)

local a = 0

function openGui()
	SetNuiFocus(false)
	SendNUIMessage({openNUI = true})
end

function closeGui()
	SetNuiFocus(false)
	SendNUIMessage({openNUI = false})
end

RegisterNetEvent('pune_headbag')
AddEventHandler('pune_headbag', function()
  a= a + 1
  if a % 2 ~= 0 then
    local playerPed = GetPlayerPed(-1)
    bag = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(bag, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
    openGui()
    can_putbag = false
  else
    DeleteEntity(bag)
    closeGui()
    can_putbag = true
  end
end)

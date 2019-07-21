local KeyMarker = {1, 38}
local KeyMarkerName = "ENTER"

--local text_take = 'Pick up items ['..KeyMarkerName..']'
local text_take = "Tryk [~g~E~s~] for at samle posen op"


local dropList = {}


function DisplayHelpText(text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local px, py, pz = table.unpack(GetGameplayCamCoords())

  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x, _y)
  local factor = (string.len(text)) / 370
  DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end





RegisterNetEvent('DropSystem:drop')
AddEventHandler('DropSystem:drop', function(item, amount)
  local bag = SetBagOnGround()
  TriggerServerEvent('DropSystem:create', bag, item, amount)
end)

RegisterNetEvent('DropSystem:remove')
AddEventHandler('DropSystem:remove', function(bag)
  if dropList[bag] ~= nil then
    dropList[bag] = nil
  end
end)

RegisterNetEvent('DropSystem:createForAll')
AddEventHandler('DropSystem:createForAll', function(bag)
  dropList[bag] = true
end)

function SetBagOnGround()
 x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
 Bag = GetHashKey("prop_paper_bag_small")
 RequestModel(Bag)
 while not HasModelLoaded(Bag) do
  Citizen.Wait(1)
 end
 local object = CreateObject(Bag, x, y, z-2, true, true, true) -- x+1
 PlaceObjectOnGroundProperly(object)
 local network = NetworkGetNetworkIdFromEntity(object)
 return network
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local ped = GetPlayerPed(-1)
    local pedCoord = GetEntityCoords(ped)
    for k,v in pairs(dropList) do
      if DoesObjectOfTypeExistAtCoords(pedCoord["x"], pedCoord["y"], pedCoord["z"], 1.3, GetHashKey("prop_paper_bag_small"), true) then
        Bag = GetClosestObjectOfType(pedCoord["x"], pedCoord["y"], pedCoord["z"], 1.3, GetHashKey("prop_paper_bag_small"), false, false, false)
        if NetworkGetNetworkIdFromEntity(Bag) == k then
          DisplayHelpText(text_take)
          if IsControlJustPressed(table.unpack(KeyMarker)) then
            TriggerServerEvent('DropSystem:take', k)
            DeleteBag(Bag)
          end
        end
      end
    end
  end
end)


function DeleteBag(Bag)
  SetEntityAsMissionEntity(Bag, true, true)
  DeleteObject(Bag)
end

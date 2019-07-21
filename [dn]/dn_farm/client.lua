local Farms = {
   x = 846.91369628906, y = -2525.9685058594, z = 40.827606201172 -- koka farm
   --x = 1919.2255859375, y = 4806.4262695313, z = 44.527889251709, -- koka farms
   --x = 356.31561279297, y = 6478.0458984375, z = 29.606895446777, -- koka farm  
  -- x = 1591.330078125, y = 3591.2387695313, z = 38.766532897949, -- koka fs
   --x = 567.30731201172, y = -3117.6791992188, z = 18.768550872803,
  -- x = -1888.9588623047, y = 2091.6857910156, z = 141.80706787109 
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(Farms.x, Farms.y, Farms.z, GetEntityCoords(GetPlayerPed(-1))) < 5.0 then
            if IsPedActiveInScenario(PlayerPedId()) then
                DrawText3D(Farms.x, Farms.y, Farms.z, "Tryk [~r~Z~w~] For at stoppe animation")
            else
                DrawText3D(Farms.x, Farms.y, Farms.z, "Tryk [~g~E~w~] for at starte animation")
                if IsControlJustPressed(0, 38) then
                     TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_PARKING_METER', 0, true)
                end
            end
        end
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(6)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
        local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 20,20,20,150)
end
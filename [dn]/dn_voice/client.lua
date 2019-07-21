local playerNamesDist = 10

Citizen.CreateThread(function()
    while true do
        for id = 0, 31 do
            if  ((NetworkIsPlayerActive( id )) and GetPlayerPed( id ) ~= GetPlayerPed( -1 )) then
                ped = GetPlayerPed( id )
 
                x1, y1, z1 = table.unpack( GetEntityCoords( GetPlayerPed( -1 ), true ) )
                x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( id ), true ) )
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
		local takeaway = 0.95

                if ((distance < playerNamesDist) and IsEntityVisible(GetPlayerPed(id))) ~= GetPlayerPed( -1 ) then
		    if NetworkIsPlayerTalking(id) then
			--DrawMarker(27,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 55, 255, 0, 0, 0, 0, 2, 0, 0, 0, 0)
            DrawMarker(27, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 55, 160, 205, 150, 0, 0, 2, 0, 0, 0, 0) 
        else
               -- DrawMarker(27, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0)   
		--	DrawMarker(27, x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 255, 255, 255, 50, 0, 0, 2, 0, 0, 0, 0)
            DrawMarker(27,x2,y2,z2 - takeaway, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 55, 255, 0, 0, 0, 0, 2, 0, 0, 0, 0)            
        end
                end  
            end
        end
        Citizen.Wait(0)
    end
end)

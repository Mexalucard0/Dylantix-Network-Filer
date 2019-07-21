local xnmark = xnmark or {}
local distance = 50.5999

xnmark.locations = {
	["Doomsday Facility"] = {
		["markin"] = {1441.8227539063,2947.4223632813,44.431385040283},
	--	["markin"] = {1287.3215332031,2846.0498046875,46.815780639648},
		["markout"] = {489.0622253418, 4785.3623046875, -58.929149627686},
		["locin"] = {483.2006225586, 4810.5405273438, -58.919288635254, 18.04705619812},
		["locout"] = {1267.4091796875, 2830.9741210938, 48.444499969482, 128.1668395996},
	},
}

function TeleportIntoInterior(locationdata, ent)
	local x,y,z,h = table.unpack(locationdata)
	DoScreenFadeOut(1000)
	while IsScreenFadingOut() do Citizen.Wait(0) end
	NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
	Wait(1000)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), h)
	NetworkFadeInEntity(GetPlayerPed(-1), 0)
	Wait(1000)
	FreezeEntityPosition(PlayerPedId(), false)
	SetGameplayCamRelativeHeading(0.0)
	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do Citizen.Wait(0)	end
end

function TeleportIntoInteriorVehicle(locationdata, ent)
	local x,y,z,h = table.unpack(locationdata)
	DoScreenFadeOut(1000)
	while IsScreenFadingOut() do Citizen.Wait(0) end
	NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
	Wait(1000)
	SetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false), x, y, z)
	SetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false), h)
	NetworkFadeInEntity(GetPlayerPed(-1), 0)
	Wait(1000)
	FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), false)
	SetGameplayCamRelativeHeading(0.0)
	DoScreenFadeIn(1000)
	while IsScreenFadingIn() do Citizen.Wait(0)	end
end

function SpawnFacility()
	interiorID = GetInteriorAtCoordsWithType(345.0041, 4842.001, -59.9997, "xm_x17dlc_int_02")
	
	if IsValidInterior(interiorID) then
		EnableInteriorProp(interiorID, "set_int_02_decal_01")
		EnableInteriorProp(interiorID, "set_int_02_lounge1")
		EnableInteriorProp(interiorID, "set_int_02_cannon")
		EnableInteriorProp(interiorID, "set_int_02_clutter1")
		EnableInteriorProp(interiorID, "set_int_02_crewemblem")	
		EnableInteriorProp(interiorID, "set_int_02_shell")
		EnableInteriorProp(interiorID, "set_int_02_security")
		EnableInteriorProp(interiorID, "set_int_02_sleep")
		EnableInteriorProp(interiorID, "set_int_02_trophy1")
		EnableInteriorProp(interiorID, "set_int_02_paramedic_complete")
		EnableInteriorProp(interiorID, "set_Int_02_outfit_paramedic")
		EnableInteriorProp(interiorID, "set_Int_02_outfit_serverfarm")
		SetInteriorPropColor(interiorID, "set_int_02_decal_01", 1)
		SetInteriorPropColor(interiorID, "set_int_02_lounge1", 1)
		SetInteriorPropColor(interiorID, "set_int_02_cannon", 1)
		SetInteriorPropColor(interiorID, "set_int_02_clutter1", 1)
		SetInteriorPropColor(interiorID, "set_int_02_shell", 1)
		SetInteriorPropColor(interiorID, "set_int_02_security", 1)
		SetInteriorPropColor(interiorID, "set_int_02_sleep", 1)
		SetInteriorPropColor(interiorID, "set_int_02_trophy1", 1)
		SetInteriorPropColor(interiorID, "set_int_02_paramedic_complete", 1)
		SetInteriorPropColor(interiorID, "set_Int_02_outfit_paramedic", 1)
		SetInteriorPropColor(interiorID, "set_Int_02_outfit_serverfarm", 1)
		RefreshInterior(interiorID)
	end	
end

function DespawnFacility()
	interiorID = GetInteriorAtCoordsWithType(345.0041, 4842.001, -59.9997, "xm_x17dlc_int_02")
	
	DisableInteriorProp(interiorID,  "set_int_02_decal_01")
	DisableInteriorProp(interiorID,  "set_int_02_lounge1")
	DisableInteriorProp(interiorID,  "set_int_02_cannon")
	DisableInteriorProp(interiorID,  "set_int_02_clutter1")
	DisableInteriorProp(interiorID,  "set_int_02_crewemblem")
	DisableInteriorProp(interiorID,  "set_int_02_shell")
	DisableInteriorProp(interiorID,  "set_int_02_security")
	DisableInteriorProp(interiorID,  "set_int_02_sleep")
	DisableInteriorProp(interiorID,  "set_int_02_trophy1")
	DisableInteriorProp(interiorID,  "set_int_02_paramedic_complete")
	DisableInteriorProp(interiorID,  "Set_Int_02_outfit_paramedic")
	DisableInteriorProp(interiorID,  "Set_Int_02_outfit_serverfarm")
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if not IsEntityDead(PlayerPedId(-1)) then
			for k,v in pairs(xnmark.locations) do
			
				local ix,iy,iz = table.unpack(v["markin"])
				local ox,oy,oz = table.unpack(v["markout"])
			
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 50.5999 then -- Outside Marker
					DrawMarker(2, ix,iy,iz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.75, 0.75, 0.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ix, iy, iz, true) < 1.0 then
						if k == "Doomsday Facility" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locin"], false)
								SpawnFacility()
							else
								FreezeEntityPosition(PlayerPedId(), true)
								SpawnFacility()
								TeleportIntoInterior(v["locin"], false)
							end
						elseif k == "Doomsday Finale" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locin"], false)
							else
								FreezeEntityPosition(PlayerPedId(), true)
								TeleportIntoInterior(v["locin"], false)
							end
						else		
							FreezeEntityPosition(PlayerPedId(), true)
							TeleportIntoInterior(v["locin"], false)
						end
					end
				end
				
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 50.5999 then -- Inside Marker
					DrawMarker(2, ox, oy, oz, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.75, 0.75, 0.75, 255, 255, 0, 100, false, true, 2, false, false, false, false)
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), ox, oy, oz, true) < 1.0 then
						if k == "Doomsday Facility" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locout"], false)
								DespawnFacility()
							else
								FreezeEntityPosition(PlayerPedId(), true)
								TeleportIntoInterior(v["locout"], false)
								DespawnFacility()
							end
						elseif k == "Doomsday Finale" then
							if IsPedInVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), false) then
								FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), true)
								TeleportIntoInteriorVehicle(v["locout"], false)
							else
								FreezeEntityPosition(PlayerPedId(), true)
								TeleportIntoInterior(v["locout"], false)
							end
						else
							FreezeEntityPosition(PlayerPedId(), true)
							TeleportIntoInterior(v["locout"], false)
						end
					end
				end
				
			end
		end
	end
end)

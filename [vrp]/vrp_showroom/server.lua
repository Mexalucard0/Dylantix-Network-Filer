local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_showroom")
Gclient = Tunnel.getInterface("vRP_garages","vRP_showroom")

local cfg = module("vrp_showroom","cfg/config")
local vehgarage = cfg.showgarage


-- vehicle db / garage and lscustoms compatibility
MySQL.createCommand("vRP/showroom_columns", [[
ALTER TABLE vrp_user_vehicles ADD veh_type varchar(255) NOT NULL DEFAULT 'default' ;
ALTER TABLE vrp_user_vehicles ADD vehicle_plate varchar(255) NOT NULL;
]])
--MySQL.query("vRP/showroom_columns")

MySQL.createCommand("vRP/add_custom_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,@veh_type)")

-- SHOWROOM
RegisterServerEvent('veh_SR:CheckMoneyForVeh')
AddEventHandler('veh_SR:CheckMoneyForVeh', function(vehicle, vehicle_name, price, veh_type)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
		vRP.prompt({player,"Er du sikker på, at du vil købe køretøjet? (ja/nej)","",function(player,answer)
			if string.lower(answer) == "ja" then
			if #pvehicle > 0 then
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Du ejer allerede dette køretøj.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
			else
			   for i=1, #vehgarage.vehicles do
				 if vehgarage.vehicles[i].model == vehicle and vehgarage.vehicles[i].costs == price then
					if vRP.tryFullPayment({user_id,price}) then
					  vRP.getUserIdentity({user_id, function(identity)
						MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
						end})

						TriggerClientEvent('veh_SR:CloseMenu', player, vehicle, veh_type)
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du betalte <b style='color: #DB4646'>"..price.." DKK</b> for en " ..vehicle_name, type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					else
						TriggerClientEvent("pNotify:SendNotification", player,{text = "Du har ikke råd til at købe dette køretøj.", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},killer = true})
					  end
					end
				  end
				end
			else
				TriggerClientEvent("pNotify:SendNotification", player,{text = "Købet blev afbrudt, da du ikke bekræftede købet.", type = "error", queue = "global", timeout = 5000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		end})
      end)
  end)

  RegisterServerEvent('veh_SR:CheckMoneyForBasicVeh')
AddEventHandler('veh_SR:CheckMoneyForBasicVeh', function(user_id, vehicle, price ,veh_type)
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
	if #pvehicle > 0 then
		vRPclient.notify(player,{"~r~Vehicle already owned."})
		vRP.giveMoney({user_id,price})
	else
        vRPclient.notify(player,{"Paid ~r~"..price.."$."})
		vRP.getUserIdentity({user_id, function(identity)
          MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
		end})
		Gclient.spawnBoughtVehicle(player,{veh_type, vehicle})
	end
  end)
end)
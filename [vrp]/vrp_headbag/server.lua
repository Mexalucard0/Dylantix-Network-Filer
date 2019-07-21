local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_headbag")

RegisterServerEvent('closest')
AddEventHandler('closest', function()
	local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  
  if vRP.tryGetInventoryItem({user_id,"pose",1,true}) then
    vRPclient.getNearestPlayer(player,{10},function(nplayer)
      if nplayer ~= nil then
        TriggerClientEvent('pune_headbag', nplayer)
      else
        vRPclient.notify(player,{"Ingen spillere i nærheden!"})
      end
    end)
  end
end)




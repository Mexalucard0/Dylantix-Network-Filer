-- OOC kan findes i [system]/chat/sv_chat.lua
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");

	local user_id = vRP.getUserId({source})

	if string.lower(sm[1]) == "/twt" then
		CancelEvent()
		vRP.getUserIdentity({user_id, function(identity)
			TriggerClientEvent('chatMessage', -1, "Twitter | ^7@".. identity.firstname.. "_".. identity.name, {85, 172, 238}, string.sub(msg, 6))
		end})
	end

	if string.lower(sm[1]) == "/twitter" then
		CancelEvent()
		vRP.getUserIdentity({user_id, function(identity)
			TriggerClientEvent('chatMessage', -1, "Twitter | ^7@".. identity.firstname.. "_".. identity.name, {85, 172, 238}, string.sub(msg, 10))
		end})
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
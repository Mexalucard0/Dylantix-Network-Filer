RegisterServerEvent('chatCommandEntered')
RegisterServerEvent('chatMessageEntered')

AddEventHandler('chatMessageEntered', function(id, color, message)
    if not id or not color or not message or #color ~= 3 then
        return
    end
	
	name = GetRealPlayerName(id)
	
    TriggerEvent('chatMessage', source, name, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, color, message)
    end
end)

-- Send chat messages to discord :)
AddEventHandler('chatMessage', function(source, name, message)
	if message == nil or message == '' then return FALSE end
	PerformHttpRequest('https://canary.discordapp.com/api/webhooks/523173635327000576/rqHS_1hIIwbuBc5prrZe-23nMDLtRZzJQzxRtaIEJO5qwBaVu12i-iWJYR0aCEeTZNTq', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end)

-- player join messages
AddEventHandler('playerActivated', function()
    TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetRealPlayerName(source) .. ' joinede.')
end)

AddEventHandler('playerDropped', function(reason)
    TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetRealPlayerName(source) ..' forlod (' .. reason .. ')')
end)

-- say command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "say" then
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', -1, 'Borgmesteren', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)

-- tell command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "tell" then
        local target = table.remove(args, 1)
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', tonumber(target), 'Borgmesteren', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)
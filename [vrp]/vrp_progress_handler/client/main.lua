local show = false

function openGui(title, time, type, event, args)
  if title == "" or title == nil or time == "" or time == nil or type == "" or type == nil or event == "" or event == nil then
    return
  end

  if show == false then
    show = true
    SendNUIMessage(
      {
        show = true,
        title = title,
        time = time,
        type = type,
        event = event,
        args = args
      }
    )
  else
    TriggerEvent(
      "pNotify:SendNotification",
      {
        text = Config.Language.PleaseWait,
        type = "info",
        timeout = (15000),
        layout = "bottomCenter",
        queue = "global"
      }
    )
  end
end

function closeGui()
  show = false
  SendNUIMessage({show = false})
end

function runEvent(data)
  if data.type == "client" then
    TriggerEvent(data.event)
  end
  if data.type == "server" then
    TriggerServerEvent(data.event, data.args)
  end
end

RegisterNetEvent("vrp_progress_handler:open")
AddEventHandler(
  "vrp_progress_handler:open",
  function(title, time, type, event, args)
    openGui(title, time, type, event, args)
  end
)

RegisterNUICallback(
  "close",
  function(data)
    closeGui()
    runEvent(data)
  end
)

RegisterCommand(
  "progressbar",
  function(source, args)
    TriggerEvent(
      "vrp_progress_handler:open",
      "My title",
      "server",
      "vrp_progress_handler:demo",
      {"random string"}
    )
  end
)

Citizen.CreateThread(
  function()
    while true do
      if show then
        DisableControlAction(0, 21, true) -- disable sprint
        DisableControlAction(0, 24, true) -- disable attack
        DisableControlAction(0, 25, true) -- disable aim
        DisableControlAction(0, 47, true) -- disable weapon
        DisableControlAction(0, 58, true) -- disable weapon
        DisableControlAction(0, 263, true) -- disable melee
        DisableControlAction(0, 264, true) -- disable melee
        DisableControlAction(0, 257, true) -- disable melee
        DisableControlAction(0, 140, true) -- disable melee
        DisableControlAction(0, 141, true) -- disable melee
        DisableControlAction(0, 142, true) -- disable melee
        DisableControlAction(0, 143, true) -- disable melee
        DisableControlAction(0, 75, true) -- disable exit vehicle
        DisableControlAction(27, 75, true) -- disable exit vehicle
      end
      Citizen.Wait(0)
    end
  end
)

AddEventHandler(
  "onResourceStop",
  function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)

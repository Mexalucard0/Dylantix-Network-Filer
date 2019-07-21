RegisterServerEvent("vrp_progress_handler:demo")
AddEventHandler(
    "vrp_progress_handler:demo",
    function(args)
        print("Demo")
        print(args[1])
    end
)

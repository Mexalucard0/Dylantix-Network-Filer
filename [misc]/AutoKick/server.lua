RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "[AutoKick] Du er blevet Kicked for at stå stille i 10min.")
end)
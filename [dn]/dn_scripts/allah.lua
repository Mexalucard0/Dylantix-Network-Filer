local tiempo = 4000 -- 1000 ms = 1s
local isTaz = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsPedBeingStunned(GetPlayerPed(-1)) then
			
			local viewmode = GetFollowPedCamViewMode()
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
			SetFollowPedCamViewMode(4)
			
		end
		
		if IsPedBeingStunned(GetPlayerPed(-1)) and not isTaz then

			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
			SetFollowPedCamViewMode(4)
			
		elseif not IsPedBeingStunned(GetPlayerPed(-1)) and isTaz then
			SetFollowPedCamViewMode(4)
			isTaz = false
			Wait(5000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(10000)

			SetFollowPedCamViewMode(1)
      		SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)
-- CONFIG --

-- Blacklisted weapons
weaponblacklist = {
	"WEAPON_MINIGUN",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_STICKYBOMB",
	"WEAPON_GRENADE",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_RAILGUN",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_FIREWORK",
	"WEAPON_MINIGUN",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_DBSHOTGUN",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_SWEEPERSHOTGUN",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_GUSENBERG",
	"WEAPON_COMBATPDW",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_COMBATMG",
	"WEAPON_MG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_SMG_MK2",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_MICROSMG",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_FLAREGUN",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_SNSPISTOL",
	--"WEAPON_PISTOL50",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_PIPEWRENCH",
	"WEAPON_POOLCUE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_REVOLVER"

}

-- Don't allow any weapons at all (overrides the blacklist)
disableallweapons = false

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			nothing, weapon = GetCurrentPedWeapon(playerPed, true)

			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					sendForbiddenMessage("Dette våben er ikke tilladt!!")
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(weaponblacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end

	return false
end
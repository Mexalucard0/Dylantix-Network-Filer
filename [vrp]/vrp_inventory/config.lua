Config = {}

Config.OpenMenu = 57 -- Key: U
Config.AntiSpamCooldown = 2
Config.Language = {
    Title = "Rygsæk",
    PleaseWait = "Vent venligst...",
    Error = "Der opstod et problem.",
    WarningTitle = "Advarsel",
    WeaponNotEquipped = "Du har ikke taget våbnet i brug endnu.",
    CannotBeUsed = "Denne genstand kan ikke benyttes fra dit rygsæk",
    NotEnoughtSpace = "Personen har ikke plads i sin taske",
    NoNearby = "Ingen personer i nærheden"
}

items = {}
-- Random shit
items["Hash"] = {"none", 0, "weed.png"}
items["dirty_money"] = {"none", 0, "cash.png"}
-- Heal
items["pills"] = {"heal", 0, "pills.png"}
-- Drinks
items["water"] = {"drink", -25, "water.png"}
-- Food
items["bread"] = {"food", -10, "bread.png"}
-- Weapons
items["wbody|WEAPON_COMBATPISTOL"] = {"weapon", 0, "combatpistol.png"}
-- Ammo
items["wammo|WEAPON_COMBATPISTOL"] = {"ammo", 0, "pistol_ammo.png"}
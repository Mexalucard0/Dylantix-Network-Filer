-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
local emergency_male = { model = "s_m_m_paramedic_01" }
local emergency_female = { model = "s_f_y_scrubs_01" }
local fbi_male = { model = "s_m_m_ciasec_01" }
local fbi_female = { model = "ig_michelle" }
local sheriff_male = { model = "s_m_y_sheriff_01" }
local sheriff_female = { model = "s_f_y_ranger_01"}
local cop_male = { model = "s_m_y_cop_01" }
local cop_female = { model = "s_f_y_cop_01" }
local deputy_male = { model = "s_m_y_ranger_01" }

--s_m_m_paramedic_01
--s_f_y_scrubs_01
--mp_m_freemode_01
--mp_f_freemode_01


for i=0,19 do
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["Politi"] = {
    _config = { permissions = {"police.cloakroom"} },
    ["Mandeuniform"] = {
    modelhash = "s_m_y_sheriff_01"
    },
    ["Kvindeuniform"] = {
    modelhash = "s_f_y_cop_01"
    },
    ["Politiassistent"] = {
    modelhash = "s_m_m_prisguard_01"
    },
  	["Motorcykelbetjent"] = {
    modelhash = "s_m_y_hwaycop_01"
    }
  },
  ["AKS"] = {
    _config = { permissions = {"aks.cloakroom"} },
    ["Mandeuniform"] = {
    modelhash = "s_m_y_sheriff_01"
    },
    ["Kvindeuniform"] = {
    modelhash = "s_f_y_cop_01"
  	},
   	["Motorcykelbetjent"] = {
    modelhash = "s_m_y_hwaycop_01"
    },
  	["AKS Uniform"] = {
    modelhash = "s_m_y_swat_01"
    }
  },
  ["PET"] = {
    _config = { permissions = {"pet.cloakroom"} },
    ["Mandeuniform"] = {
    modelhash = "s_m_y_sheriff_01"
    },
    ["Kvindeuniform"] = {
    modelhash = "s_f_y_cop_01"
  	},
  	["Motorcykelbetjent"] = {
    modelhash = "s_m_y_hwaycop_01"
    },
    ["Pet Uniform"] = {
    modelhash = "s_m_m_ciasec_01"
    }
  },
  ["Elev"] = {
    _config = { permissions = {"elev.cloakroom"} },
    ["Mandeuniform"] = {
    modelhash = "s_m_y_sheriff_01"
    },
    ["Kvindeuniform"] = {
    modelhash = "s_f_y_cop_01"
    }
  },
  ["EMS"] = {
    _config = { permissions = {"ems.vehicle"} },
    ["Mand-Læge"] = {
    modelhash = "s_m_m_paramedic_01"
    },
    ["Mand-Ambulance"] = {
      modelhash = "s_m_y_blackops_01"
    },
    ["Forsker"] = {
      modelhash = "s_m_m_scientist_01"
    },
    ["Mand-Doktor"] = {
      modelhash = "s_m_m_doctor_01"
    }
  },
  ["Barn"] = {
    _config = { permissions = {"barn.cloakroom"} },
    ["Barn skin"] = {
    modelhash = "Child"
    }
  },
  ["Pige"] = {
    _config = { permissions = {"pige.cloakroom"} },
    ["Pige skin"] = {
    modelhash = "MaiCasual"
    }
  },
  ["Mekaniker"] = {
    _config = { permissions = {"mekaniker.cloakroom"} },
    ["Falck"] = {
    modelhash = "s_m_y_fireman_01"
    }
  },
  ["Ledelse"] = {
    _config = { permissions = {"ledelse.cloakroom"} },
  	["Vicerigspolitichef"] = {
    modelhash = "a_m_m_fatlatin_01"
    },
    ["Mandeuniform"] = {
    modelhash = "s_m_y_sheriff_01"
    },
    ["Kvindeuniform"] = {
    modelhash = "s_f_y_cop_01"
	  },
  	["Motorcykelbetjent"] = {
    modelhash = "s_m_y_hwaycop_01"
    },
    ["Pet Uniform"] = {
    modelhash = "s_m_m_ciasec_01"
	  },
 	  ["AKS Uniform"] = {
    modelhash = "s_m_y_swat_01"
    }
  }
}

cfg.cloakrooms = {
  {"Politi", 459.28167724609,-992.85284423828,30.689613342285}, -- Midtby
  {"AKS", 459.28167724609,-992.85284423828,30.689613342285}, -- Midtby
  {"PET", 459.28167724609,-992.85284423828,30.689613342285}, -- Midtby
  {"Ledelse", 459.28167724609,-992.85284423828,30.689613342285}, -- Midtby
  {"Elev", 459.28167724609,-992.85284423828,30.689613342285}, -- Midtby
  {"Barn", -135.63905334473,-951.76519775391,21.27684211731},
  {"Pige", 429.3342590332,-807.56103515625,29.491144180298},
  {"Mekaniker", -227.95092773438,-2661.0834960938,6.0002975463868}, -- Mekaniker
  {"EMS",270.19467163086,-1363.26171875,24.537784576416}, -- Hospital
}


return cfg

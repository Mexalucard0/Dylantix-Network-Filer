
local cfg = {}

-- city hall position
cfg.city_hall =	{238.15492248535,-412.31781005859,48.111946105957}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {181,4}

-- cost of a new identity
cfg.new_identity_cost = 1000

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "DDDDDDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
  "Skift dette"
}

cfg.random_last_names = {
  "ved rådhuset"
}

return cfg

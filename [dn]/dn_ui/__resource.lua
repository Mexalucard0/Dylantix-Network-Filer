resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	--	"client.lua", --Basis UI
	--	"disclaimer.lua", --Disclaimer som popper op.
		"noaim.lua", --Ingen dot på skærmen
		"noradar.lua" --Ingen radar på gåben
}

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/bg-img.png',
  'ui/script.js'
}

return {
	run = function()
		fassert(rawget(_G, "new_mod"), "SoTalented must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("SoTalented", {
			mod_script       = "scripts/mods/SoTalented/SoTalented",
			mod_data         = "scripts/mods/SoTalented/SoTalented_data",
			mod_localization = "scripts/mods/SoTalented/SoTalented_localization"
		})
	end,
	packages = {
		"resource_packages/SoTalented/SoTalented"
	}
}

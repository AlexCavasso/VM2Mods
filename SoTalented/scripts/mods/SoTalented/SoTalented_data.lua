local mod = get_mod("SoTalented")

-- Everything here is optional. You can remove unused parts.
return {
	name = "SoTalented",                            -- Readable mod name
	description = mod:localize("mod_description"),  -- Mod description
	is_togglable = true,                            -- If the mod can be enabled/disabled
	options = {
		widgets = {
			{
				setting_id = "gr_scav_settings",
				type = "group",
				sub_widgets = {
					{
						setting_id = "scav_style",
						type = "dropdown",
						tooltip = "scav_style_tooltip",
						default_value = 0,
						options = {
							{text = "scav_opt_excl", value = 0},
							{text = "scav_opt_items", value = 1},
							{text = "scav_opt_add", value = 2}
						}
					},
					{
						setting_id = "scav_pot_chance",
						type = "numeric",
						tooltip = "scav_pot_chance_tool",
						default_value = 0.33,
						range = {0, 1},
						decimals_number = 2
					},
					{
						setting_id = "scav_gren_chance",
						type = "numeric",
						tooltip = "scav_gren_chance_tool",
						default_value = 0.25,
						range = {0, 1},
						decimals_number = 2
					}
				}
			},
			{
				setting_id = "gr_regen_settings",
				type = "group",
				sub_widgets = {
					{
						setting_id = "ker_ally_ammo_regen",
						type = "checkbox",
						tooltip = "ker_ally_ammo_tooltip",
						default_value = false
					},
					{
						setting_id = "ker_hp_cap",
						type = "numeric",
						tooltip = "ker_cap_tooltip",
						default_value = 0.50,
						range = {0, 1},
						decimals_number = 2
					},
					{
						setting_id = "ker_hp_amt",
						type = "numeric",
						tooltip = "ker_amt_tooltip",
						default_value = 4.5,
						range = {0, 250},
						decimals_number = 2
					},
					{
						setting_id = "ker_ammo_amt",
						type = "numeric",
						tooltip = "ker_ammo_tooltip",
						default_value = 0.04,
						range = {0, 1},
						decimals_number = 2
					}
				}
			}
		}
	}
}